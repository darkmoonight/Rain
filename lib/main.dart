import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/modules/onboarding.dart';
import 'package:rain/app/modules/weather.dart';
import 'package:rain/theme/theme.dart';
import 'app/data/weather.dart';
import 'l10n/translation.dart';
import 'theme/theme_controller.dart';

late Isar isar;
late Settings settings;
final ValueNotifier<Future<bool>> isDeviceConnectedNotifier =
    ValueNotifier(InternetConnectionChecker().hasConnection);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isarInit();
  Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) async {
    if (result != ConnectivityResult.none) {
      isDeviceConnectedNotifier.value =
          InternetConnectionChecker().hasConnection;
    } else {
      isDeviceConnectedNotifier.value = Future(() => false);
    }
  });
  runApp(const MyApp());
}

Future<void> isarInit() async {
  isar = await Isar.open([
    SettingsSchema,
  ], directory: (await getApplicationSupportDirectory()).path);

  settings = await isar.settings.where().findFirst() ?? Settings();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return GetMaterialApp(
      theme: RainTheme.lightTheme,
      darkTheme: RainTheme.darkTheme,
      themeMode: themeController.theme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: Translation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      home: settings.onboard == false
          ? const OnboardingPage()
          : const WeatherPage(),
      builder: EasyLoading.init(),
    );
  }
}
