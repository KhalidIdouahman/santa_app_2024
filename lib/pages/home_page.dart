import 'package:flutter/material.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
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
// import 'package:in_app_review/in_app_review.dart';
// import 'package:launch_review/launch_review.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:santa_app_2024/ads_services/iron_source_ads/rewarded_video_pusher.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/banner_pusher.dart';
// import 'package:santa_app_2024/pages/testing_ads_page.dart';
// import 'package:santa_app_2024/ads_services/ad_mob_ads/open_app_admob.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';
import 'package:santa_app_2024/constants/app_id_and_urls.dart';

typedef CallbackAction = void Function();
final UserChat userChat = usersList.first;

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> camerasDesList;
  const HomeScreen({super.key, required this.camerasDesList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final IronSourceBannerPusher _bannerPusher = IronSourceBannerPusher();

  // late AppLifecycleReactor _appLifecycleReactor;

  @override
  void initState() {
    super.initState();
    _bannerPusher.showBannerAd();
    // i add this line to listen to the 
    IronSource.setLevelPlayBannerListener(_bannerPusher);
    // this code is to test the appOpen ad but it doesn't work 
    // AppOpenAdManager appOpenAd = AppOpenAdManager()..showAdIfAvailable();
    // AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    // _appLifecycleReactor = AppLifecycleReactor(
    //   appOpenAdManager: appOpenAdManager,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // again i wrapped the body with the builder widget , to work with it's context to open the sidebar ,
      // because he needs a context inside the scaffold widget.
      // to show the sidebar
      drawer: const NavBar(),
      body: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
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
                        // redirect it to playstore
                        reviewInTheStore("jp.konami.pesam", "");
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
                    (context, index) {
                      // this for showing the native ads, in the home items.
                      if (index == 3) {
                        return const NativeAdWidget(
                            maxWidth: 320,
                            maxHeight: 90,
                            adSize: TemplateType.small);
                      } else {
                        return buildHomeItem(
                          gredientColor: homeItemsData[index].color,
                          firstIcon: homeItemsData[index].firstIcon,
                          lastIcon: homeItemsData[index].lastIcon,
                          title: homeItemsData[index].title,
                          subtitle: homeItemsData[index].subtitle,
                          onItemClicked: () {
                            selectedItem(context, index);
                          },
                        );
                      }
                    },
                    childCount: homeItemsData.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// i added one to the items from 2 until the end , because i added an empty item in the index 3,
// to show the adds in that index.
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
            // here when he clicks on unlock btn , i initialize video pusher class and pass to it the function
            // that will be executed after the video ad is finished , and to listen on it ,
            // we need to pass the object of the class to the rewarded video listener.
            final IronSourceRewardedVideoPusher videoAd =
                IronSourceRewardedVideoPusher(rewardAfterVideoAdCompleted: () {
              // to navigate to the chat after the ad video is finished
              Navigator.push(
                myContext,
                MaterialPageRoute(
                  builder: (myContext) => ChatPage(user: userChat),
                ),
              );
            });
            IronSource.setLevelPlayRewardedVideoListener(videoAd);
            videoAd.showRewardedVideo();
            // to show the ads video before going to chat page .
          },
          onCancelPressed: () {},
        );
        break;
      case 2:
        Navigator.push(
          myContext,
          MaterialPageRoute(
            builder: (myContext) => MakeCallPage(user: userChat),
          ),
        );
        break;
      case 4:
        buildAnimatedDialog(
          context: myContext,
          onOkPressed: () {
            final IronSourceRewardedVideoPusher videoAd =
                IronSourceRewardedVideoPusher(rewardAfterVideoAdCompleted: () {
              // to navigate to the chat video after the ad video is finished
              Navigator.push(
                myContext,
                MaterialPageRoute(
                  builder: (myContext) => MakeVideoCallPage(
                    user: userChat,
                    cameras: widget.camerasDesList,
                  ),
                ),
              );
            });
            IronSource.setLevelPlayRewardedVideoListener(videoAd);
            videoAd.showRewardedVideo();
          },
          onCancelPressed: () {},
        );
        break;
      case 5:
        Navigator.push(
          myContext,
          MaterialPageRoute(
            builder: (myContext) => const OtherCharactersPage(),
          ),
        );
        break;
      case 6:
        Navigator.push(
          myContext,
          MaterialPageRoute(
            builder: (myContext) => const CounterCallPage(),
          ),
        );
        break;
      case 7:
        shareData(
          message:
              "Take a look to this beautiful app , I am sure you will like it. 😍❤",
          url: appUrl,
        );
        break;
      case 8:
        // this for rating the app in the app itself , but it works only when the app is in the store,
        // because it get the app id directly from the build.gradle , "com.example.santa-2024".
        // sendReview();
        // and this pushes the user to give a rate in playstore , and if we don't specified any parameter to launch
        // method it will get the app id and redirect it to the app in the store .
        reviewInTheStore("jp.konami.pesam", "");
        break;
      case 9:
        // this and sendReview functions will be in the same file named: share
        goToUrl(urlWebsite);
        // this was just for testing ads in new simple page.
        // Navigator.push(
        //   myContext,
        //   MaterialPageRoute(
        //     builder: (myContext) => IronSourceAdsTestPage(),
        //   ),
        // );
        break;
    }
  }
}
