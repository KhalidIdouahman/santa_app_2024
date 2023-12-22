import 'package:ironsource_mediation/ironsource_mediation.dart';

class IronSourceInterstitialPusher with LevelPlayInterstitialListener {

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
    // TODO: implement onAdClicked
  }

  @override
  void onAdClosed(IronSourceAdInfo adInfo) {
    // TODO: implement onAdClosed
  }

  @override
  void onAdLoadFailed(IronSourceError error) {
    // TODO: implement onAdLoadFailed
  }

  @override
  void onAdOpened(IronSourceAdInfo adInfo) {
    // TODO: implement onAdOpened
  }

  @override
  void onAdReady(IronSourceAdInfo adInfo) {
    // TODO: implement onAdReady
  }

  @override
  void onAdShowFailed(IronSourceError error, IronSourceAdInfo adInfo) {
    // TODO: implement onAdShowFailed
  }

  @override
  void onAdShowSucceeded(IronSourceAdInfo adInfo) {
    // TODO: implement onAdShowSucceeded
  }
}
