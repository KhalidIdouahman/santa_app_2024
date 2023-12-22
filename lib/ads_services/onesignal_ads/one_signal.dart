import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:santa_app_2024/constants/app_id_and_urls.dart';

Future<void> initOneSignalNotifications() async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(oneSignalAppId);
  OneSignalNotifications().requestPermission(true);

  // for the ios it stil need to add the permission to show notification in .xcworkspace.
  // see this link to setup the ios : https://documentation.onesignal.com/docs/flutter-sdk-setup
}
