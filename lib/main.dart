import 'package:flutter/material.dart';
import 'app_interface.dart';
import 'theme.dart';

void main() async {
  runApp(MaterialApp(
    title: "Logger",
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.system,
    theme: ThemeClass.lightTheme,
    darkTheme: ThemeClass.darkTheme,
    home: const Application(),
  ));
}
