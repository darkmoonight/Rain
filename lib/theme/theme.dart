import 'package:flutter/material.dart';

final ThemeData baseLigth = ThemeData.light();
final ThemeData baseDark = ThemeData.dark();

class RainTheme {
  static ThemeData get lightTheme {
    return baseLigth.copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.light,
        primaryContainer: const Color.fromARGB(255, 245, 245, 245),
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 240, 240, 240)),
      unselectedWidgetColor: Colors.grey[350],
      dividerColor: Colors.black,
      primaryColor: const Color.fromARGB(255, 245, 245, 245),
    );
  }

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
        primaryContainer: const Color.fromARGB(255, 40, 40, 40),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 28, 28, 28)),
      unselectedWidgetColor: Colors.grey[850],
      dividerColor: Colors.white,
      primaryColor: const Color.fromARGB(255, 40, 40, 40),
    );
  }
}
