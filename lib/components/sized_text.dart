import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  final String text;
  final double size;

  const SizedText(this.text, {super.key, this.size = 14.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 7,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: size),
    );
  }
}
