import 'package:flutter/material.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';

// i change the colors of the app bar, and the state of santa when chating , is typing or not.
typedef CallbackAction = void Function();

AppBar buildAppBar(UserChat user , bool isTyping , CallbackAction callSanta) {
  return AppBar(
    elevation: 0,
    foregroundColor: Colors.white,
    // foregroundColor: Colors.black,
    // backgroundColor: Colors.transparent,
    backgroundColor: Colors.blue,
    title: Row(
      children: [
        // CircleAvatar(
        //   // it's work .
        //   backgroundImage: NetworkImage("http:\/\/twicev.com\/wallpaper2\/\/images\/wallpapers\/V1650903840.jpeg"),
        //   raduis: 20,
        // )
        ClipOval(
            child: Image.asset(
          user.imgUrl,
          fit: BoxFit.cover,
          width: 45,
          height: 45,
        )),
        const SizedBox(width: 20),
        Column(
          children: [
            Text(
              user.userName,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Colors.black,
                  ),
            ),
            Text(
              isTyping ? "Typing..." : user.userStatus,
              style: user.userStatus == 'Online' || user.userStatus == "Typing..."
                  ? const TextStyle(fontSize: 14, color: Colors.white)
                  : const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        )
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        // to handle the click of the button in the chat page.
        child: GestureDetector(
          onTap: callSanta,
          child: const Icon(
            Icons.call,
            // color: Colors.black,
          ),
        ),
      )
    ],
  );
}
