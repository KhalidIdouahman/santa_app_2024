import 'package:flutter/material.dart';

class ScheduleCallObj {
  final IconData prefixIcon;
  final int duration;
  final String unit;
  final IconData sufixIcon;

  const ScheduleCallObj({
    required this.prefixIcon,
    required this.duration,
    required this.unit,
    required this.sufixIcon,
  });
}