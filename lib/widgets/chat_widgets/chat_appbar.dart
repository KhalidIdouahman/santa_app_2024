import 'package:flutter/material.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';

AppBar buildAppBar(UserChat user) {
  return AppBar(
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: Colors.transparent,
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
                  color: Colors.black),
            ),
            Text(
              user.userStatus,
              style: user.userStatus == 'Online'
                  ? const TextStyle(fontSize: 14, color: Colors.green)
                  : const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        )
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: GestureDetector(
          onTap: () {
            print('calling santa');
          },
          child: const Icon(
            Icons.call,
            color: Colors.black,
          ),
        ),
      )
    ],
  );
}
