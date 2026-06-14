import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/models/db.dart';

/// Persists home-widget appearance settings and refreshes widget data.
class WidgetSettingsService {
  WidgetSettingsService(this._ref);

  final Ref _ref;

  /// Pushes the latest cache and [settings] to all home-screen widgets.
  Future<bool> refreshWidgets({Settings? settings}) => _ref
      .read(homeWidgetServiceProvider)
      .updateFromIsar(
        _ref.read(isarProvider),
        settings: settings ?? _ref.read(settingsProvider),
      );

  /// Persists settings via [save], then pushes updates to home widgets.
  Future<bool> _saveAndRefresh(Future<Settings> Function() save) async {
    final settings = await save();
    return refreshWidgets(settings: settings);
  }

  /// Saves a custom widget background color for [lightTheme] or dark theme.
  Future<bool> updateBackgroundColor({
    required bool lightTheme,
    required String color,
  }) => _updateColor((settings) {
    if (lightTheme) {
      settings.widgetBackgroundColorLight = color;
    } else {
      settings.widgetBackgroundColorDark = color;
    }
  });

  /// Saves a custom widget text color for [lightTheme] or dark theme.
  Future<bool> updateTextColor({
    required bool lightTheme,
    required String color,
  }) => _updateColor((settings) {
    if (lightTheme) {
      settings.widgetTextColorLight = color;
    } else {
      settings.widgetTextColorDark = color;
    }
  });

  /// Clears a custom widget background color (Material You default).
  Future<bool> resetBackgroundColor({required bool lightTheme}) =>
      _updateColor((settings) {
        if (lightTheme) {
          settings.widgetBackgroundColorLight = null;
        } else {
          settings.widgetBackgroundColorDark = null;
        }
      });

  /// Clears a custom widget text color (Material You default).
  Future<bool> resetTextColor({required bool lightTheme}) =>
      _updateColor((settings) {
        if (lightTheme) {
          settings.widgetTextColorLight = null;
        } else {
          settings.widgetTextColorDark = null;
        }
      });

  /// Clears every custom widget color and refreshes home-screen widgets.
  Future<bool> resetAllWidgetColors() => _saveAndRefresh(() async {
    final settings = _ref.read(settingsProvider);
    settings
      ..widgetBackgroundColorLight = null
      ..widgetBackgroundColorDark = null
      ..widgetTextColorLight = null
      ..widgetTextColorDark = null
      ..widgetBackgroundColor = null
      ..widgetTextColor = null;
    await _ref.read(settingsRepositoryProvider).save(settings);
    return settings;
  });

  Future<bool> _updateColor(void Function(Settings settings) apply) =>
      _saveAndRefresh(() async {
        final settings = _ref.read(settingsProvider);
        apply(settings);
        await _ref.read(settingsRepositoryProvider).save(settings);
        return settings;
      });
}
