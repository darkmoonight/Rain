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
        tertiaryContainer: const Color.fromARGB(255, 250, 250, 250),
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
    );
  }

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
        primaryContainer: const Color.fromARGB(255, 15, 15, 15),
        secondaryContainer: const Color.fromARGB(255, 10, 10, 10),
        tertiaryContainer: const Color.fromARGB(255, 20, 20, 20),
      ),
      iconTheme: baseLigth.iconTheme.copyWith(
        color: Colors.white,
      ),
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color.fromARGB(255, 55, 55, 55)),
      scaffoldBackgroundColor: Colors.black,
      bottomNavigationBarTheme: baseLigth.bottomNavigationBarTheme
          .copyWith(backgroundColor: const Color.fromARGB(255, 10, 10, 10)),
      unselectedWidgetColor: const Color.fromARGB(255, 20, 20, 20),
      dividerColor: Colors.white,
    );
  }
}
