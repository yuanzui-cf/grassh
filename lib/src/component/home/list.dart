import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grassh/src/component/home/cards.dart';
import 'package:grassh/src/models/info_cards.dart';

class InfoCardList extends StatefulWidget {
  final List<InfoCardModel> cards;
  const InfoCardList({
    super.key,
    required this.cards,
  });

  @override
  State<InfoCardList> createState() => _InfoCardListState();
}

class _InfoCardListState extends State<InfoCardList> {
  double _getWidth() {
    double boxWidth = MediaQuery.of(context).size.width - 330;
    int columns = 2;
    if (boxWidth > 1000) {
      boxWidth = 1000;
    }
    if (boxWidth > 800) {
      columns = 3;
    }
    return (boxWidth - (columns - 1) * 10) / columns - 1;
  }

  List<InfoCard> _getCards() {
    List<InfoCard> list = [];
    for (var i in widget.cards) {
      list.add(InfoCard(
        width: _getWidth(),
        title: i.title,
        summary: i.summary,
        image: SvgPicture(i.image),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 330,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: _getCards(),
      ),
    );
  }
}
