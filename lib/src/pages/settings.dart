import 'package:flutter/material.dart';
import 'package:grassh/src/component/automatic_keep_alive_wrapper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/page.dart';
import 'package:grassh/src/pages/settings/about.dart';
import 'package:grassh/src/pages/settings/global.dart';
import 'package:grassh/src/pages/settings/sync.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late Map tabsName;
  List tabs = [
    "global",
    "sync",
    "about",
  ];

  final Map tabsPageWidgets = const {
    "global": GlobalSettings(),
    "sync": SyncSettings(),
    "about": AboutSettings(),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    tabsName = {
      "global": AppLocalizations.of(context)?.page_settings_tab_global,
      "sync": AppLocalizations.of(context)?.page_settings_tab_sync,
      "about": AppLocalizations.of(context)?.page_settings_tab_about,
    };
    return MainPage(
      color: GlobalConfig.theme.surfaceContainerLowest,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  controller: _tabController,
                  tabs: tabs.map((e) => Tab(text: tabsName[e])).toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TabBarView(
                    controller: _tabController,
                    children: tabs.map((e) {
                      return KeepAliveWrapper(
                        child: tabsPageWidgets[e],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
