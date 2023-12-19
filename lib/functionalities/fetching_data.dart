import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:santa_app_2024/models/api_wallpaper_model.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';

Future<List<ApiWallpaperModel>> getImagesList({required String urlApi}) async {
  List<ApiWallpaperModel> wallpapersList = [];
  try {
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // print(responseData);
      var apiData = responseData["ResponseData"];
      for (int i = 0; i < apiData.length; i++) {
        var wallpaperObj = apiData[i];
        wallpapersList.add(ApiWallpaperModel(
            id: int.parse(wallpaperObj["id"]),
            wallpaperUrlImg: wallpaperObj["wallpaper_image"],
            wallpaperColor: wallpaperObj["wallpaper_color"],
            wallpaperHeight: int.parse(wallpaperObj["wallpaper_height"]),
            wallpaperCategory: wallpaperObj["category_name"],
            wallpaperViews: int.parse(wallpaperObj["wallpaper_views"])));
      }
      // print(wallpapersList);
    } else {
      print("error from the server");
      throw "error from the server";
    }
    return wallpapersList;
  } catch (error) {
    print(error.toString());
    throw error.toString();
  }
  // return wallpapersList;
}

Future<List<UserChat>> getCharactersList({required String urlApi}) async {
  List<UserChat> charactersList = [];
  try {
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // print(responseData);
      var apiData = responseData["ResponseData"];
      for (int i = 0; i < apiData.length; i++) {
        var obj = apiData[i];
        charactersList.add(UserChat(
          userName: obj,
          imgUrl: obj,
          userStatus: obj,
          phoneNum: obj,
            ));
      }
      // print(wallpapersList);
    } else {
      print("error from the server");
      throw "error from the server";
    }
    return charactersList;
  } catch (error) {
    print(error.toString());
    throw error.toString();
  }
  // return wallpapersList;
}
