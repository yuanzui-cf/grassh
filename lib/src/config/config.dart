import 'dart:io';

import 'package:toml/toml.dart';

class Config {
  Map<String, dynamic>? conf;
  String path;

  Config({
    required this.path,
    required Map<String, dynamic> defaultConfig,
  }) {
    init(path, defaultConfig);
  }

  init(String path, Map<String, dynamic> defaultConfig) {
    var f = File(path);
    if (!f.existsSync()) {
      f.createSync();
      try {
        var config = TomlDocument.fromMap(defaultConfig).toString();
        f.writeAsStringSync(config);
      } catch (e) {
        rethrow;
      }
    }
    var ctx = f.readAsStringSync();
    try {
      var config = TomlDocument.parse(ctx).toMap();
      conf = config;
    } catch (e) {
      rethrow;
    }
  }
}
