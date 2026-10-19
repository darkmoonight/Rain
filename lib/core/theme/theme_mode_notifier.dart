import 'dart:async';
import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/settings_persistence.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/domain/entities/app_settings.dart';

/// Provides the persisted theme mode preference as [ThemeMode].
final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

/// User-visible label for a persisted theme preference (`system`, `dark`, `light`).
String themePreferenceLabel(String? themeKey) => (themeKey ?? 'system').tr;

/// Persists and exposes theme mode; also saves AMOLED and Material You toggles.
class ThemeModeNotifier extends Notifier<ThemeMode> {
  /// Initializes theme mode from persisted [AppSettings].
  @override
  ThemeMode build() => _fromSettings(ref.watch(settingsProvider));

  /// Maps stored theme string to [ThemeMode].
  ThemeMode _fromSettings(AppSettings settings) {
    switch (settings.theme) {
      case 'system':
        return ThemeMode.system;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }

  /// Saves [themeMode] to storage and updates the notifier state.
  Future<void> saveTheme(String themeMode) => setTheme(themeMode);

  /// Alias for [setTheme].
  Future<void> changeThemeMode(String themeMode) => setTheme(themeMode);

  /// Persists the selected theme mode string and refreshes state.
  Future<void> setTheme(String themeMode) async {
    await persistSettings(ref, (settings) => settings.copyWith(theme: themeMode));
    state = _fromSettings(ref.read(settingsProvider));
    if (Platform.isAndroid) {
      unawaited(
        ref
            .read(widgetSettingsServiceProvider)
            .refreshWidgets(settings: ref.read(settingsProvider)),
      );
    }
  }

  /// Persists the AMOLED (pure black) theme toggle.
  Future<void> saveOledTheme(bool isOled) async {
    await persistSettings(ref, (settings) => settings.copyWith(amoledTheme: isOled));
  }

  /// Persists the Material You dynamic color toggle.
  Future<void> saveMaterialTheme(bool isMaterial) async {
    await persistSettings(ref, (settings) => settings.copyWith(materialColor: isMaterial));
  }
}
