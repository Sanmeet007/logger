import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.black38
          : Colors.white38,
      child: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(255, 203, 169, 255)
              : const Color.fromARGB(255, 106, 26, 227),
        ),
      ),
    );
  }
}
