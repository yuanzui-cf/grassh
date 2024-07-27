import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grassh/src/component/menu.dart';
import 'package:grassh/src/component/window_button.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/models/menu.dart';
import 'package:window_manager/window_manager.dart';

class Sidebar extends StatefulWidget {
  final PageController? pageController;
  const Sidebar({
    super.key,
    required this.pageController,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragToMoveArea(
          child: SizedBox(
            width: 250,
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
          width: 220,
          child: Text(
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: GlobalConfig.theme.shade900,
            ),
            AppLocalizations.of(context)!.title,
          ),
        ),
        const SizedBox(
          height: 15,
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
                callback: () {
                  widget.pageController?.jumpToPage(0);
                },
              ),
              MenuModel(
                icon: Icons.terminal,
                title: AppLocalizations.of(context)!.menu_terminal,
                callback: () {
                  widget.pageController?.jumpToPage(1);
                },
              ),
              MenuModel(
                icon: Icons.settings,
                title: AppLocalizations.of(context)!.menu_settings,
                callback: () {
                  widget.pageController?.jumpToPage(2);
                },
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        const SizedBox(
          width: 220,
          child: Text(
            "v0.0.0-alpha",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFFB6B6B6),
            ),
          ),
        ),
      ],
    );
  }
}
