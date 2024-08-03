import 'package:flutter/material.dart';
import 'package:grassh/src/component/home/bar.dart';
import 'package:grassh/src/component/home/list.dart';
import 'package:grassh/src/component/label.dart';
import 'package:grassh/src/config/global_config.dart';
import 'package:grassh/src/models/info_cards.dart';
import 'package:grassh/src/page.dart';
import 'package:vector_graphics/vector_graphics.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainPage(
      color: GlobalConfig.theme.surfaceContainerLowest,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: ListView(
            children: const [
              Bar(),
              Label(
                "folder",
                margin: EdgeInsets.only(left: 8, top: 20, bottom: 10),
              ),
              InfoCardList(
                cards: [
                  InfoCardModel(
                    title: "一个文件夹",
                    summary: "0 个内容",
                    image:
                        AssetBytesLoader("assets/images/icons/gsh-folder.vec"),
                  )
                ],
              ),
              Label(
                "terminal",
                margin: EdgeInsets.only(left: 8, top: 20, bottom: 10),
              ),
              InfoCardList(
                cards: [
                  InfoCardModel(title: "🇭🇰 香港 CN2", summary: "ssh, root"),
                  InfoCardModel(title: "🇺🇸 美国西雅图", summary: "ssh, root"),
                  InfoCardModel(title: "🇨🇳 家里云", summary: "ssh, root"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
