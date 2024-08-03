import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final EdgeInsets? margin;
  const Label(this.text, {super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 10, left: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFFB6B6B6),
        ),
      ),
    );
  }
}
