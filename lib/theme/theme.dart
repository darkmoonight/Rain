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
        surface: Colors.white,
        primaryContainer: const Color.fromARGB(255, 245, 245, 245),
        secondaryContainer: const Color.fromARGB(255, 240, 240, 240),
        tertiaryContainer: const Color.fromARGB(255, 250, 250, 250),
      ),
      iconTheme: baseLigth.iconTheme.copyWith(
        color: Colors.black,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 225, 225, 225),
      ),
      bottomNavigationBarTheme: baseLigth.bottomNavigationBarTheme.copyWith(
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      ),
      unselectedWidgetColor: Colors.grey[350],
      dividerColor: Colors.black,
    );
  }

  static ThemeData get oledTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
        surface: Colors.black,
        primaryContainer: const Color.fromARGB(255, 15, 15, 15),
        secondaryContainer: const Color.fromARGB(255, 10, 10, 10),
        tertiaryContainer: const Color.fromARGB(255, 20, 20, 20),
      ),
      iconTheme: baseLigth.iconTheme.copyWith(
        color: Colors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
      ),
      bottomNavigationBarTheme: baseLigth.bottomNavigationBarTheme.copyWith(
        backgroundColor: const Color.fromARGB(255, 10, 10, 10),
      ),
      unselectedWidgetColor: const Color.fromARGB(255, 20, 20, 20),
      dividerColor: Colors.white,
    );
  }

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
        surface: const Color.fromARGB(255, 30, 30, 30),
        primaryContainer: const Color.fromARGB(255, 40, 40, 40),
        secondaryContainer: const Color.fromARGB(255, 25, 25, 25),
        tertiaryContainer: const Color.fromARGB(255, 45, 45, 45),
      ),
      iconTheme: baseLigth.iconTheme.copyWith(
        color: Colors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color.fromARGB(255, 55, 55, 55),
      ),
      bottomNavigationBarTheme: baseLigth.bottomNavigationBarTheme.copyWith(
        backgroundColor: const Color.fromARGB(255, 28, 28, 28),
      ),
      unselectedWidgetColor: Colors.grey[850],
      dividerColor: Colors.white,
    );
  }
}
