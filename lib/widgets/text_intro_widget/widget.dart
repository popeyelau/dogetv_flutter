import 'package:flutter/material.dart';

class TextIntro extends StatelessWidget {
  final String label;
  final String text;
  final int maxLines;

  const TextIntro(
      {Key key, @required this.label, @required this.text, this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: "$label: ",
          style: TextStyle(fontWeight: FontWeight.w500),
          children: [
            TextSpan(
                text: text, style: TextStyle(fontWeight: FontWeight.normal))
          ]),
      maxLines: maxLines,
    );
  }
}
