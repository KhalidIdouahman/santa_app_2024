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
      print("Error displaying my ironSource banner: $e");
    }
  }

  @override
  void onAdLoaded(IronSourceAdInfo adInfo) {
    print("onAdLoaded my ironSource : $adInfo");
  }

  @override
  void onAdLoadFailed(IronSourceError error) {
    print(" my ironSource Banner - onAdLoadFailed Error:$error");
    IronSource.destroyBanner();
    // showBannerAd();
  }

  @override
  void onAdClicked(IronSourceAdInfo adInfo) {
    print(" my ironSource Banner - onAdClicked: $adInfo");
  }

  @override
  void onAdScreenDismissed(IronSourceAdInfo adInfo) {
    print(" my ironSource Banner - onAdScreenDismissed: $adInfo");
  }

  @override
  void onAdScreenPresented(IronSourceAdInfo adInfo) {
    print(" my ironSource Banner - onAdScreenPresented: $adInfo");
  }

  @override
  void onAdLeftApplication(IronSourceAdInfo adInfo) {
    print(" my ironSource Banner - onAdLeftApplication: $adInfo");
  }
}
