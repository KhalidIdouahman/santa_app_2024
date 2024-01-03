import 'package:flutter/material.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/calling_page/call_page.dart';
import 'package:santa_app_2024/widgets/calling_widgets/calling_btn.dart';

import 'package:santa_app_2024/functionalities/audio_playing.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:santa_app_2024/models/firestore_model/firestore_model.dart';
import 'package:santa_app_2024/widgets/calling_widgets/call_bg_with_blur.dart';

class MakeCallPage extends StatefulWidget {
  final UserChat user;
  // i pass the character obj and let the user for the default case of santa.
  // if the character is passed i show his data , else the data of santa.
  final Character? character;
  const MakeCallPage({super.key, required this.user, this.character});

  @override
  State<MakeCallPage> createState() => _MakeCallPageState();
}

class _MakeCallPageState extends State<MakeCallPage> {
  final makingSound = SoundPlayer();
  final String ringtonePath = "sounds/iphone_6_original_ringtone.mp3";

  @override
  void initState() {
    makingSound.playSound(ringtonePath);
    super.initState();
  }

  @override
  void dispose() {
    // this to stop the sound when he quit the page
    makingSound.stopSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final character = widget.character;
    final bool isCharacterNull = widget.character == null;

    return Scaffold(
      body: Stack(
        children: [
          buildBackgroundImgWithBlur(character),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this column shows the image with the name and the phoneNum.
              Column(
                children: [
                  isCharacterNull
                      ? CircleAvatar(
                          backgroundImage: AssetImage(widget.user.imgUrl),
                          radius: 50,
                        )
                      : CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              character!.characterImg),
                          radius: 50,
                        ),
                  const SizedBox(height: 15),
                  Text(
                    isCharacterNull
                        ? widget.user.userName
                        : character!.characterName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    isCharacterNull
                        ? widget.user.phoneNum!
                        : character!.characterNum,
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
                      makingSound.stopSound();
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
                      makingSound.stopSound();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CallPage(
                                user: widget.user,
                                character: character,
                              )));
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
