import 'package:camera/camera.dart';

// i didn't work with this file but i will try it .

class AccessToCamera {
  // late List<CameraDescription> _cameras;
  late CameraController _cameraController;

  Future<void> startCamera(List<CameraDescription> camerasList) async {
    // _cameras = await availableCameras();

    // Filter cameras to include only front cameras
    List<CameraDescription> frontCameras = camerasList
        .where((camera) => camera.lensDirection == CameraLensDirection.front)
        .toList();

    _cameraController = CameraController(
      frontCameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController.initialize().then((_) {
      
      // if (!mounted) {
      //   return;
      // }
      // setState(() {});
    });
  }

  void disposeCamera() async {
    await _cameraController.dispose();
    // _cameraController = null;
  }

}
