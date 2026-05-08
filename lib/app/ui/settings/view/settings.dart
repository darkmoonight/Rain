import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/data/db.dart';
import 'package:rain/app/ui/settings/widgets/selection_dialog.dart';
import 'package:rain/app/ui/settings/widgets/settings_section.dart';
import 'package:rain/app/ui/settings/widgets/settings_tile.dart';
import 'package:rain/app/ui/widgets/confirmation_dialog.dart';
import 'package:rain/app/utils/navigation_helper.dart';
import 'package:rain/main.dart';
import 'package:rain/theme/theme_controller.dart';
import 'package:rain/app/utils/color_converter.dart';
import 'package:restart_app/restart_app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final themeController = Get.put(ThemeController());
  final weatherController = Get.find<WeatherController>();
  String? appVersion;
  String? colorBackground;
  String? colorText;

  @override
  void initState() {
    super.initState();
    _infoVersion();
  }

  Future<void> _infoVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() => appVersion = packageInfo.version);
  }

  String _safeFormatTime(String? timeStr) {
    try {
      return weatherController.formatTime(timeStr);
    } catch (e) {
      return '--:--';
    }
  }

  Future<void> _updateLanguage(Locale locale) async {
    settings.language = '$locale';
    await isar.writeTxn(() => isar.settings.put(settings));
    Get.updateLocale(locale);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppearanceSection(context),
            const Gap(24),
            _buildFunctionsSection(context),
            const Gap(24),
            _buildDataSection(context),
            const Gap(24),
            _buildWidgetSection(context),
            const Gap(24),
            _buildMapSection(context),
            const Gap(24),
            _buildLanguageSection(context),
            const Gap(24),
            _buildGroupsSection(context),
            const Gap(24),
            _buildAboutSection(context),
            const Gap(16),
            _buildOpenMeteoText(context),
            const Gap(16),
          ],
        ),
      ),
    );
  }

  // ==================== SECTIONS ====================

  Widget _buildAppearanceSection(BuildContext context) {
    return SettingsSection(
      title: 'appearance',
      icon: IconsaxPlusBold.brush_1,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.moon),
          title: 'theme',
          value: settings.theme?.tr ?? 'system'.tr,
          onTap: () => _showThemeDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.mobile),
          title: 'amoledTheme',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.amoledTheme,
              onChanged: (value) async {
                await themeController.saveOledTheme(value);
                if (!mounted) return;
                MyApp.updateAppState(this.context, newAmoledTheme: value);
                setState(() {});
              },
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.colorfilter),
          title: 'materialColor',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.materialColor,
              onChanged: (value) async {
                await themeController.saveMaterialTheme(value);
                if (!mounted) return;
                MyApp.updateAppState(this.context, newMaterialColor: value);
                setState(() {});
              },
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.additem),
          title: 'largeElement',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.largeElement,
              onChanged: (value) async {
                settings.largeElement = value;
                await isar.writeTxn(() => isar.settings.put(settings));
                if (!mounted) return;
                MyApp.updateAppState(this.context, newLargeElement: value);
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFunctionsSection(BuildContext context) {
    return SettingsSection(
      title: 'functions',
      icon: IconsaxPlusBold.code_1,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.map),
          title: 'location',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.location,
              onChanged: (value) => _onLocationChanged(value, context),
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.notification_1),
          title: 'notifications',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.notifications,
              onChanged: (value) => _onNotificationsChanged(value),
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.notification_status),
          title: 'timeRange',
          value: '$timeRange',
          onTap: () => _showTimeRangeDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.timer_start),
          title: 'timeStart',
          value: _safeFormatTime(timeStart),
          onTap: () => _showTimeStartPicker(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.timer_pause),
          title: 'timeEnd',
          value: _safeFormatTime(timeEnd),
          onTap: () => _showTimeEndPicker(context),
        ),
      ],
    );
  }

  Widget _buildDataSection(BuildContext context) {
    return SettingsSection(
      title: 'data',
      icon: IconsaxPlusBold.d_square,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.cloud_notif),
          title: 'roundDegree',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.roundDegree,
              onChanged: (value) async {
                settings.roundDegree = value;
                await isar.writeTxn(() => isar.settings.put(settings));
                if (!mounted) return;
                MyApp.updateAppState(this.context, newRoundDegree: value);
                setState(() {});
              },
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.sun_1),
          title: 'degrees',
          value: settings.degrees.tr,
          onTap: () => _showDegreesDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.rulerpen),
          title: 'measurements',
          value: settings.measurements.tr,
          onTap: () => _showMeasurementsDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.wind),
          title: 'wind',
          value: settings.wind.tr,
          onTap: () => _showWindDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.ruler),
          title: 'pressure',
          value: settings.pressure.tr,
          onTap: () => _showPressureDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.clock_1),
          title: 'timeformat',
          value: settings.timeformat.tr,
          onTap: () => _showTimeFormatDialog(context),
        ),
      ],
    );
  }

  Widget _buildWidgetSection(BuildContext context) {
    return SettingsSection(
      title: 'widget',
      icon: IconsaxPlusBold.setting_3,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.add_square),
          title: 'addWidget',
          onTap: () => _requestPinWidget(),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.bucket_square),
          title: 'widgetBackground',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).dividerColor,
                radius: 11,
                child: CircleAvatar(
                  backgroundColor: widgetBackgroundColor.isEmpty
                      ? Theme.of(context).primaryColor
                      : HexColor.fromHex(widgetBackgroundColor),
                  radius: 10,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                IconsaxPlusLinear.arrow_right_3,
                size: 20,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          onTap: () => _showBackgroundPicker(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.text_block),
          title: 'widgetText',
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).dividerColor,
                radius: 11,
                child: CircleAvatar(
                  backgroundColor: widgetTextColor.isEmpty
                      ? Theme.of(context).primaryColor
                      : HexColor.fromHex(widgetTextColor),
                  radius: 10,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                IconsaxPlusLinear.arrow_right_3,
                size: 20,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          onTap: () => _showTextColorPicker(context),
        ),
      ],
    );
  }

  Widget _buildMapSection(BuildContext context) {
    return SettingsSection(
      title: 'map',
      icon: IconsaxPlusBold.map,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.location_slash),
          title: 'hideMap',
          trailing: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: settings.hideMap,
              onChanged: (value) async {
                settings.hideMap = value;
                await isar.writeTxn(() => isar.settings.put(settings));
                if (!mounted) return;
                setState(() {});
                Future.delayed(
                  const Duration(milliseconds: 500),
                  () => Restart.restartApp(),
                );
              },
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.trash_square),
          title: 'clearCacheStore',
          onTap: () => _showClearCacheDialog(context),
        ),
      ],
    );
  }

  Widget _buildLanguageSection(BuildContext context) {
    final currentLanguage = appLanguages.firstWhere(
      (element) => (element['locale'] == locale),
      orElse: () => {'name': ''},
    )['name'];

    return SettingsSection(
      title: 'language',
      icon: IconsaxPlusBold.language_square,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.language_square),
          title: 'language',
          value: currentLanguage,
          onTap: () => _showLanguageDialog(context),
        ),
      ],
    );
  }

  Widget _buildGroupsSection(BuildContext context) {
    return SettingsSection(
      title: 'groups',
      icon: IconsaxPlusBold.link_square,
      children: [
        SettingsTile(
          leading: const Icon(LineAwesomeIcons.discord),
          title: 'discord'.tr,
          onTap: () =>
              weatherController.urlLauncher('https://discord.gg/JMMa9aHh8f'),
        ),
        SettingsTile(
          leading: const Icon(LineAwesomeIcons.telegram),
          title: 'telegram'.tr,
          onTap: () =>
              weatherController.urlLauncher('https://t.me/darkmoonightX'),
        ),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return SettingsSection(
      title: 'aboutApp',
      icon: IconsaxPlusBold.info_circle,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.document_text),
          title: 'license',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => LicensePage(
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
              ),
            );
          },
        ),
        SettingsTile(
          leading: const Icon(LineAwesomeIcons.github),
          title: '${'project'.tr} GitHub',
          onTap: () => weatherController.urlLauncher(
            'https://github.com/darkmoonight/Rain',
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.hierarchy_square_2),
          title: 'version',
          value: appVersion ?? '...',
        ),
      ],
    );
  }

  // ==================== DIALOGS ====================

  void _showThemeDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'theme'.tr,
      icon: IconsaxPlusBold.moon,
      items: ['system', 'dark', 'light'],
      currentValue: settings.theme ?? 'system',
      itemBuilder: (theme) => theme.tr,
      onSelected: (value) async {
        ThemeMode mode = value == 'system'
            ? ThemeMode.system
            : value == 'dark'
            ? ThemeMode.dark
            : ThemeMode.light;
        await themeController.saveTheme(value);
        themeController.changeThemeMode(mode);
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  void _showTimeRangeDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'timeRange'.tr,
      icon: IconsaxPlusLinear.notification_status,
      items: const ['1', '2', '3', '4', '5'],
      currentValue: '$timeRange',
      itemBuilder: (value) => value,
      onSelected: (value) async {
        settings.timeRange = int.parse(value);
        await isar.writeTxn(() => isar.settings.put(settings));
        if (!mounted) return;
        MyApp.updateAppState(this.context, newTimeRange: int.parse(value));
        if (settings.notifications) {
          flutterLocalNotificationsPlugin.cancelAll();
          weatherController.notification(weatherController.mainWeather);
        }
        setState(() {});
      },
    );
  }

  void _showDegreesDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'degrees'.tr,
      icon: IconsaxPlusLinear.sun_1,
      items: ['celsius', 'fahrenheit'],
      currentValue: settings.degrees,
      itemBuilder: (value) => value.tr,
      onSelected: (value) async {
        settings.degrees = value;
        await isar.writeTxn(() => isar.settings.put(settings));
        await weatherController.deleteAll(false);
        await weatherController.setLocation();
        await weatherController.updateCacheCard(true);
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  void _showMeasurementsDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'measurements'.tr,
      icon: IconsaxPlusLinear.rulerpen,
      items: ['metric', 'imperial'],
      currentValue: settings.measurements,
      itemBuilder: (value) => value.tr,
      onSelected: (value) async {
        settings.measurements = value;
        await isar.writeTxn(() => isar.settings.put(settings));
        await weatherController.deleteAll(false);
        await weatherController.setLocation();
        await weatherController.updateCacheCard(true);
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  void _showWindDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'wind'.tr,
      icon: IconsaxPlusLinear.wind,
      items: ['kph', 'm/s'],
      currentValue: settings.wind,
      itemBuilder: (value) => value.tr,
      onSelected: (value) async {
        settings.wind = value;
        await isar.writeTxn(() => isar.settings.put(settings));
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  void _showPressureDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'pressure'.tr,
      icon: IconsaxPlusLinear.ruler,
      items: ['hPa', 'mmHg'],
      currentValue: settings.pressure,
      itemBuilder: (value) => value.tr,
      onSelected: (value) async {
        settings.pressure = value;
        await isar.writeTxn(() => isar.settings.put(settings));
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  void _showTimeFormatDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'timeformat'.tr,
      icon: IconsaxPlusLinear.clock_1,
      items: ['12', '24'],
      currentValue: settings.timeformat,
      itemBuilder: (value) => value.tr,
      onSelected: (value) async {
        settings.timeformat = value;
        await isar.writeTxn(() => isar.settings.put(settings));
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showSelectionDialog<Map<String, dynamic>>(
      context: context,
      title: 'language'.tr,
      icon: IconsaxPlusLinear.language_square,
      items: appLanguages,
      currentValue: appLanguages.firstWhere(
        (element) =>
            (element['locale'] as Locale).languageCode == locale.languageCode,
        orElse: () => <String, dynamic>{
          'name': 'English',
          'locale': const Locale('en', 'US'),
        },
      ),
      itemBuilder: (lang) => lang['name'] as String,
      onSelected: (value) {
        MyApp.updateAppState(context, newLocale: value['locale']);
        _updateLanguage(value['locale']);
      },
      enableSearch: true,
    );
  }

  Future<void> _onLocationChanged(bool value, BuildContext context) async {
    if (value) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        await _showLocationDialog(context);
        return;
      }
      weatherController.getCurrentLocation();
    }
    settings.location = value;
    await isar.writeTxn(() => isar.settings.put(settings));
    if (!mounted) return;
    setState(() {});
  }

  Future<bool> _showLocationDialog(BuildContext context) async {
    return showConfirmationDialog(
      context: context,
      title: 'location'.tr,
      message: 'no_location'.tr,
      icon: IconsaxPlusBold.location,
      confirmText: 'settings'.tr,
      onConfirm: () => Geolocator.openLocationSettings(),
    );
  }

  void _onNotificationsChanged(bool value) async {
    final resultExact = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestExactAlarmsPermission();
    final result = Platform.isIOS
        ? await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin
              >()
              ?.requestPermissions()
        : await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.requestNotificationsPermission();
    if (result != null && resultExact != null) {
      settings.notifications = value;
      await isar.writeTxn(() => isar.settings.put(settings));
      if (value) {
        weatherController.notification(weatherController.mainWeather);
      } else {
        flutterLocalNotificationsPlugin.cancelAll();
      }
      if (!mounted) return;
      setState(() {});
    }
  }

  Future<void> _showTimeStartPicker(BuildContext context) async {
    final TimeOfDay? timeStartPicker = await showTimePicker(
      context: context,
      initialTime: weatherController.parseTime(timeStart),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: settings.timeformat == '12' ? false : true,
          ),
          child: child!,
        );
      },
    );
    if (timeStartPicker != null) {
      final String time24h = weatherController.timeTo24h(timeStartPicker);
      settings.timeStart = time24h;
      await isar.writeTxn(() => isar.settings.put(settings));
      if (!mounted) return;
      MyApp.updateAppState(this.context, newTimeStart: time24h);
      if (settings.notifications) {
        flutterLocalNotificationsPlugin.cancelAll();
        weatherController.notification(weatherController.mainWeather);
      }
      setState(() {});
    }
  }

  Future<void> _showTimeEndPicker(BuildContext context) async {
    final TimeOfDay? timeEndPicker = await showTimePicker(
      context: context,
      initialTime: weatherController.parseTime(timeEnd),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: settings.timeformat == '12' ? false : true,
          ),
          child: child!,
        );
      },
    );
    if (timeEndPicker != null) {
      final String time24h = weatherController.timeTo24h(timeEndPicker);
      settings.timeEnd = time24h;
      await isar.writeTxn(() => isar.settings.put(settings));
      if (!mounted) return;
      MyApp.updateAppState(this.context, newTimeEnd: time24h);
      if (settings.notifications) {
        flutterLocalNotificationsPlugin.cancelAll();
        weatherController.notification(weatherController.mainWeather);
      }
      setState(() {});
    }
  }

  Future<void> _requestPinWidget() async {
    if (!Platform.isAndroid) return;

    final supported = await HomeWidget.isRequestPinWidgetSupported() ?? false;
    if (!supported) {
      return;
    }

    await HomeWidget.requestPinWidget(
      name: androidWidgetName,
      androidName: androidWidgetName,
      qualifiedAndroidName: 'com.yoshi.rain.OreoWidget',
    );
  }

  void _showBackgroundPicker(BuildContext context) {
    colorBackground = null;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'widgetBackground'.tr,
                  style: context.textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Theme(
                  data: context.theme.copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: ColorPicker(
                    color: widgetBackgroundColor.isEmpty
                        ? context.theme.primaryColor
                        : HexColor.fromHex(widgetBackgroundColor),
                    onChanged: (pickedColor) =>
                        colorBackground = pickedColor.toHex(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.rotate_left),
                    tooltip: 'resetColor'.tr,
                    onPressed: () {
                      weatherController.resetWidgetBackgroundColor();
                      MyApp.updateAppState(
                        context,
                        newWidgetBackgroundColor: '',
                      );
                      NavigationHelper.back();
                    },
                  ),
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.tick_square),
                    onPressed: () {
                      if (colorBackground == null) return;
                      weatherController.updateWidgetBackgroundColor(
                        colorBackground!,
                      );
                      MyApp.updateAppState(
                        context,
                        newWidgetBackgroundColor: colorBackground,
                      );
                      NavigationHelper.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTextColorPicker(BuildContext context) {
    colorText = null;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'widgetText'.tr,
                  style: context.textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Theme(
                  data: context.theme.copyWith(
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: ColorPicker(
                    color: widgetTextColor.isEmpty
                        ? context.theme.primaryColor
                        : HexColor.fromHex(widgetTextColor),
                    onChanged: (pickedColor) => colorText = pickedColor.toHex(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.rotate_left),
                    tooltip: 'resetColor'.tr,
                    onPressed: () {
                      weatherController.resetWidgetTextColor();
                      MyApp.updateAppState(context, newWidgetTextColor: '');
                      NavigationHelper.back();
                    },
                  ),
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.tick_square),
                    onPressed: () {
                      if (colorText == null) return;
                      weatherController.updateWidgetTextColor(colorText!);
                      MyApp.updateAppState(
                        context,
                        newWidgetTextColor: colorText,
                      );
                      NavigationHelper.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showConfirmationDialog(
      context: context,
      title: 'deletedCacheStore'.tr,
      message: 'deletedCacheStoreQuery'.tr,
      icon: IconsaxPlusBold.trash,
      confirmText: 'delete'.tr,
      isDestructive: true,
      onConfirm: () async {
        final dir = await getTemporaryDirectory();
        final cacheStore = FileCacheStore(
          '${dir.path}${Platform.pathSeparator}MapTiles',
        );
        cacheStore.clean();
      },
    );
  }

  // ==================== WIDGETS ====================

  Widget _buildOpenMeteoText(BuildContext context) => GestureDetector(
    child: Center(
      child: Text(
        'openMeteo'.tr,
        style: context.textTheme.bodyMedium,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
      ),
    ),
    onTap: () => weatherController.urlLauncher('https://open-meteo.com/'),
  );
}
