// import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
// import 'package:santa_app_2024/pages/wallpaper_page/image_page.dart';

import 'package:santa_app_2024/functionalities/fetching_data.dart';
import 'package:santa_app_2024/models/api_wallpaper_model.dart';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/interstitial_pusher.dart';
import 'package:santa_app_2024/constants/app_id_and_urls.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';
import 'package:santa_app_2024/widgets/wallpaper_widgets/build_wallpaper_img_item.dart';

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
            // return const Center(child: CircularProgressIndicator.adaptive());
            return const Center(
                child: Text(
              "Something went wrong , please try again!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ));
          }

          // this commented code is showing the images , and in the fifth image , i show the native ads ,
          // but it doesn't show well , and also he hides the image

          // final List<ApiWallpaperModel> wallpapers = snapshot.data!;
          // print(wallpapers.length);

          // return Padding(
          //   padding: const EdgeInsets.all(10),
          //   child: GridView.count(
          //     crossAxisCount: 2,
          //     shrinkWrap: true,
          //     mainAxisSpacing: 10,
          //     crossAxisSpacing: 10,
          //     // this to make the image like portrait mode , the height will be more than the width ,
          //     // if you want it to be stretched horizontaly , you make it above 1 , like 1.6 .
          //     childAspectRatio: 0.5, // 0.8
          //     children: [
          //       for (int i = 0; i < wallpapers.length; i++)
          //         GestureDetector(
          //           onTap: () {
          //             interstitialAd.showInterstitialAd();
          //             // this two lines are the same .
          //             // context.pushTransparentRoute(ImagePage(imgIndex: i , imgUrl: imagesList[i], ));
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (context) => ImagePage(
          //                   imgIndex: i,
          //                   imgsList: wallpapers,
          //                 ),
          //               ),
          //             );
          //           },
          //           // this for showing the ads in the wallpaper page.
          //           child: i % 4 != 0 || i == 0
          //               ? Container(
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey,
          //                     borderRadius: BorderRadius.circular(20),
          //                   ),
          //                   child: ClipRRect(
          //                     borderRadius: BorderRadius.circular(10),
          //                     child: Hero(
          //                       tag: i,
          //                       child: CachedNetworkImage(
          //                         imageUrl: wallpapers[i].wallpaperUrlImg,
          //                         fit: BoxFit.cover,
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //               : const NativeAdWidget(
          //                   maxWidth: 320,
          //                   maxHeight: 360,
          //                   adSize: TemplateType.medium,
          //                 ),
          //         )
          //     ],
          //   ),
          // );

          final List<ApiWallpaperModel> wallpapers = snapshot.data!;

          final WallpaperItemsBuilderPage wallpaperItemsBuilder =
              WallpaperItemsBuilderPage(
            wallpapersContext: context,
            wallpaperInterstitialAd: interstitialAd,
          );

          final List<List<Widget>> wallpapersListsOf4 = [];

          // this counter is the index of each image in the wallpapers list.
          int counter = 0;
          // this loop 1 time to fill a list with 4 images , that why length / 4.
          for (int i = 0; i < wallpapers.length / 4; i++) {
            List<Widget> internList = [];
            for (int j = 0; j < 4; j++) {
              internList.add(wallpaperItemsBuilder.buildWallpaperImgOfGridView(
                indexOfImg: counter,
                wallpapersList: wallpapers,
              ));
              // print(counter);
              counter++;
            }
            wallpapersListsOf4.add(internList);
          }

          final List<Widget> wallpapersWithNativeAd = [];

          // to fill the wallpapers list with the lists that contian 4 img for each, and between each list
          // i add a native ad widget 
          for (int i = 0; i < wallpapersListsOf4.length; i++) {
            if (i % 2 == 0) {
              wallpapersWithNativeAd.add(
                wallpaperItemsBuilder.buildGridViewToShow4Wallpapers(
                  wallpapersGridList: wallpapersListsOf4[i],
                ),
              );
            }
            else {
              wallpapersWithNativeAd.add(
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: NativeAdWidget(
                    maxWidth: 330,
                    maxHeight: 360,
                    adSize: TemplateType.medium,
                  ),
                ),
              );
            }
          }

          // and here i dispaly the the list that has the gridView with the images and the native ad.
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
            child: ListView(
              children: wallpapersWithNativeAd,
            ),
          );
        },
      ),
    );
  }
}
