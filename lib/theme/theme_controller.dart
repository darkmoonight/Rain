import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/main.dart';

class ThemeController extends GetxController {
  ThemeMode get theme => _getThemeMode();

  void saveOledTheme(bool isOled) {
    _updateSetting((settings) => settings.amoledTheme = isOled);
  }

  void saveMaterialTheme(bool isMaterial) {
    _updateSetting((settings) => settings.materialColor = isMaterial);
  }

  void saveTheme(String themeMode) {
    _updateSetting((settings) => settings.theme = themeMode);
  }

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  ThemeMode _getThemeMode() {
    switch (settings.theme) {
      case 'system':
        return ThemeMode.system;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }

  void _updateSetting(void Function(Settings) update) {
    update(settings);
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }
}
