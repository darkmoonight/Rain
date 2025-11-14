import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:display_mode/display_mode.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/geolocation.dart';
import 'package:rain/app/ui/home.dart';
import 'package:rain/app/ui/onboarding.dart';
import 'package:rain/theme/theme.dart';
import 'package:rain/theme/theme_controller.dart';
import 'package:rain/translation/translation.dart';
import 'package:rain/app/utils/device_info.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:workmanager/workmanager.dart';

late Isar isar;
late Settings settings;
late LocationCache locationCache;
final ValueNotifier<Future<bool>> isOnline = ValueNotifier(
  InternetConnection().hasInternetAccess,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool amoledTheme = false;
bool materialColor = false;
bool roundDegree = false;
bool largeElement = false;
Locale locale = const Locale('en', 'US');
int timeRange = 1;
String timeStart = '08:00';
String timeEnd = '20:00';
String widgetBackgroundColor = '';
String widgetTextColor = '';

const String appGroupId = 'DARK NIGHT';
const String androidWidgetName = 'OreoWidget';

const List<Map<String, dynamic>> appLanguages = [
  {'name': 'বাংলা', 'locale': Locale('bn', 'IN')},
  {'name': 'Čeština', 'locale': Locale('cs', 'CZ')},
  {'name': 'Dansk', 'locale': Locale('da', 'DK')},
  {'name': 'Deutsch', 'locale': Locale('de', 'DE')},
  {'name': 'English', 'locale': Locale('en', 'US')},
  {'name': 'Español', 'locale': Locale('es', 'ES')},
  {'name': 'Français', 'locale': Locale('fr', 'FR')},
  // {'name': 'Gaeilge', 'locale':  Locale('ga', 'IE')},
  {'name': 'हिन्दी', 'locale': Locale('hi', 'IN')},
  {'name': 'Magyar', 'locale': Locale('hu', 'HU')},
  {'name': 'Italiano', 'locale': Locale('it', 'IT')},
  {'name': '한국어', 'locale': Locale('ko', 'KR')},
  {'name': 'فارسی', 'locale': Locale('fa', 'IR')},
  {'name': 'ქართული', 'locale': Locale('ka', 'GE')},
  {'name': 'Nederlands', 'locale': Locale('nl', 'NL')},
  {'name': 'Polski', 'locale': Locale('pl', 'PL')},
  {'name': 'Português', 'locale': Locale('pt', 'PT')},
  {'name': 'Português (Brasil)', 'locale': Locale('pt', 'BR')},
  {'name': 'Română', 'locale': Locale('ro', 'RO')},
  {'name': 'Русский', 'locale': Locale('ru', 'RU')},
  {'name': 'Slovenčina', 'locale': Locale('sk', 'SK')},
  {'name': 'Türkçe', 'locale': Locale('tr', 'TR')},
  {'name': 'اردو', 'locale': Locale('ur', 'PK')},
  {'name': '中文(简体)', 'locale': Locale('zh', 'CN')},
  {'name': '中文(繁體)', 'locale': Locale('zh', 'TW')},
];

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    return WeatherController().updateWidget();
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(const MyApp());
}

Future<void> initializeApp() async {
  setupConnectivityListener();
  await initializeTimeZone();
  await initializeIsar();
  await initializeNotifications();
  if (Platform.isAndroid) {
    await setOptimalDisplayMode();
    Workmanager().initialize(callbackDispatcher);
    HomeWidget.setAppGroupId(appGroupId);
  }
  DeviceFeature().init();
}

void setupConnectivityListener() {
  Connectivity().onConnectivityChanged.listen((result) {
    isOnline.value = result.contains(ConnectivityResult.none)
        ? Future.value(false)
        : InternetConnection().hasInternetAccess;
  });
}

Future<void> initializeTimeZone() async {
  final TimezoneInfo timeZoneName = await FlutterTimezone.getLocalTimezone();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));
}

Future<void> initializeIsar() async {
  isar = await Isar.open([
    SettingsSchema,
    MainWeatherCacheSchema,
    LocationCacheSchema,
    WeatherCardSchema,
  ], directory: (await getApplicationSupportDirectory()).path);
  settings = isar.settings.where().findFirstSync() ?? Settings();
  locationCache =
      isar.locationCaches.where().findFirstSync() ?? LocationCache();

  if (settings.language == null) {
    settings.language = '${Get.deviceLocale}';
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }

  if (settings.theme == null) {
    settings.theme = 'system';
    isar.writeTxnSync(() => isar.settings.putSync(settings));
  }
}

