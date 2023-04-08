import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/modules/about.dart';
import 'package:rain/app/widgets/setting_links.dart';
import 'package:rain/main.dart';
import 'package:rain/theme/theme_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SettingLinks(
            icon: Icon(
              Iconsax.moon,
              color: context.theme.iconTheme.color,
            ),
            text: 'theme'.tr,
            switcher: true,
            dropdown: false,
            value: Get.isDarkMode,
            onChange: (_) {
              if (Get.isDarkMode) {
                themeController.changeThemeMode(ThemeMode.light);
                themeController.saveTheme(false);
              } else {
                themeController.changeThemeMode(ThemeMode.dark);
                themeController.saveTheme(true);
              }
            },
          ),
          // SettingLinks(
          //   icon: Icon(
          //     Iconsax.notification,
          //     color: context.theme.iconTheme.color,
          //   ),
          //   text: 'notifications'.tr,
          //   switcher: true,
          //   dropdown: false,
          //   value: settings.notifications,
          //   onChange: (value) {
          //     isar.writeTxn(() async {
          //       settings.notifications = value;
          //       isar.settings.put(settings);
          //     });
          //     setState(() {});
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
            icon: Icon(
              Iconsax.sun_1,
              color: context.theme.iconTheme.color,
            ),
            text: 'degrees'.tr,
            switcher: false,
            dropdown: true,
            dropdownName: settings.degrees.tr,
            dropdownList: <String>['celsius'.tr, 'fahrenheit'.tr],
            dropdownCange: (String? newValue) {
              isar.writeTxn(() async {
                settings.degrees =
                    newValue == 'celsius'.tr ? 'celsius' : 'fahrenheit';
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
            dropdownName: settings.measurements.tr,
            dropdownList: <String>['metric'.tr, 'imperial'.tr],
            dropdownCange: (String? newValue) {
              isar.writeTxn(() async {
                settings.measurements =
                    newValue == 'metric'.tr ? 'metric' : 'imperial';
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
            dropdownName: settings.timeformat.tr,
            dropdownList: <String>['12'.tr, '24'.tr],
            dropdownCange: (String? newValue) {
              isar.writeTxn(() async {
                settings.timeformat = newValue == '12'.tr ? '12' : '24';
                isar.settings.put(settings);
              });
              setState(() {});
            },
          ),
          SettingLinks(
            icon: Icon(
              Iconsax.info_circle,
              color: context.theme.iconTheme.color,
            ),
            text: 'about'.tr,
            switcher: false,
            dropdown: false,
            onPressed: () => Get.to(() => const AboutPage(),
                transition: Transition.downToUp),
          ),
        ],
      ),
    );
  }
}
