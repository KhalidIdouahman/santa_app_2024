import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/functionalities/download_img.dart';
import 'package:santa_app_2024/models/api_wallpaper_model.dart';
import 'package:santa_app_2024/widgets/wallpaper_widgets/build_img.dart';
import 'package:santa_app_2024/widgets/wallpaper_widgets/build_img_btn.dart';

import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/functionalities/share.dart';

typedef CallbackAction = void Function();

class ImagePage extends StatefulWidget {
  // this index of the clicked img in the wallpaper .
  final int imgIndex;
  // final String imgUrl;
  final List<ApiWallpaperModel> imgsList;

  ImagePage({super.key, required this.imgIndex, required this.imgsList});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late PageController _pageController;
  late int _currentIndex;

// this was to try downloading the image from the server.
  // String url =
  //     "http:\/\/twicev.com\/wallpaper2\/\/images\/wallpapers\/V1650903840.jpeg";

  @override
  void initState() {
    super.initState();
    // here i initialize the current index to the clicked image , and starts the pageview from it , else he will
    // always starts from the begenning .
    _currentIndex = widget.imgIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // this widget is for the dismisse effect for the image.
      body: DismissiblePage(
        onDismissed: () {
          Navigator.of(context).pop();
        },
        // this to be able to dismisse the image from top and bottom of the screen.
        direction: DismissiblePageDismissDirection.vertical,
        // this hero widget to distinct which image has being clicked
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: widget.imgsList.length,
                itemBuilder: (context, index) {
                  var wallpaperUrl = widget.imgsList[index].wallpaperUrlImg;
                  return buildImage(
                    imageIndex: index,
                    // it is necessare to get the imgUrl from the list to display the image in the right index .
                    imageUrl: wallpaperUrl,
                    shareBtn: buildImageBtn(Icons.save_alt_rounded, () {
                      // downloadImgWithPerimssion(url);
                      // _saveImg(url, true);
                      saveImage(wallpaperUrl);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("The image was downloaded successfully.")));
                      print("downloaded");
                    }),
                    downloadBtn: buildImageBtn(Icons.share, () {
                      shareData(
                        message:
                            "Take a look to this beautiful app , I am sure you will like it. 😍❤",
                        url: appUrl,
                      );
                      print("shared");
                    }),
                  );
                }),
            Positioned(
                top: 50,
                left: 20,
                child: buildImageBtn(
                  Icons.arrow_back,
                  () {
                    Navigator.pop(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
