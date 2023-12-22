import 'package:ironsource_mediation/ironsource_mediation.dart';

class IronSourceRewardedVideoPusher with LevelPlayRewardedVideoListener {
  Future<void> showRewardedVideo() async {
    IronSource.showRewardedVideo()
        .then((value) {})
        .onError((error, stackTrace) {
      print("The error why the video ad doesn't appeare is : $error");
    });
  }

  @override
  void onAdAvailable(IronSourceAdInfo adInfo) {
    print("the ad is available");
    // TODO: implement onAdAvailable
  }

  @override
  void onAdClicked(
      IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
    print("the ad is clicked");
    // TODO: implement onAdClicked
  }

  @override
  void onAdClosed(IronSourceAdInfo adInfo) {
    print("the ad is closed");
    // TODO: implement onAdClosed
  }

  @override
  void onAdOpened(IronSourceAdInfo adInfo) {
    print("the ad is opened");
    // TODO: implement onAdOpened
  }

  @override
  void onAdRewarded(
      IronSourceRewardedVideoPlacement placement, IronSourceAdInfo adInfo) {
    // TODO: implement onAdRewarded
    print("the ad is rewarded");
  }

  @override
  void onAdShowFailed(IronSourceError error, IronSourceAdInfo adInfo) {
    // TODO: implement onAdShowFailed
    print("the ad showing is failed");
  }

  @override
  void onAdUnavailable() {
    print("the ad is unavailable");
    // TODO: implement onAdUnavailable
  }
}
