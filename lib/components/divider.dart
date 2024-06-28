import 'package:flutter/material.dart';

class LogDivider extends StatelessWidget {
  const LogDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(255, 30, 30, 30)
          : const Color.fromARGB(255, 230, 213, 255),
      height: 1.0,
    );
  }
}
