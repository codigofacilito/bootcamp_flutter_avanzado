import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

import '../../../main_store/main_state.dart';
import '../../../res/colors_app.dart';
import '../../../view_model/purchases_state.dart';

class ProductCard extends StatelessWidget{
  late PurchasesState purchasesState;
  int index;
  ProductCard(this.index);
  @override
  Widget build(BuildContext context) {
    purchasesState = Provider.of<MainState>(context).purchasesState;
    ProductDetails productDetails = purchasesState.products[index];

    TextTheme theme = Theme.of(context).textTheme;
    // TODO: implement build
   return ListTile(
         leading:SvgPicture.asset(
             "assets/images/coin.svg",
             width: 50,
             height: 50,
         ),
         trailing:SizedBox(
             width: 100,
             child: ElevatedButton(onPressed: (){

               //crear los siguientes metodos en purchasesState
               purchasesState.addCurrentProduct(productDetails);
               purchasesState.buyProduct();

             }, child: Text(productDetails.price),style: ElevatedButton.styleFrom(
                 backgroundColor: blue,
                 foregroundColor: Colors.white,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),)
             ),)),
         title:Text(productDetails.title,style: theme.titleSmall!.copyWith(color: blue),),
         subtitle:  Text(productDetails.description,style: theme.bodyMedium!.copyWith(color: blue),),
      );
  }

}