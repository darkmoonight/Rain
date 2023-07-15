import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/widgets/setting_links.dart';
import 'package:rain/main.dart';
import 'package:rain/theme/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final themeController = Get.put(ThemeController());
  final locationController = Get.put(LocationController());
  String? appVersion;

  Future<void> infoVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  void initState() {
    infoVersion();
    super.initState();
  }

  updateLanguage(Locale locale) {
    settings.language = '$locale';
    isar.writeTxn(() async => isar.settings.put(settings));
    Get.updateLocale(locale);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SettingLinks(
            icon: const Icon(
              Iconsax.brush_1,
            ),
            text: 'appearance'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Text(
                              'appearance'.tr,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.moon,
                            ),
                            text: 'theme'.tr,
                            switcher: true,
                            value: Get.isDarkMode,
                            onChange: (_) {
                              if (Get.isDarkMode) {
                                themeController
                                    .changeThemeMode(ThemeMode.light);
                                themeController.saveTheme(false);
                              } else {
                                themeController.changeThemeMode(ThemeMode.dark);
                                themeController.saveTheme(true);
                              }
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.mobile,
                            ),
                            text: 'amoledTheme'.tr,
                            switcher: true,
                            value: settings.amoledTheme,
                            onChange: (value) {
                              themeController.saveOledTheme(value);
                              MyApp.updateAppState(context,
                                  newAmoledTheme: value);
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.colorfilter,
                            ),
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
                      );
                    },
                  );
                },
              );
            },
          ),
          SettingLinks(
            icon: const Icon(
              Iconsax.code,
            ),
            text: 'functions'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Text(
                              'functions'.tr,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.map_1,
                            ),
                            text: 'location'.tr,
                            switcher: true,
                            value: settings.location,
                            onChange: (value) {
                              isar.writeTxn(() async {
                                settings.location = value;
                                isar.settings.put(settings);
                              });
                              setState(() {});
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.notification_1,
                            ),
                            text: 'notifications'.tr,
                            switcher: true,
                            value: settings.notifications,
                            onChange: (value) async {
                              final result = Platform.isIOS
                                  ? await flutterLocalNotificationsPlugin
                                      .resolvePlatformSpecificImplementation<
                                          IOSFlutterLocalNotificationsPlugin>()
                                      ?.requestPermissions()
                                  : await flutterLocalNotificationsPlugin
                                      .resolvePlatformSpecificImplementation<
                                          AndroidFlutterLocalNotificationsPlugin>()
                                      ?.requestPermission();
                              if (result != null) {
                                isar.writeTxn(() async {
                                  settings.notifications = value;
                                  isar.settings.put(settings);
                                });
                                if (value) {
                                  locationController.notlification(
                                      locationController.mainWeather);
                                } else {
                                  flutterLocalNotificationsPlugin.cancelAll();
                                }
                                setState(() {});
                              }
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.notification_status,
                            ),
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
                              isar.writeTxn(() async {
                                settings.timeRange = int.parse(newValue!);
                                isar.settings.put(settings);
                              });
                              MyApp.updateAppState(context,
                                  newTimeRange: int.parse(newValue!));
                              if (settings.notifications) {
                                flutterLocalNotificationsPlugin.cancelAll();
                                locationController.notlification(
                                    locationController.mainWeather);
                              }
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.timer_start,
                            ),
                            text: 'timeStart'.tr,
                            info: true,
                            infoSettings: true,
                            textInfo: TimeOfDay.now().format(context),
                            onPressed: () async {
                              final TimeOfDay? timeStart = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              isar.writeTxn(() async {
                                settings.timeStart = timeStart?.format(context);
                                isar.settings.put(settings);
                              });
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.timer_pause,
                            ),
                            text: 'timeEnd'.tr,
                            info: true,
                            infoSettings: true,
                            textInfo: TimeOfDay.now().format(context),
                            onPressed: () async {
                              final TimeOfDay? timeEnd = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              isar.writeTxn(() async {
                                settings.timeEnd = timeEnd?.format(context);
                                isar.settings.put(settings);
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          SettingLinks(
            icon: const Icon(
              Iconsax.d_square,
            ),
            text: 'data'.tr,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Text(
                              'data'.tr,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.sun_1,
                            ),
                            text: 'degrees'.tr,
                            dropdown: true,
                            dropdownName: settings.degrees.tr,
                            dropdownList: <String>[
                              'celsius'.tr,
                              'fahrenheit'.tr
                            ],
                            dropdownCange: (String? newValue) {
                              isar.writeTxn(() async {
                                settings.degrees = newValue == 'celsius'.tr
                                    ? 'celsius'
                                    : 'fahrenheit';
                                isar.settings.put(settings);
                              });
                              setState(() {});
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.rulerpen,
                            ),
                            text: 'measurements'.tr,
                            dropdown: true,
                            dropdownName: settings.measurements.tr,
                            dropdownList: <String>['metric'.tr, 'imperial'.tr],
                            dropdownCange: (String? newValue) {
                              isar.writeTxn(() async {
                                settings.measurements = newValue == 'metric'.tr
                                    ? 'metric'
                                    : 'imperial';
                                isar.settings.put(settings);
                              });
                              setState(() {});
                            },
                          ),
                          SettingLinks(
                            elevation: 4,
                            icon: const Icon(
                              Iconsax.clock,
                            ),
                            text: 'timeformat'.tr,
                            dropdown: true,
                            dropdownName: settings.timeformat.tr,
                            dropdownList: <String>['12'.tr, '24'.tr],
                            dropdownCange: (String? newValue) {
                              isar.writeTxn(() async {
                                settings.timeformat =
                                    newValue == '12'.tr ? '12' : '24';
                                isar.settings.put(settings);
                              });
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
          SettingLinks(
            icon: const Icon(
              Iconsax.language_square,
            ),
            text: 'language'.tr,
            info: true,
            infoSettings: true,
            textInfo: appLanguages.firstWhere(
                (element) => (element['locale'] == locale),
                orElse: () => appLanguages.first)['name'],
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
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
                                    horizontal: 15, vertical: 5),
                                child: TextButton(
                                  child: Text(
                                    appLanguages[index]['name'],
                                    style: context.textTheme.labelLarge,
                                  ),
                                  onPressed: () {
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
                  );
                },
              );
            },
          ),
          SettingLinks(
            icon: const Icon(
              Iconsax.code,
            ),
            text: 'version'.tr,
            info: true,
            textInfo: '$appVersion',
          ),
          SettingLinks(
            icon: Image.asset(
              'assets/images/github.png',
              scale: 20,
            ),
            text: '${'project'.tr} GitHub',
            onPressed: () async {
              final Uri url = Uri.parse('https://github.com/DarkMooNight/Rain');
              if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                throw Exception('Could not launch $url');
              }
            },
          ),
        ],
      ),
    );
  }
}
