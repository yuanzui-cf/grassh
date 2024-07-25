import 'package:flutter/material.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/models/menu.dart';

class Menu extends StatefulWidget {
  final List<MenuModel> menus;
  const Menu({
    super.key,
    required this.menus,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isHover = false;

  Color getColor(MenuModel state) {
    if (state.on || state.defaultOn) {
      return GlobalConfig.theme.shade100.withOpacity(0.3);
    }
    return GlobalConfig.theme.shade50.withOpacity(0);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.menus.length,
      itemBuilder: (ctx, index) {
        return StatefulBuilder(
          builder: (
            BuildContext context,
            void Function(void Function()) setState,
          ) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) {
                  setState(() {
                    widget.menus[index].on = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    widget.menus[index].on = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: getColor(widget.menus[index]),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Text(
                      widget.menus[index].title,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
