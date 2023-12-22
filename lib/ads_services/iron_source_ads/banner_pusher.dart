import 'package:ironsource_mediation/ironsource_mediation.dart';

class IronSourceBannerPusher with LevelPlayBannerListener {
  
  void showBannerAd() async {
    try {
      await IronSource.loadBanner(
        size: IronSourceBannerSize.BANNER,
        position: IronSourceBannerPosition.Bottom,
      );
      await IronSource.displayBanner();
    } catch (e) {
      print("Error displaying banner: $e");
    }
  }

  @override
  void onAdLoaded(IronSourceAdInfo adInfo) {
    print("onAdLoaded: $adInfo");
  }

  @override
  void onAdLoadFailed(IronSourceError error) {
    print("Banner - onAdLoadFailed Error:$error");
    // showBannerAd();
  }

  @override
  void onAdClicked(IronSourceAdInfo adInfo) {
    print("Banner - onAdClicked: $adInfo");
  }

  @override
  void onAdScreenDismissed(IronSourceAdInfo adInfo) {
    print("Banner - onAdScreenDismissed: $adInfo");
  }

  @override
  void onAdScreenPresented(IronSourceAdInfo adInfo) {
    print("Banner - onAdScreenPresented: $adInfo");
  }

  @override
  void onAdLeftApplication(IronSourceAdInfo adInfo) {
    print("Banner - onAdLeftApplication: $adInfo");
  }
}
