import 'dart:io';

import 'package:toml/toml.dart';

class Config {
  late Map<String, dynamic> conf;
  String path;

  Config({
    required this.path,
    required Map<String, dynamic> defaultConfig,
  }) {
    conf = defaultConfig;
    init(path, defaultConfig);
  }

  init(String path, Map<String, dynamic> defaultConfig) {
    var f = File(path);
    _configFileCheck(f);
    read();
  }

  save() {
    var f = File(path);
    _configFileCheck(f);
    try {
      var config = TomlDocument.fromMap(conf).toString();
      f.writeAsStringSync(config);
    } catch (e) {
      rethrow;
    }
  }

  read() {
    var f = File(path);
    _configFileCheck(f);
    var ctx = f.readAsStringSync();
    try {
      conf = TomlDocument.parse(ctx).toMap();
    } catch (e) {
      rethrow;
    }
  }

  _configFileCheck(File f) {
    if (!f.existsSync()) {
      f.createSync();
      try {
        var config = TomlDocument.fromMap(conf).toString();
        f.writeAsStringSync(config);
      } catch (e) {
        rethrow;
      }
    }
  }
}
