import 'package:farmicon/Utils/Theme/elevated_button_theme.dart';
import 'package:flutter/material.dart';

class appTheme {
  appTheme._();

  static ThemeData appThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    elevatedButtonTheme: appElevatedButtonTheme.elevatedButtonTheme,
  );
}
