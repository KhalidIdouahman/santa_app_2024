import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/colors.dart';
import 'package:santa_app_2024/models/chat_models/text_chat.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/models/home_item_data.dart';
import 'package:santa_app_2024/models/schedule_call.dart';

// i added this empty item to show in them the native ads.

final List<HomeItemsData> homeItemsData = [
  HomeItemsData(
      firstIcon: Icons.image_rounded,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "Wallpapers",
      subtitle: "A lot of awesome wallpapers",
      color: gredientColor1),
  HomeItemsData(
      firstIcon: Icons.chat_bubble_outline,
      lastIcon: Icons.lock,
      title: "Chat",
      subtitle: "Open chat and talk!",
      color: gredientColor2),
  HomeItemsData(
      firstIcon: Icons.call,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "Calling",
      subtitle: "Call Puppet now!",
      color: gredientColor3),
  HomeItemsData(
      firstIcon: Icons.share,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "",
      subtitle: "",
      color: gredientColor7),
  HomeItemsData(
      firstIcon: Icons.videocam,
      lastIcon: Icons.lock,
      title: "Video Call",
      subtitle: "Make Video Call Camera",
      color: gredientColor4),
  HomeItemsData(
      firstIcon: Icons.group,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "Other Characters",
      subtitle: "Call and chat Other Puppets",
      color: gredientColor5),
  HomeItemsData(
      firstIcon: Icons.alarm,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "Counter Call",
      subtitle: "Start call with counter time",
      color: gredientColor6),
  HomeItemsData(
      firstIcon: Icons.share,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "Share it",
      subtitle: "Share and have fun with friends",
      color: gredientColor7),
  HomeItemsData(
      firstIcon: Icons.star_rate_rounded,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "Rate Us",
      subtitle: "Rate your hero",
      color: gredientColor8),
  HomeItemsData(
      firstIcon: Icons.more_horiz,
      lastIcon: Icons.arrow_forward_ios_rounded,
      title: "More Apps",
      subtitle: "Discover our apps and enjoy",
      color: gredientColor9),
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

final List<ChatText> chatTextData = [
  const ChatText(chatQuestion: "Hi..!🤗", chatResponse: "Hello! Buenos dias☺"),
  const ChatText(
      chatQuestion: "How are you ?🤗", chatResponse: "I'm Good thank you."),
  const ChatText(
      chatQuestion: "What's your name ?🤗", chatResponse: "I am Santa"),
  const ChatText(
      chatQuestion: "How old are you ?🤗", chatResponse: "I am 70 years old"),
  const ChatText(chatQuestion: "Nice to meet you 🤗", chatResponse: "mee to "),
  const ChatText(
      chatQuestion: "What are you doing now ?🤗",
      chatResponse: "I am playing games , and making videos on youtube."),
  const ChatText(
      chatQuestion: "What kind of food you like ?",
      chatResponse: "I love healthy Food and exercise every day"),
  const ChatText(chatQuestion: "Tell me a thing ?", chatResponse: "I love you"),
  const ChatText(
      chatQuestion: "I love you so much",
      chatResponse: "ohhh, thank you , me to , I love you all my fans"),
  const ChatText(
      chatQuestion: "Do you like this application ?",
      chatResponse:
          "Yes , I love it . And you ? If you love to you should give it a 5 stars , and a great comment , and share it with your friends and family , Goodbye"),
];

final List<UserChat> usersList = [
  const UserChat(
    userName: "Santa",
    imgUrl: "assets/images/santa_calling_2.jpg",
    userStatus: "Online",
    phoneNum: "+1323486543",
  ),
  const UserChat(
    userName: "Jeffy",
    imgUrl: "assets/images/santa_calling_2.jpg",
    userStatus: "Online",
    phoneNum: "+1579330723",
  ),
  const UserChat(
    userName: "Bowser Junior",
    imgUrl: "assets/images/santa_calling_2.jpg",
    userStatus: "Online",
    phoneNum: "+1857947301",
  ),
  const UserChat(
    userName: "Cody",
    imgUrl: "assets/images/santa_calling_2.jpg",
    userStatus: "Online",
    phoneNum: "+1097493721",
  ),
  const UserChat(
    userName: "Rosalina",
    imgUrl: "assets/images/santa_calling_2.jpg",
    userStatus: "Online",
    phoneNum: "+1344432940",
  ),
  const UserChat(
    userName: "Nancy",
    imgUrl: "assets/images/santa_calling_2.jpg",
    userStatus: "Online",
    phoneNum: "+1468397973",
  ),
];

// the list of scheduleCalls.
final List<ScheduleCallObj> scheduleCalls = [
  const ScheduleCallObj(
    prefixIcon: Icons.alarm_rounded,
    duration: 20,
    unit: 'Seconds',
    sufixIcon: Icons.call,
  ),
  const ScheduleCallObj(
    prefixIcon: Icons.alarm_rounded,
    duration: 40,
    unit: 'Seconds',
    sufixIcon: Icons.call,
  ),
  const ScheduleCallObj(
    prefixIcon: Icons.alarm_rounded,
    duration: 1,
    unit: 'Minutes',
    sufixIcon: Icons.call,
  ),
  const ScheduleCallObj(
    prefixIcon: Icons.alarm_rounded,
    duration: 2,
    unit: 'Minutes',
    sufixIcon: Icons.call,
  ),
  const ScheduleCallObj(
    prefixIcon: Icons.alarm_rounded,
    duration: 6,
    unit: 'Minutes',
    sufixIcon: Icons.call,
  ),
];

// the app url to be used in sharing images and the app.
const String appUrl = "https://this_is_the_link_of_the_app.com";