import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      disabledColor: const Color.fromARGB(182, 238, 238, 238),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.green,
        background: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.green,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
      ));

  static ThemeData darkTheme = ThemeData(
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 36, 36, 36),
        contentTextStyle: TextStyle(color: Colors.grey),
        actionTextColor: Colors.green,
      ),
      fontFamily: "SFPro",
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.green,
      ),
      highlightColor: const Color.fromARGB(255, 16, 56, 19),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(Colors.grey[500]),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: Colors.green,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.green,
        shape: RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.accent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 0, 27, 0),
      ));
}
