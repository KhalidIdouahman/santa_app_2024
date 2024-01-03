import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:santa_app_2024/constants/text.dart';
// import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/models/firestore_model/firestore_model.dart';

typedef CallbackAction = void Function();

Widget buildCharacterListItem(
    {required Character character, required CallbackAction onItemClicked}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
    child: Card(
      child: InkWell(
        onTap: onItemClicked,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                // it should load from the network.
                backgroundImage: CachedNetworkImageProvider(character.characterImg),
                // backgroundImage: AssetImage(usersList.first.imgUrl),
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.characterName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    character.characterNum,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
              // const SizedBox(width: 0.1),
              const Icon(
                Icons.call,
                color: Colors.black,
                size: 22,
              )
            ],
          ),
        ),
      ),
    ),
  );
}