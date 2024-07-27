import 'package:flutter/material.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/models/menu.dart';

class Menu extends StatefulWidget {
  final List<MenuModel> menus;
  final int initialIndex;

  const Menu({
    super.key,
    required this.menus,
    this.initialIndex = 0,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool isHover = false;
  int currentIndex = -1;

  Color getColor(MenuModel state, int index) {
    if (currentIndex == index || state.isHover) {
      return GlobalConfig.theme.shade100.withOpacity(0.3);
    }
    return GlobalConfig.theme.shade50.withOpacity(0);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.menus.isNotEmpty && currentIndex == -1) {
      if (widget.initialIndex >= widget.menus.length) {
        currentIndex = 0;
      } else {
        currentIndex = widget.initialIndex;
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.menus.length,
      itemBuilder: (ctx, index) {
        List<Widget> opt = [];
        if (widget.menus[index].icon != null) {
          opt.addAll([
            Icon(
              widget.menus[index].icon,
            ),
            const SizedBox(width: 5),
          ]);
        }
        opt.add(Text(
          widget.menus[index].title,
        ));
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) {
              setState(() {
                widget.menus[index].isHover = true;
              });
            },
            onExit: (event) {
              setState(() {
                widget.menus[index].isHover = false;
              });
            },
            child: InkWell(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                widget.menus[index].callback?.call();
              },
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: getColor(widget.menus[index], index),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Row(
                      children: opt,
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
