import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalConfig {
  static late MaterialColor theme;
  static late PackageInfo packageInfo;

  static Future init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}
