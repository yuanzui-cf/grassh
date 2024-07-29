import 'package:flutter/material.dart';
import 'package:grassh/src/config/global_config.dart';

class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                isCollapsed: true,
                hintText: "Search",
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: GlobalConfig.theme.surfaceContainer,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
