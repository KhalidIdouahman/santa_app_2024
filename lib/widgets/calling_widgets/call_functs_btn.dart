import 'package:flutter/material.dart';

typedef CallbackAction = void Function();

// this for the designed buttons in the call page.

Widget buildCallFunctionsBtn({
  required IconData icon,
  required String label,
  CallbackAction? onTapped,
}) {
  return GestureDetector(
    onTap: onTapped,
    child: Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.only(top: 15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 22,
            color: Colors.white,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          )
        ],
      ),
    ),
  );
}
