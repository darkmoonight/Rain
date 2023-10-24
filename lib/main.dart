import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/modules/home.dart';
import 'package:rain/app/modules/onboarding.dart';
import 'package:rain/theme/theme.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

import 'app/data/weather.dart';
import 'theme/theme_controller.dart';
import 'translation/translation.dart';

late Isar isar;
late Settings settings;
bool isOnline = false;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool amoledTheme = false;
bool materialColor = false;
Locale locale = const Locale('en', 'US');
int timeRange = 1;
String timeStart = '09:00';
String timeEnd = '21:00';
String widgetBackgroundColor = '';
String widgetTextColor = '';

final List appLanguages = [
  {'name': 'বাংলা', 'locale': const Locale('bn', 'IN')},
  {'name': 'Čeština', 'locale': const Locale('cs', 'CZ')},
  {'name': 'Deutsch', 'locale': const Locale('de', 'DE')},
  {'name': 'English', 'locale': const Locale('en', 'US')},
  {'name': 'Español', 'locale': const Locale('es', 'ES')},
  {'name': 'Gaeilge', 'locale': const Locale('ga', 'IE')},
  {'name': 'Français', 'locale': const Locale('fr', 'FR')},
  {'name': 'हिन्दी', 'locale': const Locale('hi', 'IN')},
  {'name': 'Italiano', 'locale': const Locale('it', 'IT')},
  {'name': 'Nederlands', 'locale': const Locale('nl', 'NL')},
  {'name': 'Polski', 'locale': const Locale('pl', 'PL')},
  {'name': 'Português (Brasil)', 'locale': const Locale('pt', 'BR')},
  {'name': 'Română', 'locale': const Locale('ro', 'RO')},
  {'name': 'Русский', 'locale': const Locale('ru', 'RU')},
  {'name': 'Slovenčina', 'locale': const Locale('sk', 'SK')},
  {'name': 'Türkçe', 'locale': const Locale('tr', 'TR')},
  {'name': 'اردو', 'locale': const Locale('ur', 'PK')},
  {'name': '中文', 'locale': const Locale('zh', 'CN')},
];

const String appGroupId = 'DARK NIGHT';
const String androidWidgetName = 'OreoWidget';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    return WeatherController().updateWidget();
  });
}

void main() async {
  final String timeZoneName;
  WidgetsFlutterBinding.ensureInitialized();
  Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    result == ConnectivityResult.none ? isOnline = false : isOnline = true;
  });
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
  if (Platform.isAndroid) {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
    await setOptimalDisplayMode();
  }
  if (Platform.isAndroid || Platform.isIOS) {
    timeZoneName = await FlutterTimezone.getLocalTimezone();
  } else {
    timeZoneName = '${DateTimeZone.local}';
  }
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
  await isarInit();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings();
  const LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(defaultActionName: 'Rain');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
    linux: initializationSettingsLinux,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  runApp(const MyApp());
}

Future<void> setOptimalDisplayMode() async {
  final List<DisplayMode> supported = await FlutterDisplayMode.supported;
  final DisplayMode active = await FlutterDisplayMode.active;
  final List<DisplayMode> sameResolution = supported
      .where((DisplayMode m) =>
          m.width == active.width && m.height == active.height)
      .toList()
    ..sort((DisplayMode a, DisplayMode b) =>
        b.refreshRate.compareTo(a.refreshRate));
  final DisplayMode mostOptimalMode =
      sameResolution.isNotEmpty ? sameResolution.first : active;
  await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
}

