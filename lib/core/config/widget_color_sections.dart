import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/config/widget_theme_colors.dart';
import 'package:rain/core/services/widget_settings_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';

/// Static layout for a light or dark widget color block on the settings screen.
class WidgetColorSectionDefinition {
  const WidgetColorSectionDefinition({
    required this.sectionTitleKey,
    required this.sectionIcon,
    required this.backgroundTitleKey,
    required this.textTitleKey,
    required this.previewBackground,
    required this.previewText,
    required this.isLightTheme,
  });

  final String sectionTitleKey;
  final IconData sectionIcon;
  final String backgroundTitleKey;
  final String textTitleKey;
  final Color previewBackground;
  final Color previewText;
  final bool isLightTheme;

  /// Light Android theme widget colors.
  static const light = WidgetColorSectionDefinition(
    sectionTitleKey: 'light',
    sectionIcon: IconsaxPlusBold.sun_1,
    backgroundTitleKey: 'widgetBackgroundLight',
    textTitleKey: 'widgetTextLight',
    previewBackground: WidgetThemePreviewColors.lightBackground,
    previewText: WidgetThemePreviewColors.lightText,
    isLightTheme: true,
  );

  /// Dark Android theme widget colors.
  static const dark = WidgetColorSectionDefinition(
    sectionTitleKey: 'dark',
    sectionIcon: IconsaxPlusBold.moon,
    backgroundTitleKey: 'widgetBackgroundDark',
    textTitleKey: 'widgetTextDark',
    previewBackground: WidgetThemePreviewColors.darkBackground,
    previewText: WidgetThemePreviewColors.darkText,
    isLightTheme: false,
  );

  /// Ordered sections shown on the widget settings screen.
  static const sections = [light, dark];
}

/// Resolves stored hex values and service callbacks for [WidgetColorSectionDefinition].
extension WidgetColorSectionDefinitionX on WidgetColorSectionDefinition {
  String backgroundHex(AppSettingsState settings) => isLightTheme
      ? settings.widgetBackgroundColorLight
      : settings.widgetBackgroundColorDark;

  String textHex(AppSettingsState settings) => isLightTheme
      ? settings.widgetTextColorLight
      : settings.widgetTextColorDark;

  Future<bool> Function(String) saveBackground(WidgetSettingsService service) =>
      (color) =>
          service.updateBackgroundColor(lightTheme: isLightTheme, color: color);

  Future<bool> Function(String) saveText(WidgetSettingsService service) =>
      (color) =>
          service.updateTextColor(lightTheme: isLightTheme, color: color);

  Future<bool> Function() resetBackground(WidgetSettingsService service) =>
      () => service.resetBackgroundColor(lightTheme: isLightTheme);

  Future<bool> Function() resetText(WidgetSettingsService service) =>
      () => service.resetTextColor(lightTheme: isLightTheme);
}
