import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData baseLigth = ThemeData.light(useMaterial3: true);
final ThemeData baseDark = ThemeData.dark(useMaterial3: true);

class RainTheme {
  static ThemeData get lightTheme {
    return baseLigth.copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: GoogleFonts.robotoTextTheme(baseLigth.textTheme),
    );
  }

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      textTheme: GoogleFonts.robotoTextTheme(baseDark.textTheme),
    );
  }

  static ThemeData get oledTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      textTheme: GoogleFonts.robotoTextTheme(baseDark.textTheme),
    );
  }
}
