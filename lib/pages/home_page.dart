import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/widgets/header_of_home.dart';
import 'package:santa_app_2024/widgets/home_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            buildHeader(context, onSettingsClicked: () {
              print("settings clicked");
            }, onFavoriteClicked: () {
              print("favorite clicked");
            }),
            Expanded(
              child: ListView.builder(
                itemCount: homeItemsData.length,
                itemBuilder: (context, index) {
                  return buildHomeItem(
                    gredientColor: homeItemsData[index].color,
                    icon: homeItemsData[index].icon,
                    title: homeItemsData[index].title,
                    subtitle: homeItemsData[index].subtitle,
                    onItemClicked: () {
                      print(index);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
