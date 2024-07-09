import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/modules/settings/widgets/setting_card.dart';
import 'package:rain/main.dart';
import 'package:rain/theme/theme_controller.dart';
import 'package:rain/utils/color_converter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final themeController = Get.put(ThemeController());
  final weatherController = Get.put(WeatherController());
  String? appVersion;
  String? colorBackground;
  String? colorText;

  Future<void> infoVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  void urlLauncher(String uri) async {
    final Uri url = Uri.parse(uri);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    infoVersion();
    super.initState();
  }

  updateLanguage(Locale locale) {
    settings.language = '$locale';
    isar.writeTxnSync(() => isar.settings.putSync(settings));
    Get.updateLocale(locale);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SettingCard(
            icon: const Icon(Iconsax.brush_1),
            text: 'appearance'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'appearance'.tr,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.moon),
                                text: 'theme'.tr,
                                dropdown: true,
                                dropdownName: settings.theme?.tr,
                                dropdownList: <String>[
                                  'system'.tr,
                                  'dark'.tr,
                                  'light'.tr
                                ],
                                dropdownCange: (String? newValue) {
                                  final newThemeMode = newValue?.tr;
                                  final darkTheme = 'dark'.tr;
                                  final systemTheme = 'system'.tr;
                                  ThemeMode themeMode =
                                      newThemeMode == systemTheme
                                          ? ThemeMode.system
                                          : newThemeMode == darkTheme
                                              ? ThemeMode.dark
                                              : ThemeMode.light;
                                  String theme = newThemeMode == systemTheme
                                      ? 'system'
                                      : newThemeMode == darkTheme
                                          ? 'dark'
                                          : 'light';
                                  themeController.saveTheme(theme);
                                  themeController.changeThemeMode(themeMode);
                                  setState(() {});
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.mobile),
                                text: 'amoledTheme'.tr,
                                switcher: true,
                                value: settings.amoledTheme,
                                onChange: (value) {
                                  themeController.saveOledTheme(value);
                                  MyApp.updateAppState(context,
                                      newAmoledTheme: value);
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.colorfilter),
                                text: 'materialColor'.tr,
                                switcher: true,
                                value: settings.materialColor,
                                onChange: (value) {
                                  themeController.saveMaterialTheme(value);
                                  MyApp.updateAppState(context,
                                      newMaterialColor: value);
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          SettingCard(
            icon: const Icon(Iconsax.code),
            text: 'functions'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'functions'.tr,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.map_1),
                                text: 'location'.tr,
                                switcher: true,
                                value: settings.location,
                                onChange: (value) async {
                                  if (value) {
                                    bool serviceEnabled = await Geolocator
                                        .isLocationServiceEnabled();
                                    if (!serviceEnabled) {
                                      if (!context.mounted) return;
                                      await showAdaptiveDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog.adaptive(
                                            title: Text(
                                              'location'.tr,
                                              style: context.textTheme.titleLarge,
                                            ),
                                            content: Text('no_location'.tr,
                                                style: context
                                                    .textTheme.titleMedium),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Get.back(result: false),
                                                child: Text(
                                                  'cancel'.tr,
                                                  style: context
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                          color:
                                                              Colors.blueAccent),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Geolocator
                                                      .openLocationSettings();
                                                  Get.back(result: true);
                                                },
                                                child: Text(
                                                  'settings'.tr,
                                                  style: context
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                          color: Colors.green),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                    
                                      return;
                                    }
                                    weatherController.getCurrentLocation();
                                  }
                                  isar.writeTxnSync(() {
                                    settings.location = value;
                                    isar.settings.putSync(settings);
                                  });
                                  setState(() {});
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.notification_1),
                                text: 'notifications'.tr,
                                switcher: true,
                                value: settings.notifications,
                                onChange: (value) async {
                                  final resultExact =
                                      await flutterLocalNotificationsPlugin
                                          .resolvePlatformSpecificImplementation<
                                              AndroidFlutterLocalNotificationsPlugin>()
                                          ?.requestExactAlarmsPermission();
                                  final result = Platform.isIOS
                                      ? await flutterLocalNotificationsPlugin
                                          .resolvePlatformSpecificImplementation<
                                              IOSFlutterLocalNotificationsPlugin>()
                                          ?.requestPermissions()
                                      : await flutterLocalNotificationsPlugin
                                          .resolvePlatformSpecificImplementation<
                                              AndroidFlutterLocalNotificationsPlugin>()
                                          ?.requestNotificationsPermission();
                                  if (result != null && resultExact != null) {
                                    isar.writeTxnSync(() {
                                      settings.notifications = value;
                                      isar.settings.putSync(settings);
                                    });
                                    if (value) {
                                      weatherController.notification(
                                          weatherController.mainWeather);
                                    } else {
                                      flutterLocalNotificationsPlugin.cancelAll();
                                    }
                                    setState(() {});
                                  }
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.notification_status),
                                text: 'timeRange'.tr,
                                dropdown: true,
                                dropdownName: '$timeRange',
                                dropdownList: const <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                ],
                                dropdownCange: (String? newValue) {
                                  isar.writeTxnSync(() {
                                    settings.timeRange = int.parse(newValue!);
                                    isar.settings.putSync(settings);
                                  });
                                  MyApp.updateAppState(context,
                                      newTimeRange: int.parse(newValue!));
                                  if (settings.notifications) {
                                    flutterLocalNotificationsPlugin.cancelAll();
                                    weatherController.notification(
                                        weatherController.mainWeather);
                                  }
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.timer_start),
                                text: 'timeStart'.tr,
                                info: true,
                                infoSettings: true,
                                infoWidget: _TextInfo(
                                  info: settings.timeformat == '12'
                                      ? DateFormat.jm(locale.languageCode).format(
                                          DateFormat.Hm(locale.languageCode)
                                              .parse(weatherController
                                                  .timeConvert(timeStart)
                                                  .format(context)))
                                      : DateFormat.Hm(locale.languageCode).format(
                                          DateFormat.Hm(locale.languageCode)
                                              .parse(weatherController
                                                  .timeConvert(timeStart)
                                                  .format(context))),
                                ),
                                onPressed: () async {
                                  final TimeOfDay? timeStartPicker =
                                      await showTimePicker(
                                    context: context,
                                    initialTime:
                                        weatherController.timeConvert(timeStart),
                                    builder: (context, child) {
                                      final Widget mediaQueryWrapper = MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat:
                                              settings.timeformat == '12'
                                                  ? false
                                                  : true,
                                        ),
                                        child: child!,
                                      );
                                      return mediaQueryWrapper;
                                    },
                                  );
                                  if (timeStartPicker != null) {
                                    isar.writeTxnSync(() {
                                      settings.timeStart =
                                          timeStartPicker.format(context);
                                      isar.settings.putSync(settings);
                                    });
                                    if (!context.mounted) return;
                                    MyApp.updateAppState(context,
                                        newTimeStart:
                                            timeStartPicker.format(context));
                                    if (settings.notifications) {
                                      flutterLocalNotificationsPlugin.cancelAll();
                                      weatherController.notification(
                                          weatherController.mainWeather);
                                    }
                                  }
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.timer_pause),
                                text: 'timeEnd'.tr,
                                info: true,
                                infoSettings: true,
                                infoWidget: _TextInfo(
                                  info: settings.timeformat == '12'
                                      ? DateFormat.jm(locale.languageCode).format(
                                          DateFormat.Hm(locale.languageCode)
                                              .parse(weatherController
                                                  .timeConvert(timeEnd)
                                                  .format(context)))
                                      : DateFormat.Hm(locale.languageCode).format(
                                          DateFormat.Hm(locale.languageCode)
                                              .parse(weatherController
                                                  .timeConvert(timeEnd)
                                                  .format(context))),
                                ),
                                onPressed: () async {
                                  final TimeOfDay? timeEndPicker =
                                      await showTimePicker(
                                    context: context,
                                    initialTime:
                                        weatherController.timeConvert(timeEnd),
                                    builder: (context, child) {
                                      final Widget mediaQueryWrapper = MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat:
                                              settings.timeformat == '12'
                                                  ? false
                                                  : true,
                                        ),
                                        child: child!,
                                      );
                                      return mediaQueryWrapper;
                                    },
                                  );
                                  if (timeEndPicker != null) {
                                    isar.writeTxnSync(() {
                                      settings.timeEnd =
                                          timeEndPicker.format(context);
                                      isar.settings.putSync(settings);
                                    });
                                    if (!context.mounted) return;
                                    MyApp.updateAppState(context,
                                        newTimeEnd:
                                            timeEndPicker.format(context));
                                    if (settings.notifications) {
                                      flutterLocalNotificationsPlugin.cancelAll();
                                      weatherController.notification(
                                          weatherController.mainWeather);
                                    }
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          SettingCard(
            icon: const Icon(Iconsax.d_square),
            text: 'data'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'data'.tr,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.cloud_notif),
                                text: 'roundDegree'.tr,
                                switcher: true,
                                value: settings.roundDegree,
                                onChange: (value) {
                                  settings.roundDegree = value;
                                  isar.writeTxnSync(
                                    () => isar.settings.putSync(settings),
                                  );
                                  MyApp.updateAppState(
                                    context,
                                    newRoundDegree: value,
                                  );
                                  setState(() {});
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.sun_1),
                                text: 'degrees'.tr,
                                dropdown: true,
                                dropdownName: settings.degrees.tr,
                                dropdownList: <String>[
                                  'celsius'.tr,
                                  'fahrenheit'.tr
                                ],
                                dropdownCange: (String? newValue) async {
                                  isar.writeTxnSync(() {
                                    settings.degrees = newValue == 'celsius'.tr
                                        ? 'celsius'
                                        : 'fahrenheit';
                                    isar.settings.putSync(settings);
                                  });
                                  await weatherController.deleteAll(false);
                                  await weatherController.setLocation();
                                  await weatherController.updateCacheCard(true);
                                  setState(() {});
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.rulerpen),
                                text: 'measurements'.tr,
                                dropdown: true,
                                dropdownName: settings.measurements.tr,
                                dropdownList: <String>[
                                  'metric'.tr,
                                  'imperial'.tr
                                ],
                                dropdownCange: (String? newValue) async {
                                  isar.writeTxnSync(() {
                                    settings.measurements =
                                        newValue == 'metric'.tr
                                            ? 'metric'
                                            : 'imperial';
                                    isar.settings.putSync(settings);
                                  });
                                  await weatherController.deleteAll(false);
                                  await weatherController.setLocation();
                                  await weatherController.updateCacheCard(true);
                                  setState(() {});
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.clock),
                                text: 'timeformat'.tr,
                                dropdown: true,
                                dropdownName: settings.timeformat.tr,
                                dropdownList: <String>['12'.tr, '24'.tr],
                                dropdownCange: (String? newValue) {
                                  isar.writeTxnSync(() {
                                    settings.timeformat =
                                        newValue == '12'.tr ? '12' : '24';
                                    isar.settings.putSync(settings);
                                  });
                                  setState(() {});
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          SettingCard(
            icon: const Icon(Iconsax.setting_3),
            text: 'widget'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'widget'.tr,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.bucket_square),
                                text: 'widgetBackground'.tr,
                                info: true,
                                infoWidget: CircleAvatar(
                                  backgroundColor: context.theme.indicatorColor,
                                  radius: 11,
                                  child: CircleAvatar(
                                    backgroundColor: widgetBackgroundColor.isEmpty
                                        ? context.theme.primaryColor
                                        : HexColor.fromHex(widgetBackgroundColor),
                                    radius: 10,
                                  ),
                                ),
                                onPressed: () {
                                  colorBackground = null;
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 15),
                                              child: Text(
                                                'widgetBackground'.tr,
                                                style: context
                                                    .textTheme.titleMedium
                                                    ?.copyWith(fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Theme(
                                                data: context.theme.copyWith(
                                                  inputDecorationTheme:
                                                      InputDecorationTheme(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                child: ColorPicker(
                                                  color: widgetBackgroundColor
                                                          .isEmpty
                                                      ? context.theme.primaryColor
                                                      : HexColor.fromHex(
                                                          widgetBackgroundColor),
                                                  onChanged: (pickedColor) {
                                                    colorBackground =
                                                        pickedColor.toHex();
                                                  },
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Iconsax.tick_square,
                                              ),
                                              onPressed: () {
                                                if (colorBackground == null) {
                                                  return;
                                                }
                                                weatherController
                                                    .updateWidgetBackgroundColor(
                                                        colorBackground!);
                                                MyApp.updateAppState(context,
                                                    newWidgetBackgroundColor:
                                                        colorBackground);
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.text_block),
                                text: 'widgetText'.tr,
                                info: true,
                                infoWidget: CircleAvatar(
                                  backgroundColor: context.theme.indicatorColor,
                                  radius: 11,
                                  child: CircleAvatar(
                                    backgroundColor: widgetTextColor.isEmpty
                                        ? context.theme.primaryColor
                                        : HexColor.fromHex(widgetTextColor),
                                    radius: 10,
                                  ),
                                ),
                                onPressed: () {
                                  colorText = null;
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 15),
                                              child: Text(
                                                'widgetText'.tr,
                                                style: context
                                                    .textTheme.titleMedium
                                                    ?.copyWith(fontSize: 18),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Theme(
                                                data: context.theme.copyWith(
                                                  inputDecorationTheme:
                                                      InputDecorationTheme(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                child: ColorPicker(
                                                  color: widgetTextColor.isEmpty
                                                      ? context.theme.primaryColor
                                                      : HexColor.fromHex(
                                                          widgetTextColor),
                                                  onChanged: (pickedColor) {
                                                    colorText =
                                                        pickedColor.toHex();
                                                  },
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Iconsax.tick_square,
                                              ),
                                              onPressed: () {
                                                if (colorText == null) return;
                                                weatherController
                                                    .updateWidgetTextColor(
                                                        colorText!);
                                                MyApp.updateAppState(context,
                                                    newWidgetTextColor:
                                                        colorText);
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          SettingCard(
            icon: const Icon(Iconsax.language_square),
            text: 'language'.tr,
            info: true,
            infoSettings: true,
            infoWidget: _TextInfo(
              info: appLanguages.firstWhere(
                  (element) => (element['locale'] == locale),
                  orElse: () => appLanguages.first)['name'],
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                'language'.tr,
                                style: context.textTheme.titleLarge?.copyWith(
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: appLanguages.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 4,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: ListTile(
                                    title: Text(
                                      appLanguages[index]['name'],
                                      style: context.textTheme.labelLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                    onTap: () {
                                      MyApp.updateAppState(context,
                                          newLocale: appLanguages[index]
                                              ['locale']);
                                      updateLanguage(
                                          appLanguages[index]['locale']);
                                    },
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          SettingCard(
            icon: const Icon(Iconsax.dollar_square),
            text: 'support'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'support'.tr,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.card),
                                text: 'DonationAlerts',
                                onPressed: () => urlLauncher(
                                    'https://www.donationalerts.com/r/darkmoonight'),
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.wallet),
                                text: 'ЮMoney',
                                onPressed: () => urlLauncher(
                                    'https://yoomoney.ru/to/4100117672775961'),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          SettingCard(
            icon: const Icon(Iconsax.link_square),
            text: 'groups'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Text(
                                  'groups'.tr,
                                  style: context.textTheme.titleLarge?.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.voice_square),
                                text: 'Discord',
                                onPressed: () async {
                                  final Uri url =
                                      Uri.parse('https://discord.gg/JMMa9aHh8f');
                                  if (!await launchUrl(url,
                                      mode: LaunchMode.externalApplication)) {
                                    throw Exception('Could not launch $url');
                                  }
                                },
                              ),
                              SettingCard(
                                elevation: 4,
                                icon: const Icon(Iconsax.message_square),
                                text: 'Telegram',
                                onPressed: () async {
                                  final Uri url =
                                      Uri.parse('https://t.me/darkmoonightX');
                                  if (!await launchUrl(url,
                                      mode: LaunchMode.externalApplication)) {
                                    throw Exception('Could not launch $url');
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
          SettingCard(
            icon: const Icon(Iconsax.document),
            text: 'license'.tr,
            onPressed: () => Get.to(
              LicensePage(
                applicationIcon: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage('assets/icons/icon.png'),
                    ),
                  ),
                ),
                applicationName: 'Rain',
                applicationVersion: appVersion,
              ),
              transition: Transition.downToUp,
            ),
          ),
          SettingCard(
            icon: const Icon(Iconsax.hierarchy_square_2),
            text: 'version'.tr,
            info: true,
            infoWidget: _TextInfo(
              info: '$appVersion',
            ),
          ),
          SettingCard(
            icon: Image.asset(
              'assets/images/github.png',
              scale: 20,
            ),
            text: '${'project'.tr} GitHub',
            onPressed: () =>
                urlLauncher('https://github.com/darkmoonight/Rain'),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              child: Text(
                'openMeteo'.tr,
                style: context.textTheme.bodyMedium,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
              onTap: () => urlLauncher('https://open-meteo.com/'),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _TextInfo extends StatelessWidget {
  const _TextInfo({required this.info});

  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Text(
        info,
        style: context.textTheme.bodyMedium,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
