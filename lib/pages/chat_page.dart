import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/chat_models/text_chat.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/widgets/chat_widgets/chat_appbar.dart';
import 'package:santa_app_2024/widgets/chat_widgets/chat_msg_bubble.dart';
import 'package:santa_app_2024/widgets/chat_widgets/chat_text_holder.dart';

import 'package:audioplayers/audioplayers.dart';

class ChatPage extends StatefulWidget {
  final UserChat user;
  const ChatPage({super.key, required this.user});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatText> chatItemsList = [];
  List<ChatText> chatMessagesList = [];
  bool isResponseLoaded = false;
  bool isTyping = false;
  // i still didn't work with these variables to show the animation
  bool isResponseListChanged = false;
  // int responseListLength = 0;

  void messageSound() async {
    final audioPlayer = AudioPlayer();
    const String messageSound = "sounds/iphone_sms_ringtone.mp3";
    // make the file path string to a source to work in the audio player.
    // this plays the audio
    await audioPlayer.play(AssetSource(messageSound));
  }

  @override
  void initState() {
    // i copied this array to have the ability to delete from it .
    for (var element in chatTextData) {
      chatItemsList.add(element);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(chatItemsList);
    return Scaffold(
      appBar: buildAppBar(widget.user, isTyping),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatMessagesList.length,
                itemBuilder: (context, index) {
                  bool isMeTheSender = chatMessagesList[index].isMe;
                  return buildChatMessageBubble(
                    text: isMeTheSender
                        ? chatMessagesList[index].chatQuestion
                        : chatMessagesList[index].chatResponse,
                    isMe: isMeTheSender,
                    isLoaded: isResponseLoaded,
                    isResponseAdded: isResponseListChanged,
                  );
                },
              ),
            ),
            // this creates the list of chat options at the bottom .
            Container(
              height: 55,
              margin: const EdgeInsets.only(bottom: 20),
              // color: Colors.grey,
              child: ListView.builder(
                itemCount: chatItemsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child:
                        buildChatTextHolder(chatItemsList[index].chatQuestion),
                    onTap: () {
                      setState(() {
                        ChatText message = chatItemsList[index];
                        chatMessagesList.add(ChatText(
                            chatQuestion: message.chatQuestion,
                            chatResponse: ""));
                        isTyping = true;
                        sendResponse(message);
                        chatItemsList.removeAt(index);
                      });
                    },
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }

// this function's role is to send the response to the user when he send a question .
// i was trying to add the animation when the response is about to show , but i face some issues,
// until i fix them , but i added the sound when the response is showing , and the effect of the appbar
// to show online or typing... 
  Future<void> sendResponse(ChatText message) async {
    // setState(() {
    //   isResponseLoaded = false;
    // });
    print("$isResponseLoaded in first");
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      messageSound();
      isResponseLoaded = true;
      isTyping = false;
      chatMessagesList.add(ChatText(
          chatQuestion: "", chatResponse: message.chatResponse, isMe: false));
    });
    print("$isResponseLoaded in last");
  }
}
