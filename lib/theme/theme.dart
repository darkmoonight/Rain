import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData baseLigth = ThemeData.light(useMaterial3: true);
final ThemeData baseDark = ThemeData.dark(useMaterial3: true);

const Color lightColor = Colors.white;
const Color darkColor = Color.fromRGBO(30, 30, 30, 1);
const Color oledColor = Colors.black;

class RainTheme {
  static ThemeData get lightTheme {
    return baseLigth.copyWith(
      brightness: Brightness.light,
      textTheme: GoogleFonts.ubuntuTextTheme(baseLigth.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColor,
        foregroundColor: baseLigth.colorScheme.onSurface,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      primaryColor: lightColor,
      canvasColor: lightColor,
      scaffoldBackgroundColor: lightColor,
      drawerTheme: baseLigth.drawerTheme.copyWith(
        backgroundColor: lightColor,
      ),
      cardTheme: baseLigth.cardTheme.copyWith(
        elevation: 2,
        color: lightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomSheetTheme: baseLigth.bottomSheetTheme.copyWith(
        backgroundColor: lightColor,
        elevation: 0,
      ),
      colorScheme: baseLigth.colorScheme.copyWith(
        brightness: Brightness.dark,
        background: lightColor,
        surface: baseLigth.colorScheme.background,
      ),
      navigationRailTheme: baseLigth.navigationRailTheme.copyWith(
        backgroundColor: lightColor,
      ),
      navigationBarTheme: baseLigth.navigationBarTheme.copyWith(
        backgroundColor: lightColor,
      ),
      inputDecorationTheme: baseLigth.inputDecorationTheme.copyWith(
        labelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            return const TextStyle(fontSize: 14);
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: baseLigth.disabledColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: baseLigth.disabledColor,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      textTheme: GoogleFonts.ubuntuTextTheme(baseDark.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: darkColor,
        foregroundColor: baseDark.colorScheme.onSurface,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      primaryColor: darkColor,
      canvasColor: darkColor,
      scaffoldBackgroundColor: darkColor,
      drawerTheme: baseDark.drawerTheme.copyWith(
        backgroundColor: darkColor,
      ),
      cardTheme: baseDark.cardTheme.copyWith(
        elevation: 2,
        color: darkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomSheetTheme: baseDark.bottomSheetTheme.copyWith(
        backgroundColor: darkColor,
        elevation: 0,
      ),
      colorScheme: baseDark.colorScheme.copyWith(
        brightness: Brightness.dark,
        background: darkColor,
        surface: baseDark.colorScheme.background,
      ),
      navigationRailTheme: baseDark.navigationRailTheme.copyWith(
        backgroundColor: darkColor,
      ),
      navigationBarTheme: baseDark.navigationBarTheme.copyWith(
        backgroundColor: darkColor,
      ),
      inputDecorationTheme: baseDark.inputDecorationTheme.copyWith(
        labelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            return const TextStyle(fontSize: 14);
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: baseDark.disabledColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: baseDark.disabledColor,
          ),
        ),
      ),
    );
  }

  static ThemeData get oledTheme {
    return baseDark.copyWith(
      brightness: Brightness.dark,
      textTheme: GoogleFonts.ubuntuTextTheme(baseDark.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: oledColor,
        foregroundColor: baseDark.colorScheme.onSurface,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      primaryColor: oledColor,
      canvasColor: oledColor,
      scaffoldBackgroundColor: oledColor,
      drawerTheme: baseDark.drawerTheme.copyWith(
        backgroundColor: oledColor,
      ),
      cardTheme: baseDark.cardTheme.copyWith(
        elevation: 2,
        color: oledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomSheetTheme: baseDark.bottomSheetTheme.copyWith(
        backgroundColor: oledColor,
        elevation: 0,
      ),
      colorScheme: baseDark.colorScheme.copyWith(
        brightness: Brightness.dark,
        background: oledColor,
        surface: baseDark.colorScheme.background,
      ),
      navigationRailTheme: baseDark.navigationRailTheme.copyWith(
        backgroundColor: oledColor,
      ),
      navigationBarTheme: baseDark.navigationBarTheme.copyWith(
        backgroundColor: oledColor,
      ),
      inputDecorationTheme: baseDark.inputDecorationTheme.copyWith(
        labelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            return const TextStyle(fontSize: 14);
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: baseDark.disabledColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: baseDark.disabledColor,
          ),
        ),
      ),
    );
  }
}
