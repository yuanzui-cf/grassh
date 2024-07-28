import 'package:flutter/material.dart';
import 'package:grassh/src/component/settings/options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grassh/src/config/language_config.dart';

class GlobalSettings extends StatefulWidget {
  const GlobalSettings({super.key});

  @override
  State<GlobalSettings> createState() => _GlobalSettingsState();
}

class _GlobalSettingsState extends State<GlobalSettings> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> langs = {};
    for (var lang in AppLocalizations.supportedLocales) {
      langs[lang.toLanguageTag()] = language[lang.toLanguageTag()]!;
    }
    return ListView(
      children: [
        SettingsOption(
          name: "语言",
          options: langs,
          initialOption: Localizations.localeOf(context).toLanguageTag(),
          callback: (e) {
            // TODO: 切换语言
          },
        ),
      ],
    );
  }
}
