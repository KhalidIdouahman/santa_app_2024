import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/calling_page/making_call_page.dart';
import 'package:santa_app_2024/pages/chat_page.dart';
import 'package:santa_app_2024/pages/counter_call_page.dart';
import 'package:santa_app_2024/pages/other_characters_page.dart';
import 'package:santa_app_2024/pages/wallpaper_page/wallpapers_page.dart';
import 'package:santa_app_2024/widgets/animated_dialog/custom_dialog.dart';
import 'package:santa_app_2024/widgets/home_widgets/header_of_home.dart';
import 'package:santa_app_2024/widgets/home_widgets/home_items.dart';
import 'package:santa_app_2024/widgets/home_widgets/side_bar_widget.dart';

import 'package:camera/camera.dart';
import 'package:santa_app_2024/pages/video_call_page/making_video_call_page.dart';
import 'package:santa_app_2024/functionalities/share.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:santa_app_2024/ads_services/iron_source_ads/rewarded_video_pusher.dart';
import 'package:santa_app_2024/pages/testing_ads_page.dart';
// import 'package:santa_app_2024/ads_services/iron_source_ads/interstitial_pusher.dart';

typedef CallbackAction = void Function();
final IronSourceRewardedVideoPusher videoAd = IronSourceRewardedVideoPusher();

class HomeScreen extends StatelessWidget {
  final List<CameraDescription> camerasDesList;
  const HomeScreen({super.key, required this.camerasDesList});
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
          // this customScrollView is the widget who let the header animates depanding on scrolling.
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                // this the height before scrolling .
                expandedHeight: MediaQuery.of(context).size.height * 0.35,
                // Keep the header visible when scrolling
                pinned: true,
                // this is the height in which the header stops scrolling
                toolbarHeight: MediaQuery.of(context).size.height * 0.18,
                // to avoid the shadow below the header
                elevation: 0,
                // to avoid the blue color of the appbar
                backgroundColor: Colors.transparent,
                // to hide the button of the menubar
                automaticallyImplyLeading: false,
                // here when i show the header and he makes it animate when scrolling.
                flexibleSpace: FlexibleSpaceBar(
                  // i give it to the title because it animate by its self
                  title: buildHeader(
                    context: context,
                    onSettingsClicked: () {
                      Scaffold.of(context).openDrawer();
                    },
                    onFavoriteClicked: () {
                      print("favorite icon clicked.");
                    },
                  ),
                  centerTitle: true,
                  // the way how the animation goes.
                  expandedTitleScale: 1.08,
                ),
              ),

              // and this creates the list of items that has the ability to push the header to the top .
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => buildHomeItem(
                    gredientColor: homeItemsData[index].color,
                    firstIcon: homeItemsData[index].firstIcon,
                    lastIcon: homeItemsData[index].lastIcon,
                    title: homeItemsData[index].title,
                    subtitle: homeItemsData[index].subtitle,
                    onItemClicked: () {
                      selectedItem(context, index);
                    },
                  ),
                  childCount: homeItemsData.length,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void selectedItem(BuildContext myContext, int index) {
    switch (index) {
      case 0:
        Navigator.push(myContext,
            MaterialPageRoute(builder: (myContext) => const WallpaperPage()));
        break;
      case 1:
        buildAnimatedDialog(
          context: myContext,
          onOkPressed: () {
            videoAd.showRewardedVideo();
            // to show the ads video before going to chat page .
            Navigator.push(
              myContext,
              MaterialPageRoute(
                builder: (myContext) => ChatPage(user: HomeScreen.userChat),
              ),
            );
          },
          onCancelPressed: () {
          },
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
        buildAnimatedDialog(
          context: myContext,
          onOkPressed: () {
            videoAd.showRewardedVideo();
            // to show the ads video before going to chat page .
            Navigator.push(
              myContext,
              MaterialPageRoute(
                builder: (myContext) => MakeVideoCallPage(
                  user: HomeScreen.userChat,
                  cameras: camerasDesList,
                ),
              ),
            );
          },
          onCancelPressed: () {},
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
        shareData(
          message:
              "Take a look to this beautiful app , I am sure you will like it. 😍❤",
          url: appUrl,
        );
        break;
      case 7:
        // this for rating the app in the app itself , but it works only when the app is in the store,
        // because it get the app id directly from the build.gradle , "com.example.santa-2024".
        // sendReview();
        // and this pushes the user to give a rate in playstore , and if we don't specified any parameter to launch
        // method it will get the app id and redirect it to the app in the store .
        LaunchReview.launch(androidAppId: "jp.konami.pesam");
        break;
      case 8:
        // goToUrl();
        Navigator.push(
          myContext,
          MaterialPageRoute(
            builder: (myContext) => IronSourceAdsTestPage(),
          ),
        );
        break;
    }
  }

// to send the review.
  Future<void> sendReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  Future<void> goToUrl() async {
    const urlWebsite =
        "https://play.google.com/store/apps/developer?id=KONAMI&hl=en&gl=US";

    final uriLink = Uri.parse(urlWebsite);
    launchUrl(uriLink);
  }
}
