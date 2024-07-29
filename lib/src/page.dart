import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  final Color color;
  const MainPage({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragToMoveArea(
          child: Container(
            height: 40,
            color: widget.color,
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: widget.color,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: 40,
              ),
              child: widget.child,
            ),
          ),
        ),
      ],
    );
  }
}
