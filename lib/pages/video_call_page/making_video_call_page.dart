import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/video_call_page/video_call_page.dart';
import 'package:santa_app_2024/widgets/calling_widgets/calling_btn.dart';

import 'package:santa_app_2024/functionalities/audio_playing.dart';

class MakeVideoCallPage extends StatefulWidget {
  final UserChat user;
  final List<CameraDescription> cameras;
  const MakeVideoCallPage({
    super.key,
    required this.user,
    required this.cameras,
  });

  @override
  State<MakeVideoCallPage> createState() => _MakeVideoCallPageState();
}

class _MakeVideoCallPageState extends State<MakeVideoCallPage> {
  // this for making sound
  final makingSound = SoundPlayer();
  final String ringtonePath = "sounds/iphone_6_original_ringtone.mp3";

  // this for the accessing camera
  late CameraController _cameraController;

  Future<void> startCamera() async {
    // Filter cameras to include only front cameras
    List<CameraDescription> frontCameras = widget.cameras
        .where((camera) => camera.lensDirection == CameraLensDirection.front)
        .toList();

    _cameraController = CameraController(
      frontCameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    await _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  // dispose() async {
  // }

  @override
  void initState() {
    makingSound.playSound(ringtonePath);
    startCamera();
    super.initState();
  }

  @override
  void deactivate() {
    makingSound.stopSound();
    super.deactivate();
  }

  @override
  void dispose() {
    makingSound.stopSound();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // to let the image expand in the whole screen
        fit: StackFit.expand,
        children: [
          _cameraController.value.isInitialized
              ? CameraPreview(_cameraController)
              : const Center(child: CircularProgressIndicator.adaptive()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this column shows the image with the name and the phoneNum.
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
              // and this column shows the icon with the text.
              const Column(
                children: [
                  Icon(Icons.phone, color: Colors.white, size: 30),
                  SizedBox(height: 10),
                  Text(
                    "Incoming Video Call...",
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
                      _cameraController.dispose();
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
                      _cameraController.dispose();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => VideoCallPage(
                                cameraDesrList: widget.cameras,
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
