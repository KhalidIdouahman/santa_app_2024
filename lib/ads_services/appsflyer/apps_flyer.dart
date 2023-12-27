import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:santa_app_2024/constants/app_id_and_urls.dart';

void initializeAppsFlyer() {
  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
    afDevKey: afDevKey,
    appId: appId,
    showDebug: true,
    timeToWaitForATTUserAuthorization: 50, // for iOS 14.5
    // appInviteOneLink: oneLinkID, // Optional field
    disableAdvertisingIdentifier: false, // Optional field
    disableCollectASA: false,
  ); // Optional field

  AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

  appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true);
}
