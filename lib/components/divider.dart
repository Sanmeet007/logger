import 'package:flutter/material.dart';

class LogDivider extends StatelessWidget {
  const LogDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(121, 16, 16, 16)
          : const Color.fromARGB(201, 233, 216, 255),
      height: 1.0,
    );
  }
}
