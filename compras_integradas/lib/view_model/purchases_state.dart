import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:mobx/mobx.dart';

import '../main_store/main_state.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';

import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

part 'purchases_state.g.dart';

class PurchasesState = _PurchasesStateBase with _$PurchasesState;


abstract class _PurchasesStateBase with Store {
  late MainState mainState;
  _PurchasesStateBase({required this.mainState});

  InAppPurchase inAppPurchase = InAppPurchase.instance;
  List<String> subsIds = <String>["suscripcion-mensual-basico", "suscription-anual-basica"];

  List<String> productsIds= <String>[
    "50_monedas",
    "90_monedas",
    "500_monedas",
  ];

  List<ProductDetails> get _subsFake =>[
    ProductDetails(id: subsIds[0], title: 'Mensualidad', description:"Con el plan mensual obten todos lo benedicios.... ", price: ' \$300', rawPrice: 0.0, currencyCode: '1234'),
    ProductDetails(id: subsIds[1], title: 'Anualidad', description:"Con el plan anual obten todos lo benedicios.... ", price: ' \$1000', rawPrice: 0.0, currencyCode: '1234'),
  ];

  List<ProductDetails> get _productsFake =>[
    ProductDetails(id: productsIds[0], title: '50 Monedas ', description:"Obten 50 monedas.... ", price: ' \$10', rawPrice: 0.0, currencyCode: '1234'),
    ProductDetails(id: productsIds[1], title: '100 Monedas', description:"Obten 100 monedas.... ", price: ' \$50', rawPrice: 0.0, currencyCode: '1234'),
    ProductDetails(id: productsIds[2], title: '500 Monedas', description:"Obten 500 monedas.... ", price: ' \$200', rawPrice: 0.0, currencyCode: '1234'),

  ];

  @observable
  Observable<bool> isAvailable = Observable(false);

  @observable
  Observable<bool> purchasePending = Observable(false);

  @observable
  Observable<String> queryError = Observable("");

  @observable
  List<ProductDetails>subscriptions= <ProductDetails>[];

  @observable
  List<ProductDetails>products = <ProductDetails>[];

  @observable
  Observable<int> currentIndexSubs = Observable(0);

  @observable
  Observable<ProductDetails?>? currentSubs;

  @observable
  Observable<ProductDetails?>? currentProduct;

  @action
  addCurrentSubs(int index){
    currentIndexSubs.value = index;
    currentSubs = Observable(subscriptions[index]);
  }

  @action
  buyProduct() {
    PurchaseParam purchaseParam = PurchaseParam(
      productDetails: currentProduct!.value!,
      applicationUserName: null,
    );
    //No Consumible es producto se compra una vez
    inAppPurchase.buyConsumable(
        purchaseParam: purchaseParam);
  }

  @action
  getProduct(String key) {
    if (key.isNotEmpty) {
      return products.firstWhereOrNull((product) => product.id == key);
    }
  }
  @action
  buySubscription(){
    PurchaseParam purchaseParam = PurchaseParam(productDetails: currentSubs!.value!);
    inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
  }


  @action
  addCurrentProduct(ProductDetails productDetails){
    currentProduct = Observable(productDetails);
  }

  Future<void> fetchSubsAndProducts()async{
    //Informacion fake
    subscriptions = _subsFake;
    products = _productsFake;
    //inicializamos la subs
    addCurrentSubs(0);

    //Con queryProductDetails y el Id de producto podemos obtener la informacion de suscripciones y productos
    ProductDetailsResponse subscriptionDetailsResponse = await inAppPurchase.queryProductDetails(subsIds.toSet());
    _initStoreInfo(subscriptionDetailsResponse,isSubs: true);

    ProductDetailsResponse productsDetailsResponse = await inAppPurchase.queryProductDetails(productsIds.toSet());
    _initStoreInfo(productsDetailsResponse);

  }



   listenToPurchaseUpdate(List<PurchaseDetails> purchaseDetails){
    purchaseDetails.forEach((PurchaseDetails purchaseDetails) {
      if(_isPending(purchaseDetails)){
        purchasePending.value = true;
      }else if(_hasError(purchaseDetails)){
        queryError.value = purchaseDetails.error!.message;
      }else if(_isPurchase(purchaseDetails)){
        if(_isPurchaseSubs(purchaseDetails,currentSubs!.value!.id)){
          purchaseSubscription(purchaseDetails);
        }
      }
    });
  }

    purchaseSubscription(PurchaseDetails purchaseDetails){
    if(Platform.isIOS){
      SKPaymentTransactionWrapper skProducts = (purchaseDetails as AppStorePurchaseDetails).skPaymentTransaction;

    }else{
      PurchaseWrapper billingClientPurchase = (purchaseDetails as GooglePlayPurchaseDetails).billingClientPurchase;

    }
 }

  bool _isPurchaseSubs(PurchaseDetails purchaseDetails,String id)=> purchaseDetails.productID== id;

  bool _isPurchase(PurchaseDetails purchaseDetails)=> purchaseDetails.status== PurchaseStatus.purchased || purchaseDetails.status == PurchaseStatus.restored;

  bool _hasError(PurchaseDetails purchaseDetails)=> purchaseDetails.status== PurchaseStatus.error;

  bool _isPending(PurchaseDetails purchaseDetails)=> purchaseDetails.status== PurchaseStatus.pending;

  _initStoreInfo(ProductDetailsResponse response,{bool isSubs = false})async{
    isAvailable.value = await inAppPurchase.isAvailable();
    if(!isAvailable.value) return;

    if(response.productDetails.isNotEmpty){
      purchasePending.value = false;
    }
    if(response.error!=null){
      queryError.value = response.error!.message;
      purchasePending.value=false;
    }
    if(response.productDetails.isNotEmpty){
      if(isSubs){
        subscriptions = response.productDetails;
      }else{
        products = response.productDetails;
      }
    }
  }


  Future<void>init()async{
    try{
      await Future.wait([fetchSubsAndProducts()]);
    }catch(e){
      log(e.toString());
    }
  }
}