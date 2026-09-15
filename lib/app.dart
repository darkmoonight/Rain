import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/i18n/strings.g.dart';
import 'package:rain/core/theme/material_ui_dynamic_color_builder.dart';
import 'package:rain/core/theme/theme.dart';
import 'package:rain/core/utils/device_info.dart';
import 'package:rain/core/utils/snackbar_overlay.dart';

/// Root widget: routing, theming, localization, and global overlays.
class RainApp extends ConsumerWidget {
  const RainApp({super.key, required this.bootstrap});

  final AppBootstrap bootstrap;

  /// Applies settings changes through [appSettingsProvider].
  static void updateAppState(
    WidgetRef ref, {
    bool? newAmoledTheme,
    bool? newMaterialColor,
    bool? newRoundDegree,
    bool? newLargeElement,
    Locale? newLocale,
    int? newTimeRange,
    String? newTimeStart,
    String? newTimeEnd,
  }) {
    ref
        .read(appSettingsProvider.notifier)
        .update(
          amoledTheme: newAmoledTheme,
          materialColor: newMaterialColor,
          roundDegree: newRoundDegree,
          largeElement: newLargeElement,
          locale: newLocale,
          timeRange: newTimeRange,
          timeStart: newTimeStart,
          timeEnd: newTimeEnd,
        );
  }

  /// Builds the themed, localized router app with global overlays.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final appFont = ref.watch(settingsProvider).appFont;
    final colorPalette = ref.watch(settingsProvider).colorPalette;
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(appRouterProvider);
    final edgeToEdgeAvailable = DeviceFeature().isEdgeToEdgeAvailable();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialUiDynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          final themes = resolveAppThemes(
            materialColor: appSettings.materialColor,
            amoledTheme: appSettings.amoledTheme,
            colorPalette: colorPalette,
            lightDynamic: lightColorScheme,
            darkDynamic: darkColorScheme,
            edgeToEdgeAvailable: edgeToEdgeAvailable,
            appFont: appFont,
          );

          return TranslationProvider(
            child: MaterialApp.router(
              routerConfig: router,
              themeMode: themeMode,
              theme: themes.light,
              darkTheme: themes.dark,
              locale: appSettings.locale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              debugShowCheckedModeBanner: false,
              title: 'Rain',
              builder: (context, child) {
                final content = Stack(
                  children: [?child, const SnackBarOverlayWidget()],
                );
                // Required until google_fonts, shimmer, flutter_hsvcolor_picker
                // (and similar) migrate off package:flutter/material.dart.
                // Safe to remove once those packages use material_ui.
                // ignore: deprecated_member_use
                return MaterialUiCompatibilityBridge(child: content);
              },
            ),
          );
        },
      ),
    );
  }
}
