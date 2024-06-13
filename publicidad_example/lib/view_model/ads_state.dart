

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobx/mobx.dart';

import '../main_store/main_state.dart';

part 'ads_state.g.dart';

class AdsState = _AdsStateBase with _$AdsState;

abstract class _AdsStateBase with Store {
  late MainState main;

  _AdsStateBase({required this.main});

  @observable
  Observable<BannerAd>?bannerAd;

  @observable
  Observable<InterstitialAd>? interstitialAd;

  @observable
  Observable<RewardedInterstitialAd>? rewardInterstitialAd;

  @observable
  Observable<RewardedAd>? rewardedAd;
  @observable
  Observable<NativeAd>? nativeAd;


  @observable
  Observable<int>liveReward = Observable(2);

  @observable
  Observable<int>diamondReward = Observable(0);

  @action
  addLives(RewardItem rewardItem){
    liveReward.value += int.parse(rewardItem.amount.toString());
  }

  @action
  addDiamond(RewardItem rewardItem){
    diamondReward.value += int.parse(rewardItem.amount.toString());
  }

  @action
  createBanner(){
    bannerAd = Observable(
      BannerAd(
        size: AdSize.banner,
        adUnitId: Platform.isAndroid?"ca-app-pub-7446763034188259/6697554418":"ca-app-pub-7446763034188259/3953623962",
        listener: BannerAdListener(
          onAdLoaded: (Ad ad){

          },
          onAdFailedToLoad: (Ad ad, LoadAdError error){
            print('$BannerAd failed $error');
            ad.dispose();
          },
        ),
        request: AdRequest(),
      )
    );

    bannerAd!.value.load();
  }

  @action
  createInterstitialAd() async{
    await InterstitialAd.load(
        adUnitId: Platform.isAndroid?
        "ca-app-pub-7446763034188259/5804394708":
        "ca-app-pub-7446763034188259/3953623962",
        request:  AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad){
              print("onAdLoaded");
              interstitialAd = Observable(ad);
            },
            onAdFailedToLoad:(LoadAdError error){
              print('$BannerAd failed $error');
            }));
  }

  @action
  createInterstitialRewardedAd() async{
    await RewardedInterstitialAd.load(
        adUnitId: Platform.isAndroid?"ca-app-pub-7446763034188259/7775951927":
        "ca-app-pub-7446763034188259/3953623962",
        request: AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
            onAdLoaded: (RewardedInterstitialAd ad){
              rewardInterstitialAd = Observable(ad);
            }, onAdFailedToLoad: (LoadAdError error){

        }));

  }

  @action
  createRewardedAd() async{
    await RewardedAd.load(
        adUnitId: Platform.isAndroid?"ca-app-pub-7446763034188259/5612823017": "ca-app-pub-7446763034188259/3953623962",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (RewardedAd ad){
              rewardedAd = Observable(ad);
            },
            onAdFailedToLoad: (LoadAdError error){

            }));
  }

  @action
  createNativeAd() async{
    nativeAd = Observable(
      NativeAd(
        adUnitId: Platform.isAndroid?"ca-app-pub-7446763034188259/3481096653": "ca-app-pub-7446763034188259/3953623962",
        request: AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (Ad ad){

          },
          onAdFailedToLoad: (Ad ad,LoadAdError error){
      }
        ),
        nativeTemplateStyle: NativeTemplateStyle(
          templateType: TemplateType.medium,
          mainBackgroundColor: Colors.white12,
          callToActionTextStyle: NativeTemplateTextStyle(
            size: 16
          ),
          primaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.black38,
            backgroundColor: Colors.white
          )
        )
      )
    );
    nativeAd!.value.load();
  }
}