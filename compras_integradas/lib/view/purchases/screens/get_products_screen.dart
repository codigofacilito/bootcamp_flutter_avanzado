
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main_store/main_state.dart';
import '../../../view_model/purchases_state.dart';
import '../cards/product_card.dart';


class GetProductsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>GetProductsScreenState();
}

class GetProductsScreenState extends State<GetProductsScreen>{

  late PurchasesState purchasesState;
  @override
  Widget build(BuildContext context) {
     purchasesState = Provider.of<MainState>(context).purchasesState;
     TextTheme theme = Theme.of(context).textTheme;
     print("monedas ${ purchasesState.products.length}");
    // TODO: implement build
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Text("Obtener monedas",style: theme.headlineLarge,),
          SizedBox(height: 100,),
          ListView.builder(
              shrinkWrap: true,
              itemCount: purchasesState.products.length,
              itemBuilder: (context, index) {
                return  ProductCard(index);
              },
            ),

      ],),
    )));
  }


}