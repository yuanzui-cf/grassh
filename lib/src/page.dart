import 'package:flutter/cupertino.dart';
import 'package:window_manager/window_manager.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  const MainPage({
    super.key,
    required this.child,
  });

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
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
