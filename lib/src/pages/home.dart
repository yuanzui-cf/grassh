import 'package:flutter/material.dart';
import 'package:grassh/src/component/home/list.dart';
import 'package:grassh/src/models/info_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: const Column(
          children: [
            InfoCardList(
              cards: [InfoCardModel(title: "a", summary: "b")],
            )
          ],
        ),
      ),
    );
  }
}
