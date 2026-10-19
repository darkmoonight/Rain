import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/settings/settings_persistence.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';

/// Exposes derived app settings for widgets and services.
///
/// Single source of truth: always derived from persisted [settingsProvider]
/// after [settingsRevisionProvider] bumps. Do not keep a parallel in-memory
/// copy that diverges from Isar.
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

  /// Mutates the shared [Settings] via [mutate] and persists (revision bump).
  Future<void> apply(void Function(Settings settings) mutate) =>
      persistSettings(ref, mutate);

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
    await apply((settings) {
      if (amoledTheme != null) settings.amoledTheme = amoledTheme;
      if (materialColor != null) settings.materialColor = materialColor;
      if (roundDegree != null) settings.roundDegree = roundDegree;
      if (largeElement != null) settings.largeElement = largeElement;
      if (timeRange != null) settings.timeRange = timeRange;
      if (timeStart != null) settings.timeStart = timeStart;
      if (timeEnd != null) settings.timeEnd = timeEnd;
      if (widgetBackgroundColorLight != null) {
        settings.widgetBackgroundColorLight = widgetBackgroundColorLight;
      }
      if (widgetBackgroundColorDark != null) {
        settings.widgetBackgroundColorDark = widgetBackgroundColorDark;
      }
      if (widgetTextColorLight != null) {
        settings.widgetTextColorLight = widgetTextColorLight;
      }
      if (widgetTextColorDark != null) {
        settings.widgetTextColorDark = widgetTextColorDark;
      }
      if (locale != null) {
        settings.language = '${locale.languageCode}_${locale.countryCode}';
      }
    });
    if (locale != null) {
      await LocaleSettings.setLocale(appLocaleFromFlutterLocale(locale));
    }
  }
}
