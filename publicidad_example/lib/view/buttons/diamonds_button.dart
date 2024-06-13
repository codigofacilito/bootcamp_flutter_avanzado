import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:publicidad_example/main_store/main_state.dart';
import 'package:publicidad_example/view_model/ads_state.dart';

class DiamondsButton extends StatelessWidget {
  late AdsState adsState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    adsState = Provider.of<MainState>(context).adsState;

    return ElevatedButton(
        onPressed: () async {
          await adsState.rewardedAd!.value.show(
              onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
            adsState.addDiamond(reward);
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, foregroundColor: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Obtener Diamantes"),
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              "assets/images/diamond.svg",
              height: 30,
              width: 30,
            ),
            Text(
              "+20",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ));
  }
}
