import 'package:flutter/material.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.menu_home,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: GlobalConfig.theme.surfaceContainer,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
