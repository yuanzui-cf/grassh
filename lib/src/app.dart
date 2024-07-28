import 'package:flutter/material.dart';
import 'package:grassh/src/component/automatic_keep_alive_wrapper.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/page.dart';
import 'package:grassh/src/pages/home.dart';
import 'package:grassh/src/pages/settings.dart';
import 'package:grassh/src/pages/terminal.dart';
import 'package:grassh/src/sidebar.dart';

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
        locale: const Locale('zh', 'CN'),
        child: Row(children: <Widget>[
          Expanded(
            flex: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 250,
              color: GlobalConfig.theme.shade50.withOpacity(0.6),
              child: Sidebar(
                pageController: pageController,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              color: Colors.white,
              child: MainPage(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    bottom: 40,
                  ),
                  child: pageView,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
