// import 'dart:async';
// // import 'dart:io';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:santa_app_2024/constants/text.dart';

// // // create an instance of notification
// // final FlutterLocalNotificationsPlugin flutterLocalPlugin =
// //     FlutterLocalNotificationsPlugin();

// // // the to be passed for the android notification devices
// // const AndroidNotificationChannel notificationChannel =
// //     AndroidNotificationChannel(
// //         "coding is life foreground", "coding is life foreground service",
// //         description: "This is channel description",
// //         importance: Importance.high);

// Future<void> initService() async {
//   var service = FlutterBackgroundService();
//   //set up for ios
// //   if (Platform.isIOS) {
// //     await flutterLocalPlugin.initialize(
// //         const InitializationSettings(iOS: DarwinInitializationSettings()));
// //   }

// // // this to push notification for android
// //   await flutterLocalPlugin
// //       .resolvePlatformSpecificImplementation<
// //           AndroidFlutterLocalNotificationsPlugin>()
// //       ?.createNotificationChannel(notificationChannel);

//   //service init and start
//   await service.configure(
//       iosConfiguration:
//           IosConfiguration(onBackground: iosBackground, onForeground: onStart),
//       androidConfiguration: AndroidConfiguration(
//           onStart: onStart,
//           autoStart: true,
//           isForegroundMode: true,
//           notificationChannelId: "hi notification id",
//           initialNotificationTitle: "hi notification title",
//           initialNotificationContent: "Awsome notification Content",
//           foregroundServiceNotificationId: 90));

//   service.startService();

//   //for ios enable background fetch from add capability inside background mode
// }

// //onstart method
// @pragma("vm:enry-point")
// void onStart(ServiceInstance service) {
//   DartPluginRegistrant.ensureInitialized();

//   service.on("setAsForeground").listen((event) {
//     print("foreground ===============");
//   });

//   service.on("setAsBackground").listen((event) {
//     print("background ===============");
//   });

//   service.on("stopService").listen((event) {
//     service.stopSelf();
//   });

//   //display notification as service
//   // Timer.periodic(Duration(seconds: 2), (timer) {
//   //   flutterLocalPlugin.show(
//   //     90,
//   //     "Cool Service",
//   //     "Awsome ${DateTime.now()}",
//   //     NotificationDetails(
//   //       android: AndroidNotificationDetails(
//   //           "coding is life", "coding is life service",
//   //           ongoing: true, icon: "@mipmap/ic_launcher"),
//   //     ),
//   //   );
//   // });
//   print("Background service ${DateTime.now()}");
// }

// //iosbackground
// @pragma("vm:enry-point")
// Future<bool> iosBackground(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DartPluginRegistrant.ensureInitialized();

//   return true;
// }

// // in this map i store in it the index of the clicked schedule call , and the and the duration that changes each second.
// final Map<int, int> storeCounterDownTimersBg = {};

// // in this func i take the index of the clicked item to get from it the duration , and starts the timer.
// @pragma("vm:enry-point")
// void startCounter(ServiceInstance service, int callIndex) {
//   DartPluginRegistrant.ensureInitialized();

//   final scheduleCall = scheduleCalls[callIndex];
//   int durationInSeconds = (scheduleCall.unit == 'Seconds')
//       ? scheduleCall.duration
//       : scheduleCall.duration * 60;

//   storeCounterDownTimersBg[callIndex] = durationInSeconds;

//   service.on("setAsForeground").listen((event) {
//     decrementDuration(service, storeCounterDownTimersBg, callIndex);
//     print("foreground ===============");
//   });

//   service.on("setAsBackground").listen((event) {
//     decrementDuration(service, storeCounterDownTimersBg, callIndex);
//     print("background ===============");
//   });

//   service.on("stopService").listen((event) {
//     FlutterLocalNotificationsPlugin().show(
//         1,
//         "Khalid Notif",
//         "try pushing Notification",
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//             "coding is life", "I am trying to push something even if i don't how .",
//             ongoing: true, icon: "@mipmap/ic_launcher"),
//       ),
//         );
//     service.stopSelf();
//   });

//   print("Background service ${DateTime.now()}");
// }

// final Map<String, Map<int, int>> sendedMap = {};
// const counterChanged = "counter_changed";

// void decrementDuration(
//     ServiceInstance service, Map<int, int> storedTime, int index) {
// // in this timer each second checkes if there is a value to be decremented else canceled the timer and go to call page.
//   Timer.periodic(const Duration(seconds: 1), (timer) {
//     if (storedTime[index]! > 0) {
//       storedTime[index] = storedTime[index]! - 1;
//       sendedMap[counterChanged] = storedTime;
//       service.invoke(counterChanged, sendedMap);
//     } else {
//       timer.cancel();
//       storedTime.remove(index);
//       service.invoke(counterChanged, sendedMap);
//     }
//   });
// }

// // void startBackgroundTask() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   var bgService = FlutterBackgroundService();

// // }
