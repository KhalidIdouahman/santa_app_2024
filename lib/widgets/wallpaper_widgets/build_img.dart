import 'package:flutter/material.dart';

Widget buildImage({
    required int imageIndex,
    required String imageUrl,
    required Widget shareBtn,
    required Widget downloadBtn,
  }) {
    return Hero(
      tag: imageIndex,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 50),
          alignment: Alignment.bottomCenter,
          // color: Colors.black.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              shareBtn,
              const SizedBox(width: 50),
              downloadBtn,
            ],
          ),
        ),
      ),
    );
  }
