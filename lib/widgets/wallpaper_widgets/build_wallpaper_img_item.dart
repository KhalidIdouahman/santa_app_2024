import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/interstitial_pusher.dart';
import 'package:santa_app_2024/models/api_wallpaper_model.dart';
import 'package:santa_app_2024/pages/wallpaper_page/image_page.dart';

class WallpaperItemsBuilderPage {
  final BuildContext wallpapersContext;
  final IronSourceInterstitialPusher wallpaperInterstitialAd;

  const WallpaperItemsBuilderPage(
      {required this.wallpapersContext, required this.wallpaperInterstitialAd});

  Widget buildWallpaperImgOfGridView({
    required int indexOfImg,
    required List<ApiWallpaperModel> wallpapersList,
  }) {
    return GestureDetector(
      onTap: () {
        wallpaperInterstitialAd.showInterstitialAd();
        Navigator.of(wallpapersContext).push(
          MaterialPageRoute(
            builder: (context) => ImagePage(
              imgIndex: indexOfImg,
              imgsList: wallpapersList,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
            tag: indexOfImg,
            child: CachedNetworkImage(
              imageUrl: wallpapersList[indexOfImg].wallpaperUrlImg,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridViewToShow4Wallpapers({
    required List<Widget> wallpapersGridList,
  }) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 0.7, // 0.8
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (int i = 0; i < wallpapersGridList.length; i++)
        wallpapersGridList[i],
      ],
    );
  }
}
