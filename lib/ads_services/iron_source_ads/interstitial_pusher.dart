import 'package:flutter/material.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';

class IronSourceInterstitialPusher with LevelPlayInterstitialListener {
  //  i add this function to load an other interstitial after the first one is ended.
  final VoidCallback loadNextInterstitial;

  IronSourceInterstitialPusher({required this.loadNextInterstitial});

  // when the function return Future<void> it doesn't work ?
  // Future<void> showInterstitialAd() async {
  //   // await IronSource.loadInterstitial();
  //   if (await IronSource.isInterstitialReady()) {
  //     IronSource.showInterstitial();
  //   } else {
  //     print("Interstitial ad is not ready yet.");
  //   }
  // }

  void showInterstitialAd() async {
    if (await IronSource.isInterstitialReady()) {
      IronSource.showInterstitial();
    } else {
      print("Interstitial ad is not ready yet.");
    }
  }

  @override
  void onAdClicked(IronSourceAdInfo adInfo) {
    print("the ad is clicked");
    // TODO: implement onAdClicked
  }

  @override
  void onAdClosed(IronSourceAdInfo adInfo) {
    // this function is triggered after the interstitial of the wallpaper is finished,
    // than load the next interstitial.
    loadNextInterstitial();
    print("the ad is closed");
    // TODO: implement onAdClosed
  }

  @override
  void onAdLoadFailed(IronSourceError error) {
    print("the ad is failed to load");
    // TODO: implement onAdLoadFailed
  }

  @override
  void onAdOpened(IronSourceAdInfo adInfo) {
    print("the ad is opened");
    // TODO: implement onAdOpened
  }

  @override
  void onAdReady(IronSourceAdInfo adInfo) {
    print("the ad is ready");
    // TODO: implement onAdReady
  }

  @override
  void onAdShowFailed(IronSourceError error, IronSourceAdInfo adInfo) {
    print("the ad is show failed");
    // TODO: implement onAdShowFailed
  }

  @override
  void onAdShowSucceeded(IronSourceAdInfo adInfo) {
    print("the ad is show succeded");
    // TODO: implement onAdShowSucceeded
  }
}
