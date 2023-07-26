import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/modules/home.dart';
import 'package:rain/app/modules/onboarding.dart';
import 'package:rain/theme/theme.dart';
import 'package:time_machine/time_machine.dart';
import 'app/data/weather.dart';
import 'translation/translation.dart';
import 'theme/theme_controller.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

late Isar isar;
late Settings settings;
final ValueNotifier<Future<bool>> isDeviceConnectedNotifier =
    ValueNotifier(InternetConnection().hasInternetAccess);

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool amoledTheme = false;
bool materialColor = false;
Locale locale = const Locale('en', 'US');
int timeRange = 1;
String timeStart = '09:00';
String timeEnd = '21:00';

final List appLanguages = [
  {'name': 'English', 'locale': const Locale('en', 'US')},
  {'name': 'Русский', 'locale': const Locale('ru', 'RU')},
  {'name': 'italiano', 'locale': const Locale('it', 'IT')},
  {'name': 'Deutsch', 'locale': const Locale('de', 'DE')},
  {'name': 'Français', 'locale': const Locale('fr', 'FR')},
  {'name': 'Türkçe', 'locale': const Locale('tr', 'TR')},
  {'name': 'Brasileiro', 'locale': const Locale('pt', 'BR')},
  {'name': 'Español', 'locale': const Locale('es', 'ES')},
  {'name': 'Slovenčina', 'locale': const Locale('sk', 'SK')},
  {'name': 'Nederlands', 'locale': const Locale('nl', 'NL')},
  {'name': 'हिन्दी', 'locale': const Locale('hi', 'IN')},
  {'name': 'Română', 'locale': const Locale('ro', 'RO')},
  {'name': '中文', 'locale': const Locale('zh', 'CN')},
];

void main() async {
  final String timeZoneName;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
    ),
  );
  await isarInit();
  if (Platform.isAndroid) {
    await setOptimalDisplayMode();
  }
  if (Platform.isAndroid || Platform.isIOS) {
    timeZoneName = await FlutterTimezone.getLocalTimezone();
  } else {
    timeZoneName = '${DateTimeZone.local}';
  }
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
  Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      isDeviceConnectedNotifier.value = InternetConnection().hasInternetAccess;
    } else {
      isDeviceConnectedNotifier.value = Future(() => false);
    }
  });
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
  settings = await isar.settings.where().findFirst() ?? Settings();
  if (settings.language == null) {
    settings.language = '${Get.deviceLocale}';
    isar.writeTxn(() async => isar.settings.put(settings));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static Future<void> updateAppState(
    BuildContext context, {
    bool? newAmoledTheme,
    bool? newMaterialColor,
    Locale? newLocale,
    int? newTimeRange,
    String? newTimeStart,
    String? newTimeEnd,
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

  @override
  void initState() {
    amoledTheme = settings.amoledTheme;
    materialColor = settings.materialColor;
    locale = Locale(
        settings.language!.substring(0, 2), settings.language!.substring(3));
    timeRange = settings.timeRange ?? 1;
    timeStart = settings.timeStart ?? '09:00';
    timeEnd = settings.timeEnd ?? '21:00';
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
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ru', 'RU'),
            Locale('it', 'IT'),
            Locale('de', 'DE'),
            Locale('fr', 'FR'),
            Locale('tr', 'TR'),
            Locale('pt', 'BR'),
            Locale('es', 'ES'),
            Locale('sk', 'SK'),
            Locale('nl', 'NL'),
            Locale('hi', 'IN'),
            Locale('ro', 'RO'),
            Locale('zh', 'CN'),
          ],
          debugShowCheckedModeBanner: false,
          home: settings.onboard == false
              ? const OnboardingPage()
              : const HomePage(),
        );
      },
    );
  }
}
