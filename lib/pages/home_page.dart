import 'package:flutter/material.dart';
import 'package:santa_app_2024/widgets/header_of_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            buildHeader(context),
            // ListView(
            //   children: [
            //     // Wallpaper section
            //     Container(
            //       height: 200,
            //       child: Image.asset('assets/santa_claus_wallpaper.png'),
            //     ),
      
            //     // Chat section
            //     ListTile(
            //       leading: Icon(Icons.chat),
            //       title: Text('Chat'),
            //       subtitle: Text('Open chat and talk!'),
            //       trailing: Icon(Icons.arrow_forward_ios),
            //       onTap: () {
            //         // Navigate to the chat screen
            //       },
            //     ),
      
            //     // Calling section
            //     ListTile(
            //       leading: Icon(Icons.phone),
            //       title: Text('Calling'),
            //       subtitle: Text('Call Puppet now!'),
            //       trailing: Icon(Icons.arrow_forward_ios),
            //       onTap: () {
            //         // Make a call to Santa's puppet
            //       },
            //     ),
      
            //     // Video call section
            //     ListTile(
            //       leading: Icon(Icons.videocam),
            //       title: Text('Video Call'),
            //       subtitle: Text('Make Video Call Camera'),
            //       trailing: Icon(Icons.arrow_forward_ios),
            //       onTap: () {
            //         // Make a video call to Santa's puppet
            //       },
            //     ),
      
            //     // Puppets section
            //     ListTile(
            //       leading: Icon(Icons.group),
            //       title: Text('Puppets'),
            //       subtitle: Text('Call and chat Others Puppets'),
            //       trailing: Icon(Icons.arrow_forward_ios),
            //       onTap: () {
            //         // Navigate to the puppets screen
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    ));
  }
}
