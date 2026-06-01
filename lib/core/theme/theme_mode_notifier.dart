import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/data/models/db.dart';

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => _fromSettings(ref.watch(settingsProvider));

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

  Future<void> saveTheme(String themeMode) => setTheme(themeMode);

  Future<void> changeThemeMode(String themeMode) => setTheme(themeMode);

  Future<void> setTheme(String themeMode) async {
    final settings = ref.read(settingsProvider);
    settings.theme = themeMode;
    await ref.read(settingsRepositoryProvider).save(settings);
    state = _fromSettings(settings);
  }

  Future<void> saveOledTheme(bool isOled) async {
    final settings = ref.read(settingsProvider);
    settings.amoledTheme = isOled;
    await ref.read(settingsRepositoryProvider).save(settings);
  }

  Future<void> saveMaterialTheme(bool isMaterial) async {
    final settings = ref.read(settingsProvider);
    settings.materialColor = isMaterial;
    await ref.read(settingsRepositoryProvider).save(settings);
  }
}
