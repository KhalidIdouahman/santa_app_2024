import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/calling_page/making_call_page.dart';
import 'package:santa_app_2024/pages/chat_page.dart';
import 'package:santa_app_2024/pages/counter_call_page.dart';
import 'package:santa_app_2024/pages/other_characters_page.dart';
import 'package:santa_app_2024/pages/wallpaper_page/wallpapers_page.dart';
import 'package:santa_app_2024/widgets/home_widgets/header_of_home.dart';
import 'package:santa_app_2024/widgets/home_widgets/home_items.dart';
import 'package:santa_app_2024/widgets/home_widgets/side_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final UserChat userChat = usersList.first;

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
    case 0:
      Navigator.push(myContext,
          MaterialPageRoute(builder: (myContext) => const WallpaperPage()));
      break;
    case 1:
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => ChatPage(user: HomeScreen.userChat),
        ),
      );
      break;
    case 2:
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => MakeCallPage(user: HomeScreen.userChat),
        ),
      );
      break;
    case 3:
    // it needs to create video page .
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => MakeCallPage(user: HomeScreen.userChat),
        ),
      );
      break;
    case 4:
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => const OtherCharactersPage(),
        ),
      );
      break;
    case 5:
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => const CounterCallPage(),
        ),
      );
      break;
    case 6:
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => MakeCallPage(user: HomeScreen.userChat),
        ),
      );
      break;
    case 7:
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => MakeCallPage(user: HomeScreen.userChat),
        ),
      );
      break;
    case 8:
      Navigator.push(
        myContext,
        MaterialPageRoute(
          builder: (myContext) => MakeCallPage(user: HomeScreen.userChat),
        ),
      );
      break;
    // case -1:
    //   // this to exit the app
    //   SystemNavigator.pop();
    //   break;
  }
}
