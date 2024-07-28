import 'package:flutter/material.dart';
import 'package:grassh/src/config/config.dart';
import 'package:grassh/src/config/global_config.dart';

class ConfigNotifier extends ChangeNotifier {
  Config get config => GlobalConfig.config;

  @override
  void notifyListeners() {
    GlobalConfig.config.save();
    super.notifyListeners();
  }
}
