// the onSignal id of this App.
import 'dart:io';

const String oneSignalAppId = "4a073029-dd32-4c5a-a46d-1eb477613812";

// this is the url from which i get the wallpapers.
const String serverUrl = "https://twicev.com/wallpaper2/api/wallpapers.php?id_cat=2";

// ironSource app Id

// this commented key is working
// const String ANDROID_APP_KEY = "1804d5bed";
const String ANDROID_APP_KEY = "1b0ef081d";
const String IOS_APP_KEY = "1cec653e5";

// this is mine, and not working
// const String ANDROID_APP_KEY = "1cec653e5";

// native ad id

final String nativeAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/2247696110'
      : 'ca-app-pub-3940256099942544/3986624511';