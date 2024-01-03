import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/firestore_model/firestore_model.dart';

final santaImgUrl = usersList[0].imgUrl;

Widget buildBackgroundImgWithBlur(Character? character) {
  return Stack(
    // to let the image expand in the whole screen
    fit: StackFit.expand,
    children: [
      character == null
          ? Image.asset(santaImgUrl, fit: BoxFit.cover)
          : CachedNetworkImage(imageUrl: character.characterImg, fit: BoxFit.cover),
      // Apply blur effect using BackdropFilter
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.black.withOpacity(0.4),
        ),
      )
    ],
  );
  // the content on top of the blurred image
}
