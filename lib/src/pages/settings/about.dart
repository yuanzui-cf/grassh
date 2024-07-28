import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grassh/src/config/global_config.dart';

class AboutSettings extends StatefulWidget {
  const AboutSettings({super.key});

  @override
  State<AboutSettings> createState() => _AboutSettingsState();
}

class _AboutSettingsState extends State<AboutSettings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 100,
          height: 100,
          child: Image(
            image: AssetImage("assets/images/Logo.webp"),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.title,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: GlobalConfig.theme.withGreen(50).withBlue(10).withRed(10),
          ),
        ),
        Text(
          "v${GlobalConfig.packageInfo.version}",
        ),
        const Text(
          "Copyright (c) 2024 Grass Development Team.",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
