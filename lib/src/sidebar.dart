import 'package:flutter/material.dart';
import 'package:grassh/src/component/window_button.dart';
import 'package:window_manager/window_manager.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragToMoveArea(
          child: Container(
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
                      await windowManager.isMaximized()
                          ? windowManager.unmaximize()
                          : windowManager.maximize();
                    },
                  ),
                ),
                Positioned(
                  left: 55,
                  child: WindowButton(
                    color: Colors.green,
                    hoverColor: Colors.green.shade700,
                    callback: () async {
                      windowManager.minimize();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
