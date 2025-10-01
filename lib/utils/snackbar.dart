import 'package:flutter/material.dart';

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String content,
    String? buttonText,
    Function? buttonOnPressed,
    bool useAction = false,
    bool showCloseIcon = true,
  }) {
    if (useAction) {
      if (buttonText == null || buttonOnPressed == null) {
        throw Exception(
            "With useAction param as true buttonText and buttonOnPressed are required");
      }
    }
    final snackbar = SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 4),
      action: useAction
          ? SnackBarAction(
              backgroundColor: const Color.fromARGB(255, 203, 169, 255),
              textColor: const Color.fromARGB(255, 11, 1, 26),
              // backgroundColor: const Color.fromARGB(255, 106, 26, 227),
              // textColor: const Color.fromARGB(255, 255, 255, 255),
              label: buttonText!,
              onPressed: () => buttonOnPressed!(),
            )
          : null,
      showCloseIcon: showCloseIcon,
      closeIconColor: Colors.white,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
