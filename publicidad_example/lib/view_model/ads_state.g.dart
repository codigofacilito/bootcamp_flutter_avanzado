// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AdsState on _AdsStateBase, Store {
  late final _$bannerAdAtom =
      Atom(name: '_AdsStateBase.bannerAd', context: context);

  @override
  Observable<BannerAd>? get bannerAd {
    _$bannerAdAtom.reportRead();
    return super.bannerAd;
  }

  @override
  set bannerAd(Observable<BannerAd>? value) {
    _$bannerAdAtom.reportWrite(value, super.bannerAd, () {
      super.bannerAd = value;
    });
  }

  late final _$interstitialAdAtom =
      Atom(name: '_AdsStateBase.interstitialAd', context: context);

  @override
  Observable<InterstitialAd>? get interstitialAd {
    _$interstitialAdAtom.reportRead();
    return super.interstitialAd;
  }

  @override
  set interstitialAd(Observable<InterstitialAd>? value) {
    _$interstitialAdAtom.reportWrite(value, super.interstitialAd, () {
      super.interstitialAd = value;
    });
  }

  late final _$rewardInterstitialAdAtom =
      Atom(name: '_AdsStateBase.rewardInterstitialAd', context: context);

  @override
  Observable<RewardedInterstitialAd>? get rewardInterstitialAd {
    _$rewardInterstitialAdAtom.reportRead();
    return super.rewardInterstitialAd;
  }

  @override
  set rewardInterstitialAd(Observable<RewardedInterstitialAd>? value) {
    _$rewardInterstitialAdAtom.reportWrite(value, super.rewardInterstitialAd,
        () {
      super.rewardInterstitialAd = value;
    });
  }

  late final _$rewardedAdAtom =
      Atom(name: '_AdsStateBase.rewardedAd', context: context);

  @override
  Observable<RewardedAd>? get rewardedAd {
    _$rewardedAdAtom.reportRead();
    return super.rewardedAd;
  }

  @override
  set rewardedAd(Observable<RewardedAd>? value) {
    _$rewardedAdAtom.reportWrite(value, super.rewardedAd, () {
      super.rewardedAd = value;
    });
  }

  late final _$liveRewardAtom =
      Atom(name: '_AdsStateBase.liveReward', context: context);

  @override
  Observable<int> get liveReward {
    _$liveRewardAtom.reportRead();
    return super.liveReward;
  }

  @override
  set liveReward(Observable<int> value) {
    _$liveRewardAtom.reportWrite(value, super.liveReward, () {
      super.liveReward = value;
    });
  }

  late final _$diamondRewardAtom =
      Atom(name: '_AdsStateBase.diamondReward', context: context);

  @override
  Observable<int> get diamondReward {
    _$diamondRewardAtom.reportRead();
    return super.diamondReward;
  }

  @override
  set diamondReward(Observable<int> value) {
    _$diamondRewardAtom.reportWrite(value, super.diamondReward, () {
      super.diamondReward = value;
    });
  }

  late final _$createInterstitialAdAsyncAction =
      AsyncAction('_AdsStateBase.createInterstitialAd', context: context);

  @override
  Future createInterstitialAd() {
    return _$createInterstitialAdAsyncAction
        .run(() => super.createInterstitialAd());
  }

  late final _$createInterstitialRewardedAdAsyncAction = AsyncAction(
      '_AdsStateBase.createInterstitialRewardedAd',
      context: context);

  @override
  Future createInterstitialRewardedAd() {
    return _$createInterstitialRewardedAdAsyncAction
        .run(() => super.createInterstitialRewardedAd());
  }

  late final _$createRewardedAdAsyncAction =
      AsyncAction('_AdsStateBase.createRewardedAd', context: context);

  @override
  Future createRewardedAd() {
    return _$createRewardedAdAsyncAction.run(() => super.createRewardedAd());
  }

  late final _$_AdsStateBaseActionController =
      ActionController(name: '_AdsStateBase', context: context);

  @override
  dynamic addLives(RewardItem rewardItem) {
    final _$actionInfo = _$_AdsStateBaseActionController.startAction(
        name: '_AdsStateBase.addLives');
    try {
      return super.addLives(rewardItem);
    } finally {
      _$_AdsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addDiamond(RewardItem rewardItem) {
    final _$actionInfo = _$_AdsStateBaseActionController.startAction(
        name: '_AdsStateBase.addDiamond');
    try {
      return super.addDiamond(rewardItem);
    } finally {
      _$_AdsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic createBanner() {
    final _$actionInfo = _$_AdsStateBaseActionController.startAction(
        name: '_AdsStateBase.createBanner');
    try {
      return super.createBanner();
    } finally {
      _$_AdsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bannerAd: ${bannerAd},
interstitialAd: ${interstitialAd},
rewardInterstitialAd: ${rewardInterstitialAd},
rewardedAd: ${rewardedAd},
liveReward: ${liveReward},
diamondReward: ${diamondReward}
    ''';
  }
}
