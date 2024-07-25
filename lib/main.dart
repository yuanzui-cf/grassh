import 'package:flutter/material.dart';
import 'package:grassh/src/app.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 600),
    minimumSize: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const GrassH());
}

class GrassH extends StatelessWidget {
  const GrassH({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalConfig.init(Colors.green);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GrassH',
      home: App(),
    );
  }
}