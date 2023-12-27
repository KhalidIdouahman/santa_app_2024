// import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/pages/wallpaper_page/image_page.dart';

import 'package:santa_app_2024/functionalities/fetching_data.dart';
import 'package:santa_app_2024/models/api_wallpaper_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/interstitial_pusher.dart';
import 'package:santa_app_2024/constants/app_id_and_urls.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  final IronSourceInterstitialPusher interstitialAd =
      IronSourceInterstitialPusher(
    loadNextInterstitial: () {
      IronSource.loadInterstitial();
    },
  );

  @override
  void initState() {
    IronSource.loadInterstitial();
    IronSource.setLevelPlayInterstitialListener(interstitialAd);
    // getImagesList(urlApi: serverUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpapers"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getImagesList(urlApi: serverUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

        // i commented this because when the internet is off , it show the error message, and the server
        // link, so i make it show the progressIndecator.
          if (snapshot.hasError) {
            return const Center(child: CircularProgressIndicator.adaptive());
            // return Center(
            //     child: Text(
            //   snapshot.error.toString(),
            //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ));
          }

          final List<ApiWallpaperModel> wallpapers = snapshot.data!;
          print(wallpapers.length);

          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              // this to make the image like portrait mode , the height will be more than the width ,
              // if you want it to be stretched horizontaly , you make it above 1 , like 1.6 .
              childAspectRatio: 0.5, // 0.8
              children: [
                for (int i = 0; i < wallpapers.length; i++)
                  GestureDetector(
                    onTap: () {
                      interstitialAd.showInterstitialAd();
                      // this two lines are the same .
                      // context.pushTransparentRoute(ImagePage(imgIndex: i , imgUrl: imagesList[i], ));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ImagePage(
                            imgIndex: i,
                            imgsList: wallpapers,
                          ),
                        ),
                      );
                    },
                    // this for showing the ads in the wallpaper page.
                    child: i % 4 != 0 || i == 0 
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Hero(
                                tag: i,
                                child: CachedNetworkImage(
                                  imageUrl: wallpapers[i].wallpaperUrlImg,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : const NativeAdWidget(
                            maxWidth: 320,
                            maxHeight: 360,
                            adSize: TemplateType.medium,
                          ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
