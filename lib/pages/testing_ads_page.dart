import 'package:flutter/material.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
// import 'package:santa_app_2024/ads_services/iron_source.dart';

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
          ],
        ),
      ),
    );
  }
}
