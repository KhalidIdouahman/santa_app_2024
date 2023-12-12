import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/colors.dart';

// this let the taps work .
typedef CallbackAction = void Function();

// this is the previous design of the header .

// Widget buildHeader(BuildContext context,
//     {required CallbackAction onSettingsClicked,
//     required CallbackAction onFavoriteClicked}) {
      
//   return Container(
//     width: double.infinity,
//     height: MediaQuery.of(context).size.height * 0.35,
//     padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
//     decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gredientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         )),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // settings button
//             InkWell(
//               onTap: onSettingsClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.settings,
//                   color: Colors.black,
//                   size: 18,
//                 ),
//               ),
//             ),
//             // favorite button
//             InkWell(
//               onTap: onFavoriteClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                   size: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // image in the center
//         CircleAvatar(
//             backgroundColor: Colors.transparent,
//             radius: 50,
//             child: ClipOval(
//               child: Image.asset(
//                 "assets/images/santa_calling.jpg",
//                 height: 200,
//                 width: 200,
//                 fit: BoxFit.cover,
//               ),
//             )),
//         const SizedBox(height: 25),
//         const Text(
//           "Santa Claus",
//           style: TextStyle(
//               fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Call Puppet!",
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ],
//     ),
//   );
// }

// and this how it become to work with animation :


Widget buildHeader({
  required BuildContext context,
  required CallbackAction onSettingsClicked,
  required CallbackAction onFavoriteClicked,
}) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.35,
    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gredientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        )),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // settings button
            InkWell(
              onTap: onSettingsClicked,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[350],
                child: const Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            // favorite button
            InkWell(
              onTap: onFavoriteClicked,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[350],
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/santa_calling.jpg"),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "Santa Claus",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Call Puppet!",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}