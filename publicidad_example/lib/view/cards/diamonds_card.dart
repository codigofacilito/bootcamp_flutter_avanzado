import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:publicidad_example/main_store/main_state.dart';
import 'package:publicidad_example/view_model/ads_state.dart';

import '../buttons/diamonds_button.dart';

class DiamondsCard extends StatelessWidget {
  late AdsState adsState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    adsState = Provider.of<MainState>(context).adsState;

    return   Card(margin: EdgeInsets.all(10),
          color: Colors.white,
          child:
       Padding(
         padding: EdgeInsets.all(10),
         child: Column(children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/diamond.svg",height: 50,width: 50,),
                SizedBox(width: 20,),
                Observer(
                    builder: (_) =>  Text(adsState.diamondReward.value.toString(),style: TextStyle(fontSize: 25),)),
              ]  ),
           SizedBox(height: 20,),
          DiamondsButton(),
        ],),));
  }
}
