import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/widgets/calling_widgets/call_functs_btn.dart';
import 'package:santa_app_2024/widgets/calling_widgets/calling_btn.dart';

import 'package:santa_app_2024/functionalities/audio_playing.dart';

class CallPage extends StatefulWidget {
  final UserChat user;
  const CallPage({super.key, required this.user});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final callSound = SoundPlayer();
  final callSoundPath = "sounds/santa_reading_christmas_story.mp3";

  @override
  void initState() {
    callSound.playSound(callSoundPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.user.imgUrl,
            fit: BoxFit.cover,
          ),
          // Apply blur effect using BackdropFilter
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          // Your content on top of the blurred image
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.user.imgUrl),
                    radius: 50,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.user.userName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.user.phoneNum!,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCallFunctionsBtn(icon: Icons.add, label: "Add Call"),
                      buildCallFunctionsBtn(
                          icon: Icons.volume_up, label: "Volume"),
                      buildCallFunctionsBtn(
                          icon: Icons.bluetooth, label: "Bluetooth"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCallFunctionsBtn(
                          icon: Icons.speaker, label: "Speaker"),
                      buildCallFunctionsBtn(
                          icon: Icons.keyboard, label: "Keypad"),
                      buildCallFunctionsBtn(
                          icon: Icons.mic_off_rounded, label: "Mute"),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCallingBtn(
                      icon: Icons.call_end,
                      label: "",
                      bgColor: Colors.red,
                      iconColor: Colors.white,
                      onTapped: () {
                        callSound.stopSound();
                        Navigator.pop(context);
                      }),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
