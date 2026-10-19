import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/bootstrap/app_bootstrap.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/theme/material_ui_dynamic_color_builder.dart';
import 'package:rain/core/theme/theme.dart';
import 'package:rain/core/utils/device_info.dart';
import 'package:rain/core/utils/snackbar_overlay.dart';

/// Root widget: routing, theming, localization, and global overlays.
class RainApp extends ConsumerStatefulWidget {
  const RainApp({super.key, required this.bootstrap});

  final AppBootstrap bootstrap;

  @override
  ConsumerState<RainApp> createState() => _RainAppState();
}

class _RainAppState extends ConsumerState<RainApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  /// Builds the themed, localized router app with global overlays.
  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(appSettingsProvider);
    final appearance = ref.watch(
      settingsProvider.select(
        (s) => (appFont: s.appFont, colorPalette: s.colorPalette),
      ),
    );
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(appRouterProvider);
    final edgeToEdgeAvailable = DeviceFeature().isEdgeToEdgeAvailable();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialUiDynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) {
          final themes = resolveAppThemes(
            materialColor: appSettings.materialColor,
            amoledTheme: appSettings.amoledTheme,
            colorPalette: appearance.colorPalette,
            lightDynamic: lightColorScheme,
            darkDynamic: darkColorScheme,
            edgeToEdgeAvailable: edgeToEdgeAvailable,
            appFont: appearance.appFont,
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
              title: 'rain'.tr,
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
