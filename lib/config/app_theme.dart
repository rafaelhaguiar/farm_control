import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 58, 50, 50),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(const Color.fromARGB(255, 58, 50, 50)),
    )),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color.fromARGB(255, 58, 50, 50)),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color.fromARGB(255, 58, 50, 50)),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      focusColor: Color.fromARGB(255, 58, 50, 50),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(255, 58, 50, 50),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
  );
}
