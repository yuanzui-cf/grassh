import 'package:flutter/material.dart';

class GlobalConfig {
  static late MaterialColor theme;

  static void init(MaterialColor theme) {
    GlobalConfig.theme = theme;
  }
}
