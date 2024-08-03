import 'package:grassh/src/config/config_notifier.dart';
import 'package:grassh/src/config/global_config.dart';

class LanguageModel extends ConfigNotifier {
  String get language => GlobalConfig.config.conf["global"]["language"];

  set language(String v) {
    GlobalConfig.config.conf["global"]["language"] = v;
    notifyListeners();
  }
}
