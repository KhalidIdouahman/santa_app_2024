import 'dart:async';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/pages/calling_page/making_call_page.dart';
import 'package:santa_app_2024/widgets/counter_call_widgets/counter_call_item.dart';

import 'package:santa_app_2024/functionalities/notifications_handler.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/banner_pusher.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';
// import 'dart:io';

class CounterCallPage extends StatefulWidget {
  const CounterCallPage({super.key});

  @override
  State<CounterCallPage> createState() => _CounterCallPageState();
}

class _CounterCallPageState extends State<CounterCallPage> {
// the instance of the notification handler to work with.
  final NotificationHandler _notificationHandler = NotificationHandler();

  final IronSourceBannerPusher bannerAd = IronSourceBannerPusher();

  // in this map i store in it the index of the clicked schedule call , and the and the duration that changes each second.
  final Map<int, int> storeCounterDownTimers = {};
// all these changes that are made in this page , is for showing the ad banner of goole admob , but 
// he is also doesn't want to appeare. until fix this later.

  BannerAd? bannerAdMob;
  bool isBannerAdMobLoaded = false;

  @override
  void initState() {
    super.initState();
    // initialize the notifications
    WidgetsFlutterBinding.ensureInitialized();
    _notificationHandler.initNotifications();

  // to destroy the ironsource banner of the home page, to let the space for the nataive ads.
    IronSource.destroyBanner();
    //  for admob ads
    // dispalyAdBanner(bannerAdMob);
    // setState(() {
    //   adBannerObj.dispalyAdBanner(bannerAdMob, isBannerAdMobLoaded);
    // });
  }

  // it seems that this function shows an admob banner and i don't work with it anymore.
  // void dispalyAdBanner(BannerAd? adBanenr) {
  //   final adUnitId = Platform.isAndroid
  //       ? 'ca-app-pub-3940256099942544/6300978111'
  //       : 'ca-app-pub-3940256099942544/2934735716';

  //   adBanenr = BannerAd(
  //     adUnitId: adUnitId,
  //     request: const AdRequest(),
  //     size: AdSize.banner,
  //     listener: BannerAdListener(
  //       // Called when an ad is successfully received.
  //       onAdLoaded: (ad) {
  //         print('$ad this ad has been loaded successfuly , thanks.');
  //         setState(() {
  //           isBannerAdMobLoaded = true;
  //         });
  //       },
  //       // Called when an ad request failed.
  //       onAdFailedToLoad: (ad, err) {
  //         print('BannerAd failed to load: $err');
  //         isBannerAdMobLoaded = false;
  //         // Dispose the ad here to free resources.
  //         ad.dispose();
  //       },
  //       // Called when an ad opens an overlay that covers the screen.
  //       onAdOpened: (Ad ad) {},
  //       // Called when an ad removes an overlay that covers the screen.
  //       onAdClosed: (Ad ad) {},
  //       // Called when an impression occurs on the ad.
  //       onAdImpression: (Ad ad) {},
  //     ),
  //   )..load();
  // }

  @override
  void dispose() {
    // initialize the banner ads to be showing in all pages.
    bannerAd.showBannerAd();
    super.dispose();
  }

// in this func i take the index of the clicked item to get from it the duration , and starts the timer.
  void startCounter(int callIndex) {
    final scheduleCall = scheduleCalls[callIndex];
    int durationInSeconds = (scheduleCall.unit == 'Seconds')
        ? scheduleCall.duration
        : scheduleCall.duration * 60;

    setState(() {
      storeCounterDownTimers[callIndex] = durationInSeconds;
    });

// in this timer each second checkes if there is a value to be decremented else canceled the timer and go to call page.
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (storeCounterDownTimers[callIndex]! > 0) {
        setState(() {
          storeCounterDownTimers[callIndex] =
              storeCounterDownTimers[callIndex]! - 1;
        });
      } else {
        timer.cancel();
        // when the timer is finished then the notification is pushed.
        _notificationHandler.pushNotification(
          id: 0,
          title: "Santa is Calling",
          descreption: "Hey i'm santa , i want to talk with you good boy.",
          pyload: "call me",
        );
        // pushing to the call page.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MakeCallPage(user: usersList[0]),
          ),
        );
        // this to make the list empty to let the icons of alarm and call to be back .
        setState(() {
          storeCounterDownTimers.remove(callIndex);
        });
      }
    });
  }

// in this i check when some item is clicked if there is no a value in the map to start the timer else to stop it.
  void timerHandler(int index) {
    if (storeCounterDownTimers[index] == null) {
      startCounter(index);
    } else {
      // Cancel countdown
      setState(() {
        storeCounterDownTimers.remove(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Schedule Call",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            // color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            // this listview creates the items of the counter page .
            child: ListView.builder(
              itemCount: scheduleCalls.length,
              itemBuilder: (context, index) {
                return buildListCounterCallItem(
                  scheduleCall: scheduleCalls[index],
                  storedTimes: storeCounterDownTimers,
                  onItemClicked: () {
                    timerHandler(index);
                  },
                );
              },
            ),
          ),
        ),
// i was trying to show the admob banner in this page, but the master changes his mind.
            // adBannerObj.buildBannerAdWidget(bannerAdMob),
            // bannerAdMob != null
            //     ? Container(
            //       color: Colors.red,
            //       child: Align(
            //           alignment: Alignment.bottomCenter,
            //           child: SafeArea(
            //             child: SizedBox(
            //               width: bannerAdMob!.size.width.toDouble(),
            //               height: bannerAdMob!.size.height.toDouble(),
            //               child: AdWidget(ad: bannerAdMob!),
            //             ),
            //           ),
            //         ),
            //     )
            //     : Container(),
            const NativeAdWidget(maxWidth: 330, maxHeight: 360, adSize: TemplateType.medium)
      ],),
    );
  }
}
