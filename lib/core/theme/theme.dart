import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:rain/core/theme/app_font.dart';

final ThemeData baseLight = ThemeData.light(useMaterial3: true);
final ThemeData baseDark = ThemeData.dark(useMaterial3: true);

// Colors

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

// Theme builders

/// Builds the light app theme with optional accent and dynamic color scheme.
ThemeData lightTheme(
  Color? color,
  ColorScheme? colorScheme,
  bool edgeToEdgeAvailable, {
  String appFont = AppFont.defaultId,
}) => _buildTheme(
  baseTheme: baseLight,
  brightness: Brightness.light,
  color: color,
  colorScheme: colorScheme,
  edgeToEdgeAvailable: edgeToEdgeAvailable,
  appFont: appFont,
);

/// Builds the dark app theme with optional accent and dynamic color scheme.
ThemeData darkTheme(
  Color? color,
  ColorScheme? colorScheme,
  bool edgeToEdgeAvailable, {
  String appFont = AppFont.defaultId,
}) => _buildTheme(
  baseTheme: baseDark,
  brightness: Brightness.dark,
  color: color,
  colorScheme: colorScheme,
  edgeToEdgeAvailable: edgeToEdgeAvailable,
  appFont: appFont,
);

/// Assembles a full [ThemeData] from base tokens and optional accent colors.
ThemeData _buildTheme({
  required ThemeData baseTheme,
  required Brightness brightness,
  required Color? color,
  required ColorScheme? colorScheme,
  required bool edgeToEdgeAvailable,
  required String appFont,
}) {
  final harmonizedColorScheme = colorScheme
      ?.copyWith(brightness: brightness, surface: baseTheme.colorScheme.surface)
      .harmonized();

  return baseTheme.copyWith(
    brightness: brightness,
    colorScheme: harmonizedColorScheme,
    textTheme: AppFont.textTheme(appFont, baseTheme.textTheme),
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

// Component themes

/// Builds app bar styling including edge-to-edge system overlay colors.
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

/// Builds chip styling with OLED-aware surface tint handling.
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

/// Builds card styling with OLED-aware surface tint handling.
CardThemeData _buildCardTheme(Color? color, ColorScheme? colorScheme) =>
    CardThemeData(
      color: color,
      surfaceTintColor: color == oledColor
          ? Colors.transparent
          : colorScheme?.surfaceTint,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: Colors.transparent,
    );

/// Builds bottom sheet background and tint colors.
BottomSheetThemeData _buildBottomSheetTheme(
  Color? color,
  ColorScheme? colorScheme,
) => BottomSheetThemeData(
  backgroundColor: color,
  surfaceTintColor: color == oledColor
      ? Colors.transparent
      : colorScheme?.surfaceTint,
);

/// Builds navigation bar background and label text styling.
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

/// Builds rounded outline borders for text fields.
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

/// Light and dark themes for the current appearance and font settings.
typedef AppThemes = ({ThemeData light, ThemeData dark});

/// Picks surface colors and schemes from Material You toggles and dynamic color.
AppThemes resolveAppThemes({
  required bool materialColor,
  required bool amoledTheme,
  required ColorScheme? lightDynamic,
  required ColorScheme? darkDynamic,
  required bool edgeToEdgeAvailable,
  required String appFont,
}) {
  final font = AppFont.resolve(appFont);

  ThemeData buildLight(Color? color, ColorScheme? scheme) =>
      lightTheme(color, scheme, edgeToEdgeAvailable, appFont: font);

  ThemeData buildDark(Color? color, ColorScheme? scheme) =>
      darkTheme(color, scheme, edgeToEdgeAvailable, appFont: font);

  final light = materialColor && lightDynamic != null
      ? buildLight(lightDynamic.surface, lightDynamic)
      : buildLight(lightColor, colorSchemeLight);

  final dark = amoledTheme
      ? (materialColor && darkDynamic != null
            ? buildDark(oledColor, darkDynamic)
            : buildDark(oledColor, colorSchemeDark))
      : materialColor && darkDynamic != null
      ? buildDark(darkDynamic.surface, darkDynamic)
      : buildDark(darkColor, colorSchemeDark);

  return (light: light, dark: dark);
}
