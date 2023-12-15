import 'package:flutter/material.dart';
import 'package:santa_app_2024/widgets/calling_widgets/calling_btn.dart';

import 'package:video_player/video_player.dart';
import 'package:camera/camera.dart';

class VideoCallPage extends StatefulWidget {
  final List<CameraDescription> cameraDesrList;
  const VideoCallPage({super.key, required this.cameraDesrList});

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  // to play the video
  late VideoPlayerController _controller;
  // the videos from youtube doesn't supported from this package .
  // final String videoUrl = "https://www.youtube.com/watch?v=WVbWdeloQ4s";

  late CameraController _cameraController;

  Future<void> startCamera() async {
    // Filter cameras to include only front cameras
    List<CameraDescription> frontCameras = widget.cameraDesrList
        .where((camera) => camera.lensDirection == CameraLensDirection.front)
        .toList();

    // to give the camera controller which camera it will take and resolution of it.
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

  @override
  void initState() {
    super.initState();
    // initialize the video player.
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((value) {
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
    // initialize the camera.
    startCamera();
  }

  @override
  void deactivate() {
    super.deactivate();
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: _controller.value.isInitialized
                ? VideoPlayer(_controller)
                : const Center(child: CircularProgressIndicator()),
          ),
          Positioned(
            top: 60,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 220,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: _cameraController.value.isInitialized
                    ? CameraPreview(_cameraController)
                    : const Center(child: CircularProgressIndicator.adaptive()),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 175,
            child: buildCallingBtn(
                icon: Icons.call,
                label: "",
                bgColor: Colors.red,
                iconColor: Colors.white,
                onTapped: () {
                  Navigator.pop(context);
                  _cameraController.dispose();
                }),
          ),
        ],
      ),
    );
  }
}
