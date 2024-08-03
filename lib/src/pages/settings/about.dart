import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 100,
          height: 100,
          child: SvgPicture(
            AssetBytesLoader("assets/images/gsh-logo.vec"),
          ),
        ),
        Text(
          AppLocalizations.of(context)!.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "v${GlobalConfig.packageInfo.version}${GlobalConfig.packageInfo.buildNumber != "" ? "-${GlobalConfig.packageInfo.buildNumber}" : ""}",
        ),
        const Text(
          "Copyright © 2024 Grass Development Team.",
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
