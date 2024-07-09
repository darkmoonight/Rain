import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dynamic_color/dynamic_color.dart';

final ThemeData baseLigth = ThemeData.light(useMaterial3: true);
final ThemeData baseDark = ThemeData.dark(useMaterial3: true);

const Color lightColor = Colors.white;
const Color darkColor = Color.fromRGBO(30, 30, 30, 1);
const Color oledColor = Colors.black;

ColorScheme colorSchemeLight = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple,
  brightness: Brightness.light,
);
ColorScheme colorSchemeDark = ColorScheme.fromSeed(
  seedColor: Colors.deepPurple,
  brightness: Brightness.dark,
);

ThemeData lightTheme(
    Color? color, ColorScheme? colorScheme, bool edgeToEdgeAvailable) {
  return baseLigth.copyWith(
    brightness: Brightness.light,
    colorScheme: colorScheme
        ?.copyWith(
          brightness: Brightness.light,
          surface: baseLigth.colorScheme.surface,
        )
        .harmonized(),
    textTheme: GoogleFonts.ubuntuTextTheme(baseLigth.textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: color,
      foregroundColor: baseLigth.colorScheme.onSurface,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor:
            edgeToEdgeAvailable ? Colors.transparent : colorScheme?.surface,
      ),
    ),
    primaryColor: color,
    canvasColor: color,
    scaffoldBackgroundColor: color,
    cardTheme: baseLigth.cardTheme.copyWith(
      color: color,
      surfaceTintColor:
          color == oledColor ? Colors.transparent : colorScheme?.surfaceTint,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.transparent,
    ),
    bottomSheetTheme: baseLigth.bottomSheetTheme.copyWith(
      backgroundColor: color,
      surfaceTintColor:
          color == oledColor ? Colors.transparent : colorScheme?.surfaceTint,
    ),
    navigationRailTheme: baseLigth.navigationRailTheme.copyWith(
      backgroundColor: color,
    ),
    navigationBarTheme: baseLigth.navigationBarTheme.copyWith(
      backgroundColor: color,
      surfaceTintColor:
          color == oledColor ? Colors.transparent : colorScheme?.surfaceTint,
    ),
    inputDecorationTheme: baseLigth.inputDecorationTheme.copyWith(
      labelStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) {
          return const TextStyle(fontSize: 14);
        },
      ),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
    ),
    indicatorColor: Colors.black,
  );
}

ThemeData darkTheme(
    Color? color, ColorScheme? colorScheme, bool edgeToEdgeAvailable) {
  return baseDark.copyWith(
    brightness: Brightness.dark,
    colorScheme: colorScheme
        ?.copyWith(
          brightness: Brightness.dark,
          surface: baseDark.colorScheme.surface,
        )
        .harmonized(),
    textTheme: GoogleFonts.ubuntuTextTheme(baseDark.textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: color,
      foregroundColor: baseDark.colorScheme.onSurface,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor:
            edgeToEdgeAvailable ? Colors.transparent : colorScheme?.surface,
      ),
    ),
    primaryColor: color,
    canvasColor: color,
    scaffoldBackgroundColor: color,
    cardTheme: baseDark.cardTheme.copyWith(
      color: color,
      surfaceTintColor:
          color == oledColor ? Colors.transparent : colorScheme?.surfaceTint,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.transparent,
    ),
    bottomSheetTheme: baseDark.bottomSheetTheme.copyWith(
      backgroundColor: color,
      surfaceTintColor:
          color == oledColor ? Colors.transparent : colorScheme?.surfaceTint,
    ),
    navigationRailTheme: baseDark.navigationRailTheme.copyWith(
      backgroundColor: color,
    ),
    navigationBarTheme: baseDark.navigationBarTheme.copyWith(
      backgroundColor: color,
      surfaceTintColor:
          color == oledColor ? Colors.transparent : colorScheme?.surfaceTint,
    ),
    inputDecorationTheme: baseDark.inputDecorationTheme.copyWith(
      labelStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) {
          return const TextStyle(fontSize: 14);
        },
      ),
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
    ),
  );
}
