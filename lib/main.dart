import 'package:flutter/material.dart';
import 'package:santa_app_2024/pages/home_page.dart';

import 'package:camera/camera.dart';

late List<CameraDescription> camerasList;

Future<void> main() async {
  // initialize the camera and pass it to the making_video_call and video_call pages to work with it.
  WidgetsFlutterBinding.ensureInitialized();
  camerasList = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Santa Call App',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: HomeScreen(camerasDesList: camerasList),
    );
  }
}
