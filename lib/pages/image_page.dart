import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final int imgIndex;
  final String imgUrl;

  const ImagePage({super.key, required this.imgIndex, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // this widget is for the dismisse effect for the image.
      body: DismissiblePage(
        onDismissed: () {
          Navigator.of(context).pop();
        },
        // this to be able to dismisse the image from anywhere in the screen.
        direction: DismissiblePageDismissDirection.multi,
        // this hero widget to distinct any image has being clicked
        child: Hero(
          tag: imgIndex,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomCenter,
              // color: Colors.black.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("downloaded");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white70),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.save_alt_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  GestureDetector(
                    onTap: () {
                      print("shared");
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white70),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
