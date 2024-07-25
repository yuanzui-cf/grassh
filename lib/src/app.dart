import 'package:flutter/material.dart';
import 'package:grassh/src/component/window_button.dart';
import 'package:grassh/src/page.dart';
import 'package:grassh/src/sidebar.dart';
import 'package:window_manager/window_manager.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}
// Container(
//         children: [
//           DragToMoveArea(
//             child: Positioned(
//               child: Stack(
//                 alignment: Alignment.centerLeft,
//                 children: [
//                   Container(
//                     height: 40,
//                   ),
//                   Positioned(
//                     left: 15,
//                     child: WindowButton(
//                       color: Colors.red,
//                       hoverColor: Colors.red.shade700,
//                       callback: () async {
//                         windowManager.close();
//                       },
//                     ),
//                   ),
//                   Positioned(
//                     left: 35,
//                     child: WindowButton(
//                       color: Colors.yellow.shade600,
//                       hoverColor: Colors.yellow.shade800,
//                       callback: () async {
//                         await windowManager.isMaximized()
//                             ? await windowManager.unmaximize()
//                             : await windowManager.maximize();
//                       },
//                     ),
//                   ),
//                   Positioned(
//                     left: 55,
//                     child: WindowButton(
//                       color: Colors.green,
//                       hoverColor: Colors.green.shade700,
//                       callback: () async {
//                         windowManager.minimize();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        Expanded(
          flex: 0,
          child: Container(
            width: 250,
            color: const Color.fromARGB(255, 255, 248, 248),
            child: const Sidebar(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const MainPage(),
          ),
        ),
      ]),
    );
  }
}
