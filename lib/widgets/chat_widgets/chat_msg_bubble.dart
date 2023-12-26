import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/colors.dart';

import 'package:lottie/lottie.dart';

// i added isLoaded property to show the lottie animation of typing when it's false, until the
// response is loaded.

Widget buildChatMessageBubble({
  required String text,
  bool isMe = false,
  required bool isLoaded,
  required bool isResponseAdded,
}) {
  // this align widget is for align the message bubble according to the sender (previously).
  // now i work just with mainAxixAlignment of the row widget.
  return Container(
    // this to separete the messages .
    width: double.infinity,
    margin: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe)
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/santa_calling.jpg"),
            radius: 16,
          ),
        //  i add the flexible widget for the long messages to display properly and don't overflowed from the screen.
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: isMe ? gredientColor2 : gredientColor8),
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
            ),
            // child: (isLoaded && isMe) && isThereMessages ? Text(
            //   text,
            //   style: const TextStyle(color: Colors.white),
            // ) : Lottie.asset('assets/animation/chat_typing_anim.json' , width: 40 , height: 40)),
            child: !isLoaded && !isMe && !isResponseAdded
                ? Lottie.asset('assets/animation/chat_typing_anim.json',
                    width: 40, height: 40)
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
          ),
        ),
        // this shows the image before the message bubble properly .
        // if (isMe)
        // const CircleAvatar(
        //   backgroundImage: AssetImage("assets/images/anonym_kid.jpg"),
        //   radius: 16,
        // ),
      ],
    ),
  );
}
