
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../main_store/main_state.dart';
import '../../../res/colors_app.dart';
import '../../../view_model/purchases_state.dart';
import '../cards/subscription_card.dart';


class GetPremiumScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>GetPremiumScreenState();
}

class GetPremiumScreenState extends State<GetPremiumScreen>{


 bool isSelect=false;
  late PurchasesState purchasesState;
  @override
  Widget build(BuildContext context) {
     purchasesState = Provider.of<MainState>(context).purchasesState;
     TextTheme theme = Theme.of(context).textTheme;
    // TODO: implement build
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Text("Obtener premium",style: theme.headlineLarge,),
        Text("¡Desbloquea todo el poder de esta herramienta m"
            ""
            "óvil y disfruta de una experiencia digital como nunca antes!",style: theme.bodyLarge,),
        SvgPicture.asset(
            "assets/images/crown.svg",
            semanticsLabel: 'Acme Logo'
        ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: purchasesState.subscriptions.length,
              itemBuilder: (context, index) {
                return  SubscriptionCard(index);
              },
            ),
           SizedBox(
               width: double.infinity,
               child: ElevatedButton(onPressed: (){
                 purchasesState.buySubscription();
               }, child: Text("Obtener"),style: ElevatedButton.styleFrom(
              backgroundColor: blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),)
            ),))
      ],),
    )));
  }


}