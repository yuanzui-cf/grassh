import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grassh/src/component/menu.dart';
import 'package:grassh/src/component/window_button.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/models/menu.dart';
import 'package:window_manager/window_manager.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final double _width = 250;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragToMoveArea(
          child: SizedBox(
            width: _width,
            height: 40,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  left: 15,
                  child: WindowButton(
                    color: Colors.red,
                    hoverColor: Colors.red.shade700,
                    callback: () {
                      windowManager.close();
                    },
                  ),
                ),
                Positioned(
                  left: 35,
                  child: WindowButton(
                    color: Colors.yellow.shade600,
                    hoverColor: Colors.yellow.shade800,
                    callback: () async {
                      windowManager.minimize();
                    },
                  ),
                ),
                Positioned(
                  left: 55,
                  child: WindowButton(
                    color: Colors.green,
                    hoverColor: Colors.green.shade700,
                    callback: () async {
                      await windowManager.isMaximized()
                          ? windowManager.unmaximize()
                          : windowManager.maximize();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: _width - 30,
          child: Text(
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: GlobalConfig.theme.shade900,
            ),
            "GrassH",
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 0,
          ),
          child: Menu(
            menus: [
              MenuModel(
                icon: Icons.home,
                title: AppLocalizations.of(context)!.menu_home,
              ),
              MenuModel(icon: Icons.terminal, title: "终端"),
              MenuModel(icon: Icons.settings, title: "设置"),
            ],
          ),
        ),
      ],
    );
  }
}
