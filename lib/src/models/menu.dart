import 'package:flutter/material.dart';

class MenuModel {
  final IconData? icon;
  final String title;
  bool defaultOn;
  bool on = false;

  MenuModel({
    required this.title,
    this.icon,
    this.defaultOn = false,
  });
}
