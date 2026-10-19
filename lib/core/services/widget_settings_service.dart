import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/settings_persistence.dart';
import 'package:rain/domain/entities/app_settings.dart';

/// Persists home-widget appearance settings and refreshes widget data.
class WidgetSettingsService {
  WidgetSettingsService(this._ref);

  final Ref _ref;

  /// Pushes the latest cache and [settings] to all home-screen widgets.
  Future<bool> refreshWidgets({AppSettings? settings}) => _ref
      .read(homeWidgetServiceProvider)
      .updateFromIsar(
        _ref.read(isarProvider),
        settings: settings ?? _ref.read(settingsProvider),
      );

  /// Persists settings via [update], then pushes updates to home widgets.
  Future<bool> _saveAndRefresh(
    AppSettings Function(AppSettings settings) update,
  ) async {
    await persistSettings(_ref, update);
    return refreshWidgets(settings: _ref.read(settingsProvider));
  }

  /// Saves a custom widget background color for [lightTheme] or dark theme.
  Future<bool> updateBackgroundColor({
    required bool lightTheme,
    required String color,
  }) => _saveAndRefresh(
    (settings) => lightTheme
        ? settings.copyWith(widgetBackgroundColorLight: color)
        : settings.copyWith(widgetBackgroundColorDark: color),
  );

  /// Saves a custom widget text color for [lightTheme] or dark theme.
  Future<bool> updateTextColor({
    required bool lightTheme,
    required String color,
  }) => _saveAndRefresh(
    (settings) => lightTheme
        ? settings.copyWith(widgetTextColorLight: color)
        : settings.copyWith(widgetTextColorDark: color),
  );

  /// Clears a custom widget background color (Material You default).
  Future<bool> resetBackgroundColor({required bool lightTheme}) =>
      _saveAndRefresh(
        (settings) => lightTheme
            ? settings.copyWith(widgetBackgroundColorLight: null)
            : settings.copyWith(widgetBackgroundColorDark: null),
      );

  /// Clears a custom widget text color (Material You default).
  Future<bool> resetTextColor({required bool lightTheme}) => _saveAndRefresh(
    (settings) => lightTheme
        ? settings.copyWith(widgetTextColorLight: null)
        : settings.copyWith(widgetTextColorDark: null),
  );

  /// Clears every custom widget color and refreshes home-screen widgets.
  Future<bool> resetAllWidgetColors() => _saveAndRefresh(
    (settings) => settings.copyWith(
      widgetBackgroundColorLight: null,
      widgetBackgroundColorDark: null,
      widgetTextColorLight: null,
      widgetTextColorDark: null,
      widgetBackgroundColor: null,
      widgetTextColor: null,
    ),
  );
}
