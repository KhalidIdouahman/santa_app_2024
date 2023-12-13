import 'package:flutter/material.dart';

typedef CallbackAction = void Function();

Widget buildImageBtn(IconData icon, CallbackAction onBtnClicked) {
    return GestureDetector(
      onTap: onBtnClicked,
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white70),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }