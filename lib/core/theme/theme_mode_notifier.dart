import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/models/db.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

/// Persists and exposes the user's theme mode preference.
class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => _fromSettings(ref.watch(settingsProvider));

  /// Maps stored theme string to [ThemeMode].
  ThemeMode _fromSettings(Settings settings) {
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
    final settings = ref.read(settingsProvider);
    settings.theme = themeMode;
    await ref.read(settingsRepositoryProvider).save(settings);
    state = _fromSettings(settings);
  }

  /// Persists the AMOLED (pure black) theme toggle.
  Future<void> saveOledTheme(bool isOled) async {
    final settings = ref.read(settingsProvider);
    settings.amoledTheme = isOled;
    await ref.read(settingsRepositoryProvider).save(settings);
  }

  /// Persists the Material You dynamic color toggle.
  Future<void> saveMaterialTheme(bool isMaterial) async {
    final settings = ref.read(settingsProvider);
    settings.materialColor = isMaterial;
    await ref.read(settingsRepositoryProvider).save(settings);
  }
}
