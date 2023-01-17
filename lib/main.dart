import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/modules/home.dart';
import 'package:rain/theme/theme.dart';

import 'app/data/weather.dart';
import 'l10n/translation.dart';
import 'theme/theme_controller.dart';

late Isar isar;
late Settings settings;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isarInit();
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

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
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
          home: const HomePage(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
