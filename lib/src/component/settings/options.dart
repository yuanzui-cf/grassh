import 'package:flutter/material.dart';

class SettingsOption extends StatefulWidget {
  final Map<String, String> options;
  final String name;
  final String? initialOption;
  final Function(String?)? callback;
  const SettingsOption({
    super.key,
    required this.name,
    required this.options,
    this.initialOption,
    this.callback,
  });

  @override
  State<SettingsOption> createState() => _SettingsOptionState();
}

class _SettingsOptionState extends State<SettingsOption> {
  _buildEntry() {
    List<DropdownMenuEntry<String>> entries = [];
    for (var e in widget.options.keys) {
      entries.add(
        DropdownMenuEntry(
          value: e,
          label: widget.options[e]!,
        ),
      );
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(widget.name)),
        DropdownMenu(
          dropdownMenuEntries: _buildEntry(),
          initialSelection: widget.initialOption,
          onSelected: widget.callback,
        ),
      ],
    );
  }
}
