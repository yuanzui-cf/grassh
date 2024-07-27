import 'package:flutter/material.dart';
import 'package:grassh/src/component/automatic_keep_alive_wrapper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List tabs;

  @override
  void initState() {
    super.initState();
    tabs = [
      "global",
      "sync",
      "about",
    ];
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      AppLocalizations.of(context)?.page_settings_tab_global,
      AppLocalizations.of(context)?.page_settings_tab_sync,
      AppLocalizations.of(context)?.page_settings_tab_about,
    ];
    return Column(
      children: [
        Expanded(
          flex: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList(), 
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((e) {
                return KeepAliveWrapper(
                  child: Container(
                    alignment: Alignment.center,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
