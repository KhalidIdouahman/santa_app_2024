// import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/pages/wallpaper_page/image_page.dart';

class WallpaperPage extends StatefulWidget {
  const WallpaperPage({super.key});

  @override
  State<WallpaperPage> createState() => _WallpaperPageState();
}

class _WallpaperPageState extends State<WallpaperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallpapers"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.8,
          children: [
            for (int i = 0; i < imagesList.length; i++)
              GestureDetector(
                onTap: () {
                  // this two lines are the same .
                  // context.pushTransparentRoute(ImagePage(imgIndex: i , imgUrl: imagesList[i], ));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ImagePage(
                        imgIndex: i,
                        imgUrl: imagesList[i],
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
                      tag: i,
                      child: Image.asset(
                        imagesList[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
