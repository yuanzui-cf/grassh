import 'package:flutter/material.dart';

class MenuModel {
  final IconData? icon;
  final String title;
  bool isHover = false;
  final void Function()? callback;

  MenuModel({
    required this.title,
    this.icon,
    this.callback,
  });
}
