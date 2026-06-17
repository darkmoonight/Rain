import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';

/// Exposes derived app settings for widgets and services.
final appSettingsProvider =
    NotifierProvider<AppSettingsNotifier, AppSettingsState>(
      AppSettingsNotifier.new,
    );

/// Watches the active UI locale from [appSettingsProvider].
final localeProvider = Provider<Locale>(
  (ref) => ref.watch(appSettingsProvider).locale,
);

/// Builds [AppSettingsState] from persisted settings and applies live updates.
class AppSettingsNotifier extends Notifier<AppSettingsState> {
  /// Rebuilds derived settings whenever persisted [Settings] change.
  @override
  AppSettingsState build() {
    ref.watch(settingsRevisionProvider);
    return AppSettingsState.fromSettings(ref.watch(settingsProvider));
  }

  /// Updates in-memory settings and syncs locale changes to slang.
  void update({
    bool? amoledTheme,
    bool? materialColor,
    bool? roundDegree,
    bool? largeElement,
    Locale? locale,
    int? timeRange,
    String? timeStart,
    String? timeEnd,
    String? widgetBackgroundColorLight,
    String? widgetBackgroundColorDark,
    String? widgetTextColorLight,
    String? widgetTextColorDark,
  }) {
    state = state.copyWith(
      amoledTheme: amoledTheme,
      materialColor: materialColor,
      roundDegree: roundDegree,
      largeElement: largeElement,
      locale: locale,
      timeRange: timeRange,
      timeStart: timeStart,
      timeEnd: timeEnd,
      widgetBackgroundColorLight: widgetBackgroundColorLight,
      widgetBackgroundColorDark: widgetBackgroundColorDark,
      widgetTextColorLight: widgetTextColorLight,
      widgetTextColorDark: widgetTextColorDark,
    );
    if (locale != null) {
      LocaleSettings.setLocale(appLocaleFromFlutterLocale(locale));
    }
  }
}
