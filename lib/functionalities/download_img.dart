import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';

Future<void> downloadImgWithPerimssion(String url, BuildContext context) async {
  // this to download it according to permissions.
  var status = await Permission.storage.status;
  if (status.isGranted) {
    _saveImg(url, true, context);
  } else {
    var request = await Permission.storage.request();
    _saveImg(url, request.isGranted, context);
  }
}

void _saveImg(String url, bool isPermissioned, BuildContext context) async {
  // this to download the img by http request and write it into the storage phone.
  if (isPermissioned) {
    var response = await http.get(Uri.parse(url));
    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    File file =
        File(path.join(externalStorageDirectory!.path, path.basename(url)));
    print(externalStorageDirectory.path);
    print(path.basename(url));
    await file.writeAsBytes(response.bodyBytes);
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Image saved Successfully!"),
              content: Image.file(
                file,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ));
  } else {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("Please give us permissions to download the image !"),
            ));
  }
}

// this is the one i use to download the image with image gallery saver .

void saveImage(String url) async {
  // if (isDownload) {
  var response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;
  // Save image to user's gallery
  await ImageGallerySaver.saveImage(bytes);
  print('Image downloaded!');
  // }
}
