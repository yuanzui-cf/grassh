import 'package:flutter/material.dart';

class WindowButton extends StatefulWidget {
  final Color color;
  final Color hoverColor;
  final void Function()? callback;

  const WindowButton({
    super.key,
    required this.color,
    required this.hoverColor,
    this.callback,
  });

  @override
  State<WindowButton> createState() => _WindowButtonState();
}

class _WindowButtonState extends State<WindowButton> {
  bool _isHover = false;
  // bool _isPress = false;

  Color getColor() {
    if (_isHover) {
      return widget.hoverColor;
    }
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onExit: (e) {
        setState(() {
          _isHover = false;
        });
      },
      onEnter: (e) {
        setState(() {
          _isHover = true;
        });
      },
      child: GestureDetector(
        onTap: widget.callback,
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: getColor(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
