// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// //  i don't work with this class it's just for testing.

// class OpenAppAdmobPusherAds {
//   // BannerAd? _bannerAd;
//   // bool _isLoaded = false;

//   static String get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       return 'ca-app-pub-3940256099942544/6300978111';
//     } else if (Platform.isIOS) {
//       return 'ca-app-pub-3940256099942544/2934735716';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get interstitialAdUnitId {
//     if (Platform.isAndroid) {
//       return "ca-app-pub-3940256099942544/1033173712";
//     } else if (Platform.isIOS) {
//       return "ca-app-pub-3940256099942544/4411468910";
//     } else {
//       throw new UnsupportedError("Unsupported platform");
//     }
//   }

//   static String get rewardedAdUnitId {
//     if (Platform.isAndroid) {
//       return "ca-app-pub-3940256099942544/5224354917";
//     } else if (Platform.isIOS) {
//       return "ca-app-pub-3940256099942544/1712485313";
//     } else {
//       throw new UnsupportedError("Unsupported platform");
//     }
//   }

//   // TODO: replace this test ad unit with your own ad unit.
//   final adUnitId = Platform.isAndroid
//       ? 'ca-app-pub-3940256099942544/6300978111'
//       : 'ca-app-pub-3940256099942544/2934735716';

//   /// Loads a banner ad.
//   void dispalyAdBanner(BannerAd? adBanenr, bool isAdBannerLoaded) {
//     adBanenr = BannerAd(
//       adUnitId: adUnitId,
//       request: const AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         // Called when an ad is successfully received.
//         onAdLoaded: (ad) {
//           print('$ad this ad has been loaded successfuly , thanks.');
//           isAdBannerLoaded = true;
//           // setState(() {
//           // _isLoaded = true;
//           // });
//         },
//         // Called when an ad request failed.
//         onAdFailedToLoad: (ad, err) {
//           print('BannerAd failed to load: $err');
//           isAdBannerLoaded = false;
//           // Dispose the ad here to free resources.
//           ad.dispose();
//         },
//         // Called when an ad opens an overlay that covers the screen.
//         onAdOpened: (Ad ad) {
//           print("ad is opened , thanks");
//         },
//         // Called when an ad removes an overlay that covers the screen.
//         onAdClosed: (Ad ad) {
//           print("ad is closed , thanks");
//         },
//         // Called when an impression occurs on the ad.
//         onAdImpression: (Ad ad) {
//           print("ad is impression , thanks");
//         },
//       ),
//     )..load();
//   }

//   Widget buildBannerAdWidget(BannerAd? bannerAd) {
//     if (bannerAd == null) {
//       return Container(); // Or any placeholder widget you want to display when ad is not loaded
//     }
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: SafeArea(
//         child: SizedBox(
//           width: bannerAd.size.width.toDouble(),
//           height: bannerAd.size.height.toDouble(),
//           child: AdWidget(ad: bannerAd),
//         ),
//       ),
//     );
//   }
// }
