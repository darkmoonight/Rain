import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dynamic_color/dynamic_color.dart';

final ThemeData baseLight = ThemeData.light(useMaterial3: true);
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
  Color? color,
  ColorScheme? colorScheme,
  bool edgeToEdgeAvailable,
) {
  return _buildTheme(
    baseTheme: baseLight,
    brightness: Brightness.light,
    color: color,
    colorScheme: colorScheme,
    edgeToEdgeAvailable: edgeToEdgeAvailable,
  );
}

ThemeData darkTheme(
  Color? color,
  ColorScheme? colorScheme,
  bool edgeToEdgeAvailable,
) {
  return _buildTheme(
    baseTheme: baseDark,
    brightness: Brightness.dark,
    color: color,
    colorScheme: colorScheme,
    edgeToEdgeAvailable: edgeToEdgeAvailable,
  );
}

ThemeData _buildTheme({
  required ThemeData baseTheme,
  required Brightness brightness,
  required Color? color,
  required ColorScheme? colorScheme,
  required bool edgeToEdgeAvailable,
}) {
  final harmonizedColorScheme = colorScheme
      ?.copyWith(brightness: brightness, surface: baseTheme.colorScheme.surface)
      .harmonized();

  return baseTheme.copyWith(
    brightness: brightness,
    colorScheme: harmonizedColorScheme,
    textTheme: GoogleFonts.ubuntuTextTheme(baseTheme.textTheme),
    appBarTheme: _buildAppBarTheme(
      color,
      baseTheme.colorScheme.onSurface,
      edgeToEdgeAvailable,
      brightness,
      harmonizedColorScheme,
    ),
    primaryColor: color,
    canvasColor: color,
    scaffoldBackgroundColor: color,
    cardTheme: _buildCardTheme(color, harmonizedColorScheme),
    bottomSheetTheme: _buildBottomSheetTheme(color, harmonizedColorScheme),
    navigationRailTheme: baseTheme.navigationRailTheme.copyWith(
      backgroundColor: color,
    ),
    navigationBarTheme: _buildNavigationBarTheme(color, harmonizedColorScheme),
    inputDecorationTheme: _buildInputDecorationTheme(),
  );
}

AppBarTheme _buildAppBarTheme(
  Color? color,
  Color? onSurfaceColor,
  bool edgeToEdgeAvailable,
  Brightness brightness,
  ColorScheme? colorScheme,
) {
  return AppBarTheme(
    backgroundColor: color,
    foregroundColor: onSurfaceColor,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      systemNavigationBarColor: edgeToEdgeAvailable
          ? Colors.transparent
          : colorScheme?.surface,
    ),
  );
}

CardThemeData _buildCardTheme(Color? color, ColorScheme? colorScheme) {
  return CardThemeData(
    color: color,
    surfaceTintColor: color == oledColor
        ? Colors.transparent
        : colorScheme?.surfaceTint,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    shadowColor: Colors.transparent,
  );
}

BottomSheetThemeData _buildBottomSheetTheme(
  Color? color,
  ColorScheme? colorScheme,
) {
  return BottomSheetThemeData(
    backgroundColor: color,
    surfaceTintColor: color == oledColor
        ? Colors.transparent
        : colorScheme?.surfaceTint,
  );
}

NavigationBarThemeData _buildNavigationBarTheme(
  Color? color,
  ColorScheme? colorScheme,
) {
  return NavigationBarThemeData(
    backgroundColor: color,
    surfaceTintColor: color == oledColor
        ? Colors.transparent
        : colorScheme?.surfaceTint,
  );
}

InputDecorationTheme _buildInputDecorationTheme() {
  return InputDecorationTheme(
    labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      return const TextStyle(fontSize: 14);
    }),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
  );
}
