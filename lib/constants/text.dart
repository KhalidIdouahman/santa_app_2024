import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/colors.dart';
import 'package:santa_app_2024/models/home_item_data.dart';

final List<HomeItemsData> homeItemsData = [
  HomeItemsData(
    icon: Icons.image_rounded,
    title: "Wallpapers",
    subtitle: "A lot of awesome wallpapers",
    color: gredientColor1
  ),
  HomeItemsData(
    icon: Icons.chat_bubble_outline,
    title: "Chat",
    subtitle: "Open chat and talk!",
    color: gredientColor2
  ),
  HomeItemsData(
    icon: Icons.call,
    title: "Calling",
    subtitle: "Call Puppet now!",
    color: gredientColor3
  ),
  HomeItemsData(
    icon: Icons.videocam,
    title: "Video Call",
    subtitle: "Make Video Call Camera",
    color: gredientColor4
  ),
  HomeItemsData(
    icon: Icons.group,
    title: "Puppets",
    subtitle: "Call and chat Other Puppets",
    color: gredientColor5
  ),
];
