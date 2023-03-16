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
    return Column(
      children: [
        SettingLinks(
          icon: Icon(
            Iconsax.moon,
            color: context.theme.iconTheme.color,
          ),
          text: 'theme'.tr,
          switcher: true,
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
        SettingLinks(
          icon: Icon(
            Iconsax.location,
            color: context.theme.iconTheme.color,
          ),
          text: 'Местоположение',
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
          icon: Icon(
            Iconsax.info_circle,
            color: context.theme.iconTheme.color,
          ),
          text: 'about'.tr,
          switcher: false,
          onPressed: () =>
              Get.to(() => const AboutPage(), transition: Transition.downToUp),
        ),
      ],
    );
  }
}
