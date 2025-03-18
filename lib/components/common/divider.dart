import 'package:flutter/material.dart';

class LogDivider extends StatelessWidget {
  const LogDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(116, 36, 32, 42)
          : const Color.fromARGB(200, 255, 255, 255),
      height: 1.0,
    );
  }
}
