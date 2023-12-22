import 'package:flutter/material.dart';

class HomeItemsData {
  final IconData firstIcon;
  final IconData lastIcon;
  final String title;
  final String subtitle;
  final List<Color> color;

  HomeItemsData({
    required this.firstIcon,
    required this.lastIcon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}

class SideBarData {
  final IconData icon;
  final String title;
  final String subtitle;
  // final Color color;

  SideBarData({
    required this.icon,
    required this.title,
    required this.subtitle,
    // required this.color,
  });
}
