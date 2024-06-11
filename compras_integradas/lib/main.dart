import 'dart:async';

import 'package:compras_integradas/main_store/main_state.dart';
import 'package:compras_integradas/view/purchases/screens/get_premium_screen.dart';
import 'package:compras_integradas/view_model/purchases_state.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

import 'navigation/navigation_app.dart';
import 'navigation/route.dart';

void main() {
  runApp(Provider(create:(_)=>MainState(),child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: mainScreen,
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late  PurchasesState purchasesState;
late StreamSubscription<List<PurchaseDetails>> subscription;


@override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp)=>loadSubs);
  }

  void loadSubs(){
  InAppPurchase.instance.restorePurchases();
  subscription = InAppPurchase.instance.purchaseStream.listen((List<PurchaseDetails> purchaseDetailsList) {
    purchasesState.listenToPurchaseUpdate(purchaseDetailsList);
  },
  onDone: (){
    subscription.cancel();
  },onError: (Object error){

      });
}
  @override
  Widget build(BuildContext context) {
   purchasesState = Provider.of<MainState>(context).purchasesState;
    purchasesState.fetchSubsAndProducts();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, getPremiumScreen);
            }, child: Text("Abrir suscripciones")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, getProductsScreen);
            }, child: Text("Obtener monedas"))
          ],
        ),
      ),
    );
  }
}
