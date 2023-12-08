import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/chat_page.dart';
import 'package:santa_app_2024/pages/wallpaper_page/wallpapers_page.dart';
import 'package:santa_app_2024/widgets/home_widgets/header_of_home.dart';
import 'package:santa_app_2024/widgets/home_widgets/home_items.dart';
import 'package:santa_app_2024/widgets/home_widgets/side_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const userChat = UserChat(userName: "Santa", imgUrl: "assets/images/santa_calling_2.jpg" , userStatus: "Online");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // again i wrapped the body with the builder widget , to work with it's context to open the sidebar ,
      // because he needs a context inside the scaffold widget.
      // to show the sidebar
      drawer: const NavBar(),
      body: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildHeader(context, onSettingsClicked: () {
                Scaffold.of(context).openDrawer();
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
                        selectedItem(context, index);
                        // just for debug
                        print(index);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}

void selectedItem(BuildContext myContext, int index) {
  switch (index) {
    // case 0:
    //   // Navigator.pushReplacement(myContext,
    //   //     MaterialPageRoute(builder: (myContext) => const HomeScreen()));
    //   // print("sidebar item $index clicked.");
    //   break;
    case 0:
      Navigator.push(myContext,
          MaterialPageRoute(builder: (myContext) => const WallpaperPage()));
      break;
    case 1:
      Navigator.push(myContext, MaterialPageRoute(builder: (myContext) => const ChatPage(user: HomeScreen.userChat,)));
      // print("sidebar item $index clicked.");
      break;
    // case -1:
    //   // this to exit the app
    //   SystemNavigator.pop();
    //   break;
  }
}
