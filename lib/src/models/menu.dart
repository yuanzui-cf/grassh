import 'package:flutter/material.dart';

class MenuModel {
  final IconData? icon;
  final String title;
  bool isHover = false;

  MenuModel({
    required this.title,
    this.icon,
  });
}
