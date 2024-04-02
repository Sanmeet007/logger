import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      disabledColor: const Color.fromARGB(182, 238, 238, 238),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color.fromARGB(255, 195, 83, 255),
        background: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 81, 0, 255),
        ),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 81, 0, 255),
          iconTheme: IconThemeData(color: Colors.white)));

  static ThemeData darkTheme = ThemeData(
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
        contentTextStyle: TextStyle(color: Colors.grey),
        actionTextColor: Color.fromARGB(255, 228, 215, 255),
      ),
      fontFamily: "SFPro",
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: const Color.fromARGB(255, 113, 47, 255),
      ),
      highlightColor: const Color.fromARGB(255, 16, 56, 19),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.grey[500]),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 174, 136, 255),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color.fromARGB(255, 174, 136, 255),
        shape: RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.accent,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 174, 136, 255),
          iconTheme: IconThemeData(color: Colors.black)));
}
