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

class _WindowButtonState extends State<WindowButton> with WindowListener {
  bool _isHover = false;
  bool _isFocus = true;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  Color getColor() {
    if (!_isFocus) {
      return Colors.grey;
    }
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
      child: Listener(
        onPointerUp: (e) {
          widget.callback?.call();
        },
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

  @override
  void onWindowFocus() {
    setState(() {
      _isFocus = true;
    });
  }

  @override
  void onWindowBlur() {
    setState(() {
      _isFocus = false;
    });
  }
}
