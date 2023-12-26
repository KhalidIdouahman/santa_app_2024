import 'dart:io';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:santa_app_2024/constants/app_id_and_urls.dart';


Future<void> initIronSource() async {
  final appKey = Platform.isAndroid
      ? ANDROID_APP_KEY
      : Platform.isIOS
          ? IOS_APP_KEY
          : throw Exception("Unsupported Platform");
  try {
    IronSource.setFlutterVersion('3.16.3'); // must be called before init
    IronSource.validateIntegration();
    // IronSource.setLevelPlayRewardedVideoListener(this);
    await IronSource.setAdaptersDebug(true);
    await IronSource.shouldTrackNetworkState(true);

    await IronSource.init(appKey: appKey, adUnits: [
      IronSourceAdUnit.RewardedVideo,
      IronSourceAdUnit.Banner,
      IronSourceAdUnit.Interstitial,
      IronSourceAdUnit.Offerwall,
    ]);
    // Do not use GAID or IDFA for this.
    await IronSource.setUserId("unique-application-user-id");
  } on PlatformException catch (e) {
    print(e);
  }
}


