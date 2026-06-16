import 'package:flutter/widgets.dart';
import 'package:rain/i18n/tr.dart';

/// Built-in weather icon pack choices (condition, metric, and sun-time PNG sets).
class WeatherIconTheme {
  WeatherIconTheme._();

  static const String classic = 'classic';

  /// Persisted theme ids shown in settings.
  static const List<String> choices = [classic];

  /// Default theme id (current Rain look).
  static const String defaultId = classic;

  /// Preview icon filename shown in the theme picker.
  static const String previewFile = 'sun.png';

  static const String _root = 'assets/weather_icons/';

  static final Map<String, String> _labelKeys = {
    classic: 'weatherIconClassic',
  };

  /// Normalizes unknown stored values to [defaultId].
  static String resolve(String? id) => choices.contains(id) ? id! : defaultId;

  /// Directory prefix for bundled PNGs in theme [themeId].
  static String assetRoot(String? themeId) => '$_root${resolve(themeId)}/';

  /// Full asset path for [fileName] in theme [themeId].
  static String asset(String fileName, {String? themeId}) =>
      '${assetRoot(themeId)}$fileName';

  /// Localized label for settings UI.
  static String label(String id) => _labelKeys[resolve(id)]!.tr;

  /// Preview asset path for the settings theme picker.
  static String previewAsset(String id) => asset(previewFile, themeId: id);

  /// Thumbnail widget for [id] in selection dialogs.
  static Widget previewLeading(String id, {double size = 32}) => Image.asset(
    previewAsset(id),
    width: size,
    height: size,
  );
}
