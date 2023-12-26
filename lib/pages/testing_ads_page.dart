import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
// import 'package:santa_app_2024/ads_services/iron_source.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';

class IronSourceAdsTestPage extends StatefulWidget {
  @override
  _IronSourceAdsTestPageState createState() => _IronSourceAdsTestPageState();
}

class _IronSourceAdsTestPageState extends State<IronSourceAdsTestPage> {
  @override
  void initState() {
    super.initState();

    // Initialize IronSource SDK (Ensure you have integrated IronSource SDK in your project)
    // IronSource.initWithAppKey("YOUR_IRONSOURCE_APP_KEY");
    // initIronSource();
    // Load Interstitial ad
    IronSource.loadInterstitial();
    dispalyAdBanner(bannerAdMob);
  }

  void _showBannerAd() async {
    try {
      await IronSource.loadBanner(
          size: IronSourceBannerSize.BANNER,
          position: IronSourceBannerPosition.Bottom);
      await IronSource.displayBanner();
    } catch (e) {
      print("Error displaying banner: $e");
    }
  }

  void _showInterstitialAd() async {
    if (await IronSource.isInterstitialReady()) {
      IronSource.showInterstitial();
    } else {
      print("Interstitial ad is not ready yet.");
    }
  }

  void _showRewardedVideoAd() async {
    IronSource.showRewardedVideo().then((result) {
      // if (result == IronSourceReward.SUCCESS) {
      //   print("Rewarded Video ad completed successfully.");
      // } else if (result == IronSourceReward.FAILURE) {
      //   print("Rewarded Video ad failed.");
      // }
    });
  }

  BannerAd? bannerAdMob;
  bool isBannerAdMobLoaded = false;

  void dispalyAdBanner(BannerAd? adBanenr) {
    final adUnitId = Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/2934735716';

    adBanenr = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          print('$ad this ad has been loaded successfuly , thanks.');
          setState(() {
            isBannerAdMobLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          print('BannerAd failed to load: $err');
          isBannerAdMobLoaded = false;
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IronSource Ads Test Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showBannerAd,
              child: Text('Show Banner Ad'),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Show Admob Banner Ad'),
            // ),
            bannerAdMob != null
                ? Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SafeArea(
                        child: SizedBox(
                          width: bannerAdMob!.size.width.toDouble(),
                          height: bannerAdMob!.size.height.toDouble(),
                          child: AdWidget(ad: bannerAdMob!),
                        ),
                      ),
                    ),
                  )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showInterstitialAd,
              child: Text('Show Interstitial Ad'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showRewardedVideoAd,
              child: Text('Show Rewarded Video Ad'),
            ),
            // ConstrainedBox(
            //   constraints: const BoxConstraints(
            //     minWidth: 320, // minimum recommended width
            //     minHeight: 90, // minimum recommended height
            //     maxWidth: 330,
            //     maxHeight: 100,
            //   ),
            //   child: const NativeAdWidget(),
            // )
            const NativeAdWidget(maxWidth: 330,maxHeight: 100,adSize: TemplateType.small,),
          ],
        ),
      ),
    );
  }
}
