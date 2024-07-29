import 'package:flutter/material.dart';

class InfoCardModel {
  final String title;
  final String summary;
  final Image image;
  final void Function()? callback;

  const InfoCardModel({
    required this.title,
    required this.summary,
    this.image = const Image(image: AssetImage("assets/images/Logo.webp")),
    this.callback,
  });
}
