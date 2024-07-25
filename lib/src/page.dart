import 'package:flutter/cupertino.dart';
import 'package:window_manager/window_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DragToMoveArea(
          child: Container(
            height: 40,
          ),
        ),
      ],
    );
  }
}
