import 'package:farmicon/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appElevatedButtonTheme {
  appElevatedButtonTheme._();

  static final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: appColors.primaryColor,
    textStyle: GoogleFonts.poppins(
        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ));
}
