import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:package_info_plus/package_info_plus.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SettingLinks(
            icon: Icon(
              Iconsax.color_swatch,
              color: context.theme.iconTheme.color,
            ),
            text: 'appearance'.tr,
            switcher: false,
            dropdown: false,
            info: false,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Container(
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondaryContainer,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Text(
                                'appearance'.tr,
                                style: context.theme.textTheme.titleLarge,
                              ),
                            ),
                            SettingLinks(
                              icon: Icon(
                                Iconsax.moon,
                                color: context.theme.iconTheme.color,
                              ),
                              text: 'theme'.tr,
                              switcher: true,
                              dropdown: false,
                              info: false,
                              value: Get.isDarkMode,
                              onChange: (_) {
                                if (Get.isDarkMode) {
                                  themeController
                                      .changeThemeMode(ThemeMode.light);
                                  themeController.saveTheme(false);
                                } else {
                                  themeController
                                      .changeThemeMode(ThemeMode.dark);
                                  themeController.saveTheme(true);
                                }
                              },
                            ),
                            SettingLinks(
                              icon: Icon(
                                Iconsax.mobile,
                                color: context.theme.iconTheme.color,
                              ),
                              text: 'amoledTheme'.tr,
                              switcher: true,
                              dropdown: false,
                              info: false,
                              value: settings.amoledTheme,
                              onChange: (value) {
                                themeController.saveOledTheme(value);
                                MyApp.updateAppState(context,
                                    newAmoledTheme: value);
                              },
                            ),
                            // SettingLinks(
                            //   icon: Icon(
                            //     Iconsax.colorfilter,
                            //     color: context.theme.iconTheme.color,
                            //   ),
                            //   text: 'materialColor'.tr,
                            //   switcher: true,
                            //   dropdown: false,
                            //   info: false,
                            //   value: settings.materialColor,
                            //   onChange: (value) {
                            //     isar.writeTxn(() async {
                            //       settings.materialColor = value;
                            //       isar.settings.put(settings);
                            //     });
                            //     setState(() {});
                            //   },
                            // ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          SettingLinks(
            icon: Icon(
              Iconsax.code,
              color: context.theme.iconTheme.color,
            ),
            text: 'functions'.tr,
            switcher: false,
            dropdown: false,
            info: false,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Container(
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondaryContainer,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Text(
                                'functions'.tr,
                                style: context.theme.textTheme.titleLarge,
                              ),
                            ),
                            // SettingLinks(
                            //   icon: Icon(
                            //     Iconsax.notification,
                            //     color: context.theme.iconTheme.color,
                            //   ),
                            //   text: 'notifications'.tr,
                            //   switcher: true,
                            //   dropdown: false,
                            //   info: false,
                            //   value: settings.notifications,
                            //   onChange: (value) async {
                            //     final result = await flutterLocalNotificationsPlugin
                            //         .resolvePlatformSpecificImplementation<
                            //             AndroidFlutterLocalNotificationsPlugin>()
                            //         ?.requestPermission();
                            //     if (result!) {
                            //       isar.writeTxn(() async {
                            //         settings.notifications = value;
                            //         isar.settings.put(settings);
                            //       });
                            //       flutterLocalNotificationsPlugin.cancelAll();
                            //       setState(() {});
                            //     }
                            //   },
                            // ),
                            SettingLinks(
                              icon: Icon(
                                Iconsax.location,
                                color: context.theme.iconTheme.color,
                              ),
                              text: 'location'.tr,
                              switcher: true,
                              dropdown: false,
                              info: false,
                              value: settings.location,
                              onChange: (value) {
                                isar.writeTxn(() async {
                                  settings.location = value;
                                  isar.settings.put(settings);
                                });
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          SettingLinks(
            icon: Icon(
              Iconsax.box_1,
              color: context.theme.iconTheme.color,
            ),
            text: 'data'.tr,
            switcher: false,
            dropdown: false,
            info: false,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Container(
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.secondaryContainer,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Text(
                                'data'.tr,
                                style: context.theme.textTheme.titleLarge,
                              ),
                            ),
                            SettingLinks(
                              icon: Icon(
                                Iconsax.sun_1,
                                color: context.theme.iconTheme.color,
                              ),
                              text: 'degrees'.tr,
                              switcher: false,
                              dropdown: true,
                              info: false,
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
                              icon: Icon(
                                Iconsax.rulerpen,
                                color: context.theme.iconTheme.color,
                              ),
                              text: 'measurements'.tr,
                              switcher: false,
                              dropdown: true,
                              info: false,
                              dropdownName: settings.measurements.tr,
                              dropdownList: <String>[
                                'metric'.tr,
                                'imperial'.tr
                              ],
                              dropdownCange: (String? newValue) {
                                isar.writeTxn(() async {
                                  settings.measurements =
                                      newValue == 'metric'.tr
                                          ? 'metric'
                                          : 'imperial';
                                  isar.settings.put(settings);
                                });
                                setState(() {});
                              },
                            ),
                            SettingLinks(
                              icon: Icon(
                                Iconsax.clock,
                                color: context.theme.iconTheme.color,
                              ),
                              text: 'timeformat'.tr,
                              switcher: false,
                              dropdown: true,
                              info: false,
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
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
          SettingLinks(
            icon: Icon(
              Iconsax.language_square,
              color: context.theme.iconTheme.color,
            ),
            text: 'language'.tr,
            switcher: false,
            dropdown: false,
            info: true,
            textInfo: '',
            onPressed: () {},
          ),
          SettingLinks(
            icon: Icon(
              Iconsax.code,
              color: context.theme.iconTheme.color,
            ),
            text: 'version'.tr,
            switcher: false,
            dropdown: false,
            info: true,
            textInfo: '$appVersion',
          ),
          SettingLinks(
            icon: Image.asset(
              'assets/images/github.png',
              scale: 20,
            ),
            text: '${'project'.tr} GitHub',
            switcher: false,
            dropdown: false,
            info: false,
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
