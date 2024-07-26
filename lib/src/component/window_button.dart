import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

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
  bool _isPressed = false;

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
    return Listener(
      onPointerDown: (e) {
        if (e.buttons == kPrimaryButton) {
          _isPressed = true;
        }
      },
      onPointerCancel: (e) {
        _isPressed = false;
      },
      onPointerUp: (e) {
        if (_isPressed) {
          widget.callback?.call();
          _isPressed = false;
        }
      },
      child: MouseRegion(
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
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
  void onWindowEvent(String event) {
    switch (event) {
      case 'focus':
      case 'blur':
        () async {
          final bool isFocused = await windowManager.isFocused();
          setState(() {
            _isFocus = isFocused;
          });
        }();
    }
  }
}