Future<void> initializeNotifications() async {
  const initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(),
    linux: LinuxInitializationSettings(defaultActionName: 'Rain'),
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> setOptimalDisplayMode() async {
  final List<DisplayModeJson> supported = await FlutterDisplayMode.supported;
  final DisplayModeJson active = await FlutterDisplayMode.active;
  final List<DisplayModeJson> sameResolution =
      supported
          .where(
            (DisplayModeJson m) =>
                m.width == active.width && m.height == active.height,
          )
          .toList()
        ..sort(
          (DisplayModeJson a, DisplayModeJson b) =>
              b.refreshRate.compareTo(a.refreshRate),
        );
  final DisplayModeJson mostOptimalMode = sameResolution.isNotEmpty
      ? sameResolution.first
      : active;
  await FlutterDisplayMode.setPreferredMode(mostOptimalMode);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static Future<void> updateAppState(
    BuildContext context, {
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
  }) async {
    final state = context.findAncestorStateOfType<_MyAppState>()!;

    if (newAmoledTheme != null) state.changeAmoledTheme(newAmoledTheme);
    if (newMaterialColor != null) state.changeMaterialTheme(newMaterialColor);
    if (newRoundDegree != null) state.changeRoundDegree(newRoundDegree);
    if (newLargeElement != null) state.changeLargeElement(newLargeElement);
    if (newLocale != null) state.changeLocale(newLocale);
    if (newTimeRange != null) state.changeTimeRange(newTimeRange);
    if (newTimeStart != null) state.changeTimeStart(newTimeStart);
    if (newTimeEnd != null) state.changeTimeEnd(newTimeEnd);
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

  void changeAmoledTheme(bool newAmoledTheme) =>
      setState(() => amoledTheme = newAmoledTheme);
  void changeMaterialTheme(bool newMaterialColor) =>
      setState(() => materialColor = newMaterialColor);
  void changeRoundDegree(bool newRoundDegree) =>
      setState(() => roundDegree = newRoundDegree);
  void changeLargeElement(bool newLargeElement) =>
      setState(() => largeElement = newLargeElement);
  void changeTimeRange(int newTimeRange) =>
      setState(() => timeRange = newTimeRange);
  void changeTimeStart(String newTimeStart) =>
      setState(() => timeStart = newTimeStart);
  void changeTimeEnd(String newTimeEnd) => setState(() => timeEnd = newTimeEnd);
  void changeLocale(Locale newLocale) => setState(() => locale = newLocale);
  void changeWidgetBackgroundColor(String newWidgetBackgroundColor) =>
      setState(() => widgetBackgroundColor = newWidgetBackgroundColor);
  void changeWidgetTextColor(String newWidgetTextColor) =>
      setState(() => widgetTextColor = newWidgetTextColor);

  @override
  void initState() {
    super.initState();
    amoledTheme = settings.amoledTheme;
    materialColor = settings.materialColor;
    roundDegree = settings.roundDegree;
    largeElement = settings.largeElement;
    locale = Locale(
      settings.language!.substring(0, 2),
      settings.language!.substring(3),
    );
    timeRange = settings.timeRange ?? 1;
    timeStart = settings.timeStart ?? '08:00';
    timeEnd = settings.timeEnd ?? '20:00';
    widgetBackgroundColor = settings.widgetBackgroundColor ?? '';
    widgetTextColor = settings.widgetTextColor ?? '';
  }

  @override
  Widget build(BuildContext context) {
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

          return GetMaterialApp(
            themeMode: themeController.theme,
            theme: materialColor
                ? lightColorScheme != null
                      ? lightMaterialTheme
                      : lightTheme(
                          lightColor,
                          colorSchemeLight,
                          edgeToEdgeAvailable,
                        )
                : lightTheme(lightColor, colorSchemeLight, edgeToEdgeAvailable),
            darkTheme: amoledTheme
                ? materialColor
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
                : materialColor
                ? darkColorScheme != null
                      ? darkMaterialTheme
                      : darkTheme(
                          darkColor,
                          colorSchemeDark,
                          edgeToEdgeAvailable,
                        )
                : darkTheme(darkColor, colorSchemeDark, edgeToEdgeAvailable),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            translations: Translation(),
            locale: locale,
            fallbackLocale: const Locale('en', 'US'),
            supportedLocales: appLanguages
                .map((e) => e['locale'] as Locale)
                .toList(),
            debugShowCheckedModeBanner: false,
            home: settings.onboard
                ? (locationCache.city == null ||
                          locationCache.district == null ||
                          locationCache.lat == null ||
                          locationCache.lon == null)
                      ? const SelectGeolocation(isStart: true)
                      : const HomePage()
                : const OnBoarding(),
            title: 'Rain',
          );
        },
      ),
    );
  }
}
