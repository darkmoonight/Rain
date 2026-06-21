import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/theme/app_font.dart';
import 'package:rain/core/theme/color_palette.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:rain/data/models/db.dart';

/// Catalog-driven appearance picker saved via [SettingsSaveActions].
class SettingAppearancePickerDefinition {
  const SettingAppearancePickerDefinition({
    required this.titleKey,
    required this.icon,
    required this.items,
    required this.read,
    required this.write,
    required this.itemBuilder,
    this.leadingBuilder,
    this.enableSearch = false,
    this.refreshWidgets = false,
    this.syncNotificationContent = false,
  });

  final String titleKey;
  final IconData icon;
  final List<String> items;
  final String Function(Settings settings) read;
  final void Function(Settings settings, String value) write;
  final String Function(String value) itemBuilder;
  final Widget? Function(String value)? leadingBuilder;
  final bool enableSearch;
  final bool refreshWidgets;
  final bool syncNotificationContent;
}

/// String-enum appearance pickers on the settings appearance section.
final settingAppearanceCatalogPickers = [
  SettingAppearancePickerDefinition(
    titleKey: 'colorPalette',
    icon: IconsaxPlusLinear.color_swatch,
    items: AppColorPalette.choices,
    read: _readColorPalette,
    write: _writeColorPalette,
    itemBuilder: AppColorPalette.label,
    leadingBuilder: AppColorPalette.previewLeading,
    enableSearch: true,
  ),
  SettingAppearancePickerDefinition(
    titleKey: 'appFont',
    icon: IconsaxPlusLinear.text,
    items: AppFont.choices,
    read: _readAppFont,
    write: _writeAppFont,
    itemBuilder: AppFont.label,
  ),
  SettingAppearancePickerDefinition(
    titleKey: 'weatherIconTheme',
    icon: IconsaxPlusLinear.cloud_sunny,
    items: WeatherIconTheme.choices,
    read: _readWeatherIconTheme,
    write: _writeWeatherIconTheme,
    itemBuilder: WeatherIconTheme.label,
    leadingBuilder: WeatherIconTheme.previewLeading,
    refreshWidgets: true,
    syncNotificationContent: true,
  ),
];

String _readColorPalette(Settings s) => AppColorPalette.resolve(s.colorPalette);
void _writeColorPalette(Settings s, String v) => s.colorPalette = v;

String _readAppFont(Settings s) => AppFont.resolve(s.appFont);
void _writeAppFont(Settings s, String v) => s.appFont = v;

String _readWeatherIconTheme(Settings s) =>
    WeatherIconTheme.resolve(s.weatherIconTheme);
void _writeWeatherIconTheme(Settings s, String v) => s.weatherIconTheme = v;
