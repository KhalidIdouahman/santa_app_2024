import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:santa_app_2024/constants/app_id_and_urls.dart';
// import 'package:santa_app_2024/constants/colors.dart';

class NativeAdWidget extends StatefulWidget {
  // i get this data to work with this class for both small and medium native ads.
  final double maxHeight;
  final double maxWidth;
  final TemplateType adSize;

  const NativeAdWidget({
    super.key,
    required this.maxWidth,
    required this.maxHeight,
    required this.adSize,
  });

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {

  NativeAd? nativeAd;
  bool _nativeAdIsLoaded = false;

  // Loads a native ad.
  void loadNativeAd() {
    nativeAd = NativeAd(
      adUnitId: nativeAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          setState(() {
            _nativeAdIsLoaded = false;
          });
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(templateType: widget.adSize),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    loadNativeAd();
  }

  @override
  void dispose() {
    nativeAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (nativeAd != null) {
      return Container(
        // all this design is hided by the ads, 
        // margin: const EdgeInsets.symmetric(vertical: 10),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: gredientColor1,
        //     begin: Alignment.topLeft,
        //     end: Alignment.topRight,
        //   ),
        //   borderRadius: BorderRadius.circular(20),
        // ),
        child: _nativeAdIsLoaded
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 320, // minimum recommended width
                  minHeight: 90, // minimum recommended height
                  maxWidth: widget.maxWidth,
                  maxHeight: widget.maxHeight,
                ),
                child: AdWidget(ad: nativeAd!),
              )
            : const SizedBox(),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
