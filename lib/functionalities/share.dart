import 'package:in_app_review/in_app_review.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// this function to share anything this message and link.
void shareData({required String message, required String url}) async {
  await Share.share("$message \n\n$url");
}

// to send the review in the app by showing a pop up.
Future<void> sendReview() async {
  final InAppReview inAppReview = InAppReview.instance;

  if (await inAppReview.isAvailable()) {
    inAppReview.requestReview();
  }
}

// to send the user to see our store of apps in play store
Future<void> goToUrl(String websiteUrl) async {
  final uriLink = Uri.parse(websiteUrl);
  launchUrl(uriLink);
}

// redirect the user to review the app in the store.
void reviewInTheStore(String androidAppId, String iosAppId) {
  LaunchReview.launch(androidAppId: androidAppId , iOSAppId: iosAppId);
}
