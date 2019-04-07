import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoCover extends StatelessWidget {
  final String path;
  final Object heroTag;
  final double width;
  final double height;

  const VideoCover(
      {Key key, @required this.path, this.width, this.height, this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        path.startsWith("http") ? path : "http://v.popeye.vip$path";
    Widget coverWidget = Container(
        child: Card(
      margin: EdgeInsets.all(0),
      elevation: 5,
      child: LimitedBox(
        maxWidth: 135,
        child: CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            errorWidget: (ctx, str, obj) =>
                Image.asset("assets/images/404@2x.png")),
      ),
    ));

    if (heroTag == null) {
      return coverWidget;
    }
    return Hero(child: coverWidget, tag: heroTag);
  }
}
