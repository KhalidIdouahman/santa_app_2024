import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  // initialize the instance of notification to work with.
  final FlutterLocalNotificationsPlugin notification = FlutterLocalNotificationsPlugin();

// intialize android
  final AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings("@mipmap/ic_launcher");
// initialze IOS
    final DarwinInitializationSettings initializationSettingsDarwin = const DarwinInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  
  // initializing the notification .
  Future<void> initNotifications() async {

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid , iOS: initializationSettingsDarwin);
      
     notification.initialize(initializationSettings);
  }

// and this func is for pushing the notification.
  Future<void> pushNotification({
    int id = 0,
    required String title,
    required String descreption,
    required String pyload,
  }) async {
    await notification.show(
      id,
      title,
      descreption,
      payload: pyload,
      NotificationDetails(
        android: androidNotification(),
        iOS: iosNotification(),
      ),
    );
  }

// these are the details to show a notification for android , but i don't know their role yet .
  AndroidNotificationDetails androidNotification() {
    return const AndroidNotificationDetails(
      "Notification id",
      "Notification Name",
      channelDescription: "This is channel description",
      importance: Importance.max,
    );
  }

// these are the details to show a notification for ios , but i don't know their role yet .
  DarwinNotificationDetails iosNotification() {
    return const DarwinNotificationDetails(
      threadIdentifier: "Ios Notification Id",
      subtitle: "Ios subTitle Notification",
    );
  }
}
