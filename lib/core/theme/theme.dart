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
) => _buildTheme(
  baseTheme: baseLight,
  brightness: Brightness.light,
  color: color,
  colorScheme: colorScheme,
  edgeToEdgeAvailable: edgeToEdgeAvailable,
);

ThemeData darkTheme(
  Color? color,
  ColorScheme? colorScheme,
  bool edgeToEdgeAvailable,
) => _buildTheme(
  baseTheme: baseDark,
  brightness: Brightness.dark,
  color: color,
  colorScheme: colorScheme,
  edgeToEdgeAvailable: edgeToEdgeAvailable,
);

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
      harmonizedColorScheme,
      edgeToEdgeAvailable,
      brightness,
    ),
    primaryColor: color,
    canvasColor: color,
    scaffoldBackgroundColor: color,
    chipTheme: _buildChipTheme(color, harmonizedColorScheme),
    cardTheme: _buildCardTheme(color, harmonizedColorScheme),
    bottomSheetTheme: _buildBottomSheetTheme(color, harmonizedColorScheme),
    navigationRailTheme: baseTheme.navigationRailTheme.copyWith(
      backgroundColor: color,
    ),
    navigationBarTheme: _buildNavigationBarTheme(color, harmonizedColorScheme),
    inputDecorationTheme: _buildInputDecorationTheme(baseTheme),
  );
}

AppBarTheme _buildAppBarTheme(
  Color? color,
  ColorScheme? colorScheme,
  bool edgeToEdgeAvailable,
  Brightness brightness,
) => AppBarTheme(
  backgroundColor: color,
  foregroundColor: colorScheme?.onSurface,
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

ChipThemeData _buildChipTheme(Color? color, ColorScheme? colorScheme) =>
    ChipThemeData(
      side: BorderSide.none,
      backgroundColor: Colors.transparent,
      surfaceTintColor: color == oledColor
          ? Colors.transparent
          : colorScheme?.surfaceTint,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      shadowColor: Colors.transparent,
    );

CardThemeData _buildCardTheme(Color? color, ColorScheme? colorScheme) =>
    CardThemeData(
      color: color,
      surfaceTintColor: color == oledColor
          ? Colors.transparent
          : colorScheme?.surfaceTint,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.transparent,
    );

BottomSheetThemeData _buildBottomSheetTheme(
  Color? color,
  ColorScheme? colorScheme,
) => BottomSheetThemeData(
  backgroundColor: color,
  surfaceTintColor: color == oledColor
      ? Colors.transparent
      : colorScheme?.surfaceTint,
);

NavigationBarThemeData _buildNavigationBarTheme(
  Color? color,
  ColorScheme? colorScheme,
) => NavigationBarThemeData(
  backgroundColor: color,
  surfaceTintColor: color == oledColor
      ? Colors.transparent
      : colorScheme?.surfaceTint,
  labelTextStyle: WidgetStateProperty.all(
    const TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12),
  ),
);

InputDecorationTheme _buildInputDecorationTheme(ThemeData baseTheme) =>
    InputDecorationTheme(
      labelStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) => const TextStyle(fontSize: 14),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: baseTheme.disabledColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: baseTheme.disabledColor),
      ),
    );
