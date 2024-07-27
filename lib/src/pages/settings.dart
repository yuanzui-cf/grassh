import 'package:flutter/material.dart';
import 'package:grassh/src/component/automatic_keep_alive_wrapper.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["Global", "Backup", "About"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
