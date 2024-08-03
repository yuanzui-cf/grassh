import 'package:flutter/material.dart';
import 'package:grassh/src/component/automatic_keep_alive_wrapper.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/config/language_config.dart';
import 'package:grassh/src/models/language.dart';
import 'package:grassh/src/pages/home.dart';
import 'package:grassh/src/pages/settings.dart';
import 'package:grassh/src/pages/terminal.dart';
import 'package:grassh/src/sidebar.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  PageController? pageController;
  Widget? pageView;
  int currentPage = -1;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    pageView = PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        KeepAliveWrapper(child: HomePage()),
        KeepAliveWrapper(child: TerminalPage()),
        KeepAliveWrapper(child: SettingsPage()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Localizations.override(
        context: context,
        locale: languageCode[context.watch<LanguageModel>().language],
        child: Row(children: <Widget>[
          Expanded(
            flex: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 250,
              color: GlobalConfig.theme.surfaceBright,
              child: Sidebar(
                pageController: pageController,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: pageView,
            ),
          ),
        ]),
      ),
    );
  }
}
