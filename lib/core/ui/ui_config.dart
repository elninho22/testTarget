import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xFF0C2D59),
        primaryColorDark: const Color(0xFF689F38),
        primaryColorLight: const Color(0xFFDDEDC7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0C2D59),
        ),
      );
}
