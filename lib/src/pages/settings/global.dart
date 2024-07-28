import 'package:flutter/material.dart';
import 'package:grassh/src/component/settings/options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grassh/src/config/language_config.dart';
import 'package:grassh/src/models/language.dart';
import 'package:provider/provider.dart';

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
          name: AppLocalizations.of(context)!.page_settings_global_language,
          options: langs,
          initialOption: Localizations.localeOf(context).toLanguageTag(),
          callback: (e) {
            context.read<LanguageModel>().language =
                (e != null && language.keys.contains(e)) ? e : "zh-CN";
          },
        ),
      ],
    );
  }
}
