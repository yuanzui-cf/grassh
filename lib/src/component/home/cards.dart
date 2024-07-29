import 'package:flutter/material.dart';
import 'package:grassh/src/config/global_config.dart';

class InfoCard extends StatefulWidget {
  final double? width;
  final String title;
  final String summary;
  final Image image;
  final void Function()? callback;
  const InfoCard({
    super.key,
    required this.width,
    required this.title,
    required this.summary,
    this.image = const Image(image: AssetImage("assets/images/Logo.webp")),
    this.callback,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 100,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.callback,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: widget.image,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.fade,
                          ),
                          softWrap: false,
                        ),
                        Text(
                          widget.summary,
                          style: TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.fade,
                            color: GlobalConfig.theme.onSecondaryContainer,
                          ),
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
