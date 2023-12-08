import 'package:flutter/material.dart';

Container buildChatTextHolder(String chatText) {
  return Container(
    // height: 50,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(8),
    child: Text(chatText , style: const TextStyle(color: Colors.white , fontSize: 16)),
  );
}
