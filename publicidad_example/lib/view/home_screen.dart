import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:publicidad_example/main_store/main_state.dart';
import 'package:publicidad_example/view_model/ads_state.dart';

import 'buttons/diamonds_button.dart';
import 'buttons/heart_button.dart';
import 'cards/diamonds_card.dart';
import 'cards/lives_card.dart';
import 'native_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AdsState adsState;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      adsState.createBanner();
      adsState.createInterstitialAd();
      adsState.createInterstitialRewardedAd();
      adsState.createRewardedAd();
      adsState.createNativeAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    adsState = Provider.of<MainState>(context).adsState;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                LivesCard(),
                DiamondsCard(),
                ElevatedButton(
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => NativeScreen()));
                    },
                    child: Text("Publicidad nativa")),
                ElevatedButton(
                    onPressed: () async {
                      await adsState.interstitialAd!.value.show();
                    },
                    child: Text("Abrir intersticiales")),
              ],
            ),
          ),
          Observer(
              builder: (_) => Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    height: double.parse(AdSize.banner.height.toString()),
                    width: double.parse(AdSize.banner.width.toString()),
                    color: Colors.blue,
                    margin: EdgeInsets.all(10),
                    child: adsState.bannerAd != null
                        ? AdWidget(
                            ad: adsState.bannerAd!.value,
                          )
                        : Text("Cargando"),
                  )))
        ],
      ),
    );
  }
}
