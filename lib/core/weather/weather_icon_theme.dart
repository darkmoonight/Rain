import 'package:flutter/widgets.dart';
import 'package:rain/core/config/settings_catalog.dart';

/// Built-in weather icon pack choices (condition, metric, and sun-time PNG sets).
///
/// To add a theme: place PNGs under `assets/weather_icons/<id>/`, register the
/// id in [_catalog], add `weatherIcon<Id>` to i18n, and list assets in pubspec.
class WeatherIconTheme {
  WeatherIconTheme._();

  static const String classic = 'classic';

  /// Default theme id (current Rain look).
  static const String defaultId = classic;

  /// Preview icon filename shown in the theme picker.
  static const String previewFile = 'sun.png';

  static const String _assetRoot = 'assets/weather_icons/';
  static const String _labelPrefix = 'weatherIcon';

  static const List<String> _catalog = [classic];

  /// Persisted theme ids shown in settings.
  static List<String> get choices => _catalog;

  /// Normalizes unknown stored values to [defaultId].
  static String resolve(String? id) =>
      SettingsCatalog.resolve(id, choices, defaultId);

  /// Directory prefix for bundled PNGs in theme [themeId].
  static String assetRoot(String? themeId) => '$_assetRoot${resolve(themeId)}/';

  /// Full asset path for [fileName] in theme [themeId].
  static String asset(String fileName, {String? themeId}) =>
      '${assetRoot(themeId)}$fileName';

  /// Localized label for settings UI.
  static String label(String id) =>
      SettingsCatalog.label(id, choices, defaultId, _labelPrefix);

  /// Preview asset path for the settings theme picker.
  static String previewAsset(String id) => asset(previewFile, themeId: id);

  /// Thumbnail widget for [id] in selection dialogs.
  static Widget previewLeading(String id, {double size = 32}) => Image.asset(
    previewAsset(id),
    width: size,
    height: size,
  );
}
