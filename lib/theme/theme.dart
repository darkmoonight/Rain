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
        secondaryContainer: const Color.fromARGB(255, 240, 240, 240),
      ),
      iconTheme: baseLigth.iconTheme.copyWith(
        color: Colors.black,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 225, 225, 225),
      ),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: baseLigth.bottomNavigationBarTheme.copyWith(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      ),
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
        secondaryContainer: const Color.fromARGB(255, 25, 25, 25),
      ),
      iconTheme: baseLigth.iconTheme.copyWith(
        color: Colors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(255, 55, 55, 55)),
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
      bottomNavigationBarTheme: baseLigth.bottomNavigationBarTheme
          .copyWith(backgroundColor: const Color.fromARGB(255, 28, 28, 28)),
      unselectedWidgetColor: Colors.grey[850],
      dividerColor: Colors.white,
      primaryColor: const Color.fromARGB(255, 40, 40, 40),
    );
  }
}
