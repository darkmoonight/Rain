import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/i18n/strings.g.dart';
import 'package:rain/core/theme/theme.dart';
import 'package:rain/core/utils/device_info.dart';
import 'package:rain/core/utils/snackbar_overlay.dart';

class RainApp extends ConsumerWidget {
  const RainApp({super.key, required this.bootstrap});

  final AppBootstrap bootstrap;

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
    String? newWidgetBackgroundColor,
    String? newWidgetTextColor,
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
          widgetBackgroundColor: newWidgetBackgroundColor,
          widgetTextColor: newWidgetTextColor,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(appRouterProvider);
    final edgeToEdgeAvailable = DeviceFeature().isEdgeToEdgeAvailable();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          final lightMaterialTheme = lightTheme(
            lightColorScheme?.surface,
            lightColorScheme,
            edgeToEdgeAvailable,
          );
          final darkMaterialTheme = darkTheme(
            darkColorScheme?.surface,
            darkColorScheme,
            edgeToEdgeAvailable,
          );
          final darkMaterialThemeOled = darkTheme(
            oledColor,
            darkColorScheme,
            edgeToEdgeAvailable,
          );

          return TranslationProvider(
            child: MaterialApp.router(
              routerConfig: router,
              themeMode: themeMode,
              theme: appSettings.materialColor
                  ? lightColorScheme != null
                        ? lightMaterialTheme
                        : lightTheme(
                            lightColor,
                            colorSchemeLight,
                            edgeToEdgeAvailable,
                          )
                  : lightTheme(
                      lightColor,
                      colorSchemeLight,
                      edgeToEdgeAvailable,
                    ),
              darkTheme: appSettings.amoledTheme
                  ? appSettings.materialColor
                        ? darkColorScheme != null
                              ? darkMaterialThemeOled
                              : darkTheme(
                                  oledColor,
                                  colorSchemeDark,
                                  edgeToEdgeAvailable,
                                )
                        : darkTheme(
                            oledColor,
                            colorSchemeDark,
                            edgeToEdgeAvailable,
                          )
                  : appSettings.materialColor
                  ? darkColorScheme != null
                        ? darkMaterialTheme
                        : darkTheme(
                            darkColor,
                            colorSchemeDark,
                            edgeToEdgeAvailable,
                          )
                  : darkTheme(darkColor, colorSchemeDark, edgeToEdgeAvailable),
              locale: appSettings.locale,
              supportedLocales: AppLocaleUtils.supportedLocales,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              title: 'Rain',
              builder: (context, child) =>
                  Stack(children: [?child, const SnackBarOverlayWidget()]),
            ),
          );
        },
      ),
    );
  }
}
