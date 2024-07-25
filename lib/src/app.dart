import 'package:flutter/material.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/page.dart';
import 'package:grassh/src/sidebar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        Expanded(
          flex: 0,
          child: Container(
            width: 250,
            color: GlobalConfig.theme.shade50.withOpacity(0.6),
            child: const Sidebar(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: const MainPage(),
          ),
        ),
      ]),
    );
  }
}
