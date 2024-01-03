import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/widgets/calling_widgets/call_functs_btn.dart';
import 'package:santa_app_2024/widgets/calling_widgets/calling_btn.dart';

import 'package:santa_app_2024/functionalities/audio_playing.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/interstitial_pusher.dart';

import 'package:santa_app_2024/models/firestore_model/firestore_model.dart';
import 'package:santa_app_2024/widgets/calling_widgets/call_bg_with_blur.dart';

class CallPage extends StatefulWidget {
  final UserChat user;
  // i pass the character obj and let the user for the default case of santa.
  final Character? character;
  const CallPage({super.key, required this.user, this.character});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final callSound = SoundPlayer();
  final callSoundPath = "sounds/santa_reading_christmas_story.mp3";

  // to show an interstitial after ending the video call.
  final IronSourceInterstitialPusher interstitialAd =
      IronSourceInterstitialPusher(
    loadNextInterstitial: () {
      IronSource.loadInterstitial();
    },
  );

  @override
  void initState() {
    callSound.playSound(callSoundPath);
    // load interstitial ot be ready to show
    IronSource.loadInterstitial();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Character? character = widget.character;
    final bool isCharacterNull = character == null;
    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImgWithBlur(character),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  isCharacterNull ?
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.user.imgUrl),
                    radius: 50,
                  ) :
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(character.characterImg),
                    radius: 50,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    isCharacterNull ?
                    widget.user.userName : character.characterName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    isCharacterNull ? 
                    widget.user.phoneNum! : character.characterNum,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
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
                        interstitialAd.showInterstitialAd();
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
