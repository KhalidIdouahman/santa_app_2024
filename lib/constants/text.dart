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
  HomeItemsData(
    icon: Icons.alarm,
    title: "Counter Call",
    subtitle: "Start call with counter time",
    color: gredientColor6
  ),
  HomeItemsData(
    icon: Icons.share,
    title: "Share it",
    subtitle: "Share and have fun with friends",
    color: gredientColor7
  ),
  HomeItemsData(
    icon: Icons.star_rate_rounded,
    title: "Rate Us",
    subtitle: "Rate your hero",
    color: gredientColor8
  ),
  HomeItemsData(
    icon: Icons.more_horiz,
    title: "More Apps",
    subtitle: "Discover our apps and enjoy",
    color: gredientColor9
  ),
];

final List<SideBarData> sideBarData = [
  SideBarData(
    icon: Icons.info,
    title: "Application Name",
    subtitle: "Call Santa Claus",
    // color: Colors.transparent
  ),
  SideBarData(
    icon: Icons.info,
    title: "Build Version",
    subtitle: "Version: 1.0",
    // color: gredientColor2
  ),
  SideBarData(
    icon: Icons.stars,
    title: "Rate Us",
    subtitle: "Please support us with your positive review",
    // color: gredientColor3
  ),
  SideBarData(
    icon: Icons.share,
    title: "Share it",
    subtitle: "Share our app with your friends and family",
    // color: gredientColor4
  ),
  SideBarData(
    icon: Icons.phone_android_outlined,
    title: "More Apps",
    subtitle: "Check out other apps on PlayStore and AppStore",
    // color: gredientColor5
  ),
  SideBarData(
    icon: Icons.live_help_rounded,
    title: "Contact Us",
    subtitle: "Help us to improve our application",
    // color: gredientColor6
  ),
  SideBarData(
    icon: Icons.shield,
    title: "Privacy Policy",
    subtitle: "Please check out our privacy policy here",
    // color: gredientColor7
  ),
];