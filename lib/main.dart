import 'package:flutter/material.dart';
import 'package:santa_app_2024/ads_services/ad_mob_GDPR/gdpr_screen.dart';
import 'package:santa_app_2024/ads_services/onesignal_ads/one_signal.dart';
import 'package:santa_app_2024/pages/home_page.dart';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/iron_source.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:santa_app_2024/ads_services/appsflyer/apps_flyer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:santa_app_2024/firebase_options.dart';

late List<CameraDescription> camerasList;

Future<void> main() async {
  // initialize the camera and pass it to the making_video_call and video_call pages to work with it.
  WidgetsFlutterBinding.ensureInitialized();
  camerasList = await availableCameras();

  // initialize ironSource to show ads
  initIronSource();
  // initialize the oneSignal notifications.
  initOneSignalNotifications();
  // initialize app open adMob ads
  MobileAds.instance.initialize();
  // initialize appsflyer
  initializeAppsFlyer();
  // intialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Santa Call App',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home: HomeScreen(camerasDesList: camerasList),

      // i add this to show the gdpr dialog of the privacy in europ region.
      home: InitializeGDPRScreen(
          targetWidget: HomeScreen(camerasDesList: camerasList)),
    );
  }
}
