import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
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
  @override
  AppSettingsState build() {
    ref.watch(settingsRevisionProvider);
    final settings = ref.watch(settingsProvider);
    final appLocale = appLocaleFromLanguageCode(settings.language);
    final locale = appLocale.flutterLocale;
    return AppSettingsState(
      amoledTheme: settings.amoledTheme,
      materialColor: settings.materialColor,
      roundDegree: settings.roundDegree,
      largeElement: settings.largeElement,
      locale: locale,
      timeRange:
          settings.timeRange ?? AppConstants.defaultNotificationIntervalHours,
      timeStart:
          settings.timeStart ?? AppConstants.defaultNotificationTimeStart,
      timeEnd: settings.timeEnd ?? AppConstants.defaultNotificationTimeEnd,
      widgetBackgroundColor: settings.widgetBackgroundColor ?? '',
      widgetTextColor: settings.widgetTextColor ?? '',
    );
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
    String? widgetBackgroundColor,
    String? widgetTextColor,
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
      widgetBackgroundColor: widgetBackgroundColor,
      widgetTextColor: widgetTextColor,
    );
    if (locale != null) {
      LocaleSettings.setLocale(appLocaleFromFlutterLocale(locale));
    }
  }
}
