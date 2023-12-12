import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/calling_page/call_page.dart';
import 'package:santa_app_2024/widgets/calling_widgets/calling_btn.dart';

class MakeCallPage extends StatelessWidget {
  final UserChat user;
  const MakeCallPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // to let the image expand in the whole screen
        fit: StackFit.expand,
        children: [
          Image.asset(
            user.imgUrl,
            fit: BoxFit.cover,
          ),
          // Apply blur effect using BackdropFilter
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // the content on top of the blurred image
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this column shows the image with the name and the phoneNum.
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(user.imgUrl),
                    radius: 50,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    user.userName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    user.phoneNum!,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
              // and this column shows the icon with the text.
              const Column(
                children: [
                  Icon(Icons.phone, color: Colors.white, size: 30),
                  SizedBox(height: 10),
                  Text(
                    "Incoming Call...",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
              // and this for the two buttons of the decline and accepte.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCallingBtn(
                    icon: Icons.call_end,
                    label: "Decline",
                    bgColor: Colors.white,
                    iconColor: Colors.red,
                    onTapped: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 30),
                  buildCallingBtn(
                    icon: Icons.arrow_outward_rounded,
                    label: "Accepte",
                    bgColor: Colors.white,
                    iconColor: Colors.green,
                    onTapped: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CallPage(user: user)));
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}