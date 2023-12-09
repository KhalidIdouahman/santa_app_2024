import 'package:flutter/material.dart';

typedef CallbackAction = void Function();

// this makes the buttons for the making call page and call page.

Widget buildCallingBtn(
    {required IconData icon,
    String? label,
    required Color bgColor,
    required Color iconColor,
    required CallbackAction onTapped}
    ) {
  return Column(
    children: [
      GestureDetector(
        onTap: onTapped,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
          ),
          child: Icon(
            icon,
            size: 26,
            color: iconColor,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        label!,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
      )
    ],
  );
}
