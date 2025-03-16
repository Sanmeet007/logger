import 'package:flutter/material.dart';

class LinedText extends StatelessWidget {
  final String text;
  final double fontSize;
  const LinedText({
    required this.text,
    this.fontSize = 16.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
