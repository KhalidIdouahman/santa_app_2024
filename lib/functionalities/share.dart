import 'package:share_plus/share_plus.dart';

// this function to share anything this message and link.
void shareData({required String message, required String url}) async {
  await Share.share("$message \n\n$url");
}