Future<void> isarInit() async {
  isar = await Isar.open([
    SettingsSchema,
    MainWeatherCacheSchema,
    LocationCacheSchema,
    WeatherCardSchema,
  ], directory: (await getApplicationSupportDirectory()).path);
  settings = isar.settings.where().findFirstSync() ?? Settings();

  if (settings.language == null) {
    settings.language = '${Get.deviceLocale}';
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }

  if (settings.theme == null) {
    settings.theme = 'system';
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static Future<void> updateAppState(
    BuildContext context, {
    bool? newAmoledTheme,
    bool? newMaterialColor,
    Locale? newLocale,
    int? newTimeRange,
    String? newTimeStart,
    String? newTimeEnd,
    String? newWidgetBackgroundColor,
    String? newWidgetTextColor,
  }) async {
    final state = context.findAncestorStateOfType<_MyAppState>()!;

    if (newAmoledTheme != null) {
      state.changeAmoledTheme(newAmoledTheme);
    }
    if (newMaterialColor != null) {
      state.changeMarerialTheme(newMaterialColor);
    }
    if (newLocale != null) {
      state.changeLocale(newLocale);
    }
    if (newTimeRange != null) {
      state.changeTimeRange(newTimeRange);
    }
    if (newTimeStart != null) {
      state.changeTimeStart(newTimeStart);
    }
    if (newTimeEnd != null) {
      state.changeTimeEnd(newTimeEnd);
    }
    if (newWidgetBackgroundColor != null) {
      state.changeWidgetBackgroundColor(newWidgetBackgroundColor);
    }
    if (newWidgetTextColor != null) {
      state.changeWidgetTextColor(newWidgetTextColor);
    }
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = Get.put(ThemeController());

  void changeAmoledTheme(bool newAmoledTheme) {
    setState(() {
      amoledTheme = newAmoledTheme;
    });
  }

  void changeMarerialTheme(bool newMaterialColor) {
    setState(() {
      materialColor = newMaterialColor;
    });
  }

  void changeTimeRange(int newTimeRange) {
    setState(() {
      timeRange = newTimeRange;
    });
  }

  void changeTimeStart(String newTimeStart) {
    setState(() {
      timeStart = newTimeStart;
    });
  }

  void changeTimeEnd(String newTimeEnd) {
    setState(() {
      timeEnd = newTimeEnd;
    });
  }

  void changeLocale(Locale newLocale) {
    setState(() {
      locale = newLocale;
    });
  }

  void changeWidgetBackgroundColor(String newWidgetBackgroundColor) {
    setState(() {
      widgetBackgroundColor = newWidgetBackgroundColor;
    });
  }

  void changeWidgetTextColor(String newWidgetTextColor) {
    setState(() {
      widgetTextColor = newWidgetTextColor;
    });
  }

  @override
  void initState() {
    amoledTheme = settings.amoledTheme;
    materialColor = settings.materialColor;
    locale = Locale(
        settings.language!.substring(0, 2), settings.language!.substring(3));
    timeRange = settings.timeRange ?? 1;
    timeStart = settings.timeStart ?? '09:00';
    timeEnd = settings.timeEnd ?? '21:00';
    widgetBackgroundColor = settings.widgetBackgroundColor ?? '';
    widgetTextColor = settings.widgetTextColor ?? '';
    if (Platform.isAndroid) {
      HomeWidget.setAppGroupId(appGroupId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        final lightMaterialTheme =
            lightTheme(lightColorScheme?.surface, lightColorScheme);
        final darkMaterialTheme =
            darkTheme(darkColorScheme?.surface, darkColorScheme);
        final darkMaterialThemeOled = darkTheme(oledColor, darkColorScheme);

        return GetMaterialApp(
          themeMode: themeController.theme,
          theme: materialColor
              ? lightColorScheme != null
                  ? lightMaterialTheme
                  : lightTheme(lightColor, colorSchemeLight)
              : lightTheme(lightColor, colorSchemeLight),
          darkTheme: amoledTheme
              ? materialColor
                  ? darkColorScheme != null
                      ? darkMaterialThemeOled
                      : darkTheme(oledColor, colorSchemeDark)
                  : darkTheme(oledColor, colorSchemeDark)
              : materialColor
                  ? darkColorScheme != null
                      ? darkMaterialTheme
                      : darkTheme(darkColor, colorSchemeDark)
                  : darkTheme(darkColor, colorSchemeDark),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          translations: Translation(),
          locale: locale,
          fallbackLocale: const Locale('en', 'US'),
          supportedLocales:
              appLanguages.map((e) => e['locale'] as Locale).toList(),
          debugShowCheckedModeBanner: false,
          home: settings.onboard ? const HomePage() : const OnboardingPage(),
        );
      },
    );
  }
}
