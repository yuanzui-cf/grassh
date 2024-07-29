import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grassh/src/app.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/models/language.dart';
import 'package:provider/provider.dart';
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

  await GlobalConfig.init();
  GlobalConfig.theme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF008A35),
    brightness: Brightness.light,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageModel()),
      ],
      child: const GrassH(),
    ),
  );
}

class GrassH extends StatelessWidget {
  const GrassH({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GrassH',
      home: const App(),
      theme: ThemeData(
        colorScheme: GlobalConfig.theme,
        useMaterial3: true,
        fontFamilyFallback: const [
          'Twemoji',
          'Microsoft YaHei',
          '.AppleSystemUIFont',
          'PingFang SC',
        ],
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
