import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';

typedef CallbackAction = void Function();

class ImagePage extends StatefulWidget {
  // this index of the clicked img in the wallpaper .
  final int imgIndex;
  final String imgUrl;

  ImagePage({super.key, required this.imgIndex, required this.imgUrl});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late PageController _pageController;
  late int _currentIndex;

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
                  itemCount: imagesList.length,
                  itemBuilder: (context, index) {
                    return buildImage(
                      imageIndex: index,
                      // it is necessare to get the imgUrl from the list to display the image in the right index .
                      imageUrl: imagesList[index],
                      shareBtn: buildImageBtn(Icons.save_alt_rounded, () {
                        print("downloaded");
                      }),
                      downloadBtn: buildImageBtn(Icons.share, () {
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
        ));
  }

  Widget buildImage({
    required int imageIndex,
    required String imageUrl,
    required Widget shareBtn,
    required Widget downloadBtn,
  }) {
    return Hero(
      tag: imageIndex,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 50),
          alignment: Alignment.bottomCenter,
          // color: Colors.black.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              shareBtn,
              const SizedBox(width: 50),
              downloadBtn,
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageBtn(IconData icon, CallbackAction onBtnClicked) {
    return GestureDetector(
      onTap: onBtnClicked,
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
