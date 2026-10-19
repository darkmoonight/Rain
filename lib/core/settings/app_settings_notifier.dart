import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/settings/settings_persistence.dart';
import 'package:rain/domain/entities/app_settings.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';

/// Exposes derived app settings for widgets and services.
///
/// Single source of truth: always derived from persisted [settingsProvider]
/// after [settingsRevisionProvider] bumps. Do not keep a parallel in-memory
/// copy that diverges from storage.
final appSettingsProvider =
    NotifierProvider<AppSettingsNotifier, AppSettingsState>(
      AppSettingsNotifier.new,
    );

/// Watches the active UI locale from [appSettingsProvider].
final localeProvider = Provider<Locale>(
  (ref) => ref.watch(appSettingsProvider).locale,
);

/// Builds [AppSettingsState] from domain settings and applies live updates.
class AppSettingsNotifier extends Notifier<AppSettingsState> {
  /// Rebuilds derived settings whenever persisted settings change.
  @override
  AppSettingsState build() {
    ref.watch(settingsRevisionProvider);
    return AppSettingsState.fromAppSettings(ref.watch(settingsProvider));
  }

  /// Updates domain [AppSettings] via [update] and persists (revision bump).
  Future<void> apply(AppSettings Function(AppSettings settings) update) =>
      persistSettings(ref, update);

  /// Mutates named fields, persists, and syncs slang locale when [locale] changes.
  Future<void> update({
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
  }) async {
    await apply(
      (settings) => settings.copyWith(
        amoledTheme: amoledTheme ?? settings.amoledTheme,
        materialColor: materialColor ?? settings.materialColor,
        roundDegree: roundDegree ?? settings.roundDegree,
        largeElement: largeElement ?? settings.largeElement,
        timeRange: timeRange ?? settings.timeRange,
        timeStart: timeStart ?? settings.timeStart,
        timeEnd: timeEnd ?? settings.timeEnd,
        widgetBackgroundColorLight:
            widgetBackgroundColorLight ?? settings.widgetBackgroundColorLight,
        widgetBackgroundColorDark:
            widgetBackgroundColorDark ?? settings.widgetBackgroundColorDark,
        widgetTextColorLight:
            widgetTextColorLight ?? settings.widgetTextColorLight,
        widgetTextColorDark:
            widgetTextColorDark ?? settings.widgetTextColorDark,
        language: locale == null
            ? settings.language
            : '${locale.languageCode}_${locale.countryCode}',
      ),
    );
    if (locale != null) {
      await LocaleSettings.setLocale(appLocaleFromFlutterLocale(locale));
    }
  }
}
