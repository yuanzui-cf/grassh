import 'package:vector_graphics/vector_graphics.dart';

class InfoCardModel {
  final String title;
  final String summary;
  final AssetBytesLoader image;
  final void Function()? callback;

  const InfoCardModel({
    required this.title,
    required this.summary,
    this.image = const AssetBytesLoader("assets/images/gsh-logo.vec"),
    this.callback,
  });
}
