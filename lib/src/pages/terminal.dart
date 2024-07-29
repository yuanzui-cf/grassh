import 'package:flutter/material.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/page.dart';

class TerminalPage extends StatefulWidget {
  const TerminalPage({super.key});

  @override
  State<TerminalPage> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      color: Colors.black87,
      child: SizedBox(
        child: Text(
          "Terminal",
          style: TextStyle(color: GlobalConfig.theme.onPrimary),
        ),
      ),
    );
  }
}
