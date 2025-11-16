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
import 'package:rain/app/ui/settings/widgets/setting_card.dart';
import 'package:rain/main.dart';
import 'package:rain/theme/theme_controller.dart';
import 'package:rain/app/utils/color_converter.dart';
import 'package:rain/app/utils/show_snack_bar.dart';
import 'package:restart_app/restart_app.dart';

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

  @override
  void initState() {
    super.initState();
    _infoVersion();
  }

  Future<void> _infoVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  void _updateLanguage(Locale locale) {
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
          _buildAppearanceCard(context),
          _buildFunctionsCard(context),
          _buildDataCard(context),
          _buildWidgetCard(context),
          _buildMapCard(context),
          _buildLanguageCard(context),
          _buildGroupsCard(context),
          _buildLicenseCard(context),
          _buildVersionCard(context),
          _buildGitHubCard(context),
          _buildOpenMeteoText(context),
        ],
      ),
    );
  }

  Widget _buildAppearanceCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.brush_1),
      text: 'appearance'.tr,
      onPressed: () {
        _showAppearanceBottomSheet(context);
      },
    );
  }

  void _showAppearanceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAppearanceTitle(context),
                    _buildThemeSettingCard(context, setState),
                    _buildAmoledThemeSettingCard(context, setState),
                    _buildMaterialColorSettingCard(context, setState),
                    _buildLargeElementSettingCard(context, setState),
                    const Gap(10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAppearanceTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'appearance'.tr,
        style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildThemeSettingCard(BuildContext context, StateSetter setState) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.moon),
      text: 'theme'.tr,
      dropdown: true,
      dropdownName: settings.theme?.tr,
      dropdownList: <String>['system'.tr, 'dark'.tr, 'light'.tr],
      dropdownChange: (String? newValue) {
        _updateTheme(newValue, context, setState);
      },
    );
  }

  void _updateTheme(
    String? newValue,
    BuildContext context,
    StateSetter setState,
  ) {
    ThemeMode themeMode = newValue?.tr == 'system'.tr
        ? ThemeMode.system
        : newValue?.tr == 'dark'.tr
        ? ThemeMode.dark
        : ThemeMode.light;
    String theme = newValue?.tr == 'system'.tr
        ? 'system'
        : newValue?.tr == 'dark'.tr
        ? 'dark'
        : 'light';
    themeController.saveTheme(theme);
    themeController.changeThemeMode(themeMode);
    setState(() {});
  }

  Widget _buildAmoledThemeSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.mobile),
      text: 'amoledTheme'.tr,
      switcher: true,
      value: settings.amoledTheme,
      onChange: (value) {
        themeController.saveOledTheme(value);
        MyApp.updateAppState(context, newAmoledTheme: value);
      },
    );
  }

  Widget _buildMaterialColorSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.colorfilter),
      text: 'materialColor'.tr,
      switcher: true,
      value: settings.materialColor,
      onChange: (value) {
        themeController.saveMaterialTheme(value);
        MyApp.updateAppState(context, newMaterialColor: value);
      },
    );
  }

  Widget _buildLargeElementSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.additem),
      text: 'largeElement'.tr,
      switcher: true,
      value: settings.largeElement,
      onChange: (value) {
        settings.largeElement = value;
        isar.writeTxnSync(() => isar.settings.putSync(settings));
        MyApp.updateAppState(context, newLargeElement: value);
        setState(() {});
      },
    );
  }

  Widget _buildFunctionsCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.code_1),
      text: 'functions'.tr,
      onPressed: () {
        _showFunctionsBottomSheet(context);
      },
    );
  }

  void _showFunctionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildFunctionsTitle(context),
                    _buildLocationSettingCard(context, setState),
                    _buildNotificationsSettingCard(context, setState),
                    _buildTimeRangeSettingCard(context, setState),
                    _buildTimeStartSettingCard(context, setState),
                    _buildTimeEndSettingCard(context, setState),
                    const Gap(10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildFunctionsTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'functions'.tr,
        style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildLocationSettingCard(BuildContext context, StateSetter setState) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.map),
      text: 'location'.tr,
      switcher: true,
      value: settings.location,
      onChange: (value) async {
        if (value) {
          bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
          if (!serviceEnabled) {
            if (!context.mounted) return;
            await _showLocationDialog(context);
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
    );
  }

  Future<void> _showLocationDialog(BuildContext context) async {
    await showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Text('location'.tr, style: context.textTheme.titleLarge),
          content: Text('no_location'.tr, style: context.textTheme.titleMedium),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: false),
              child: Text(
                'cancel'.tr,
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Geolocator.openLocationSettings();
                Get.back(result: true);
              },
              child: Text(
                'settings'.tr,
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNotificationsSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.notification_1),
      text: 'notifications'.tr,
      switcher: true,
      value: settings.notifications,
      onChange: (value) async {
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
          isar.writeTxnSync(() {
            settings.notifications = value;
            isar.settings.putSync(settings);
          });
          if (value) {
            weatherController.notification(weatherController.mainWeather);
          } else {
            flutterLocalNotificationsPlugin.cancelAll();
          }
          setState(() {});
        }
      },
    );
  }

  Widget _buildTimeRangeSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.notification_status),
      text: 'timeRange'.tr,
      dropdown: true,
      dropdownName: '$timeRange',
      dropdownList: const <String>['1', '2', '3', '4', '5'],
      dropdownChange: (String? newValue) {
        isar.writeTxnSync(() {
          settings.timeRange = int.parse(newValue!);
          isar.settings.putSync(settings);
        });
        MyApp.updateAppState(context, newTimeRange: int.parse(newValue!));
        if (settings.notifications) {
          flutterLocalNotificationsPlugin.cancelAll();
          weatherController.notification(weatherController.mainWeather);
        }
      },
    );
  }

  Widget _buildTimeStartSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.timer_start),
      text: 'timeStart'.tr,
      info: true,
      infoSettings: true,
      infoWidget: _TextInfo(info: weatherController.formatTime(timeStart)),
      onPressed: () async {
        final TimeOfDay? timeStartPicker = await showTimePicker(
          context: context,
          initialTime: weatherController.parseTime(timeStart),
          builder: (context, child) {
            final Widget mediaQueryWrapper = MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: settings.timeformat == '12'
                    ? false
                    : true,
              ),
              child: child!,
            );
            return mediaQueryWrapper;
          },
        );
        if (timeStartPicker != null) {
          final String time24h = weatherController.timeTo24h(timeStartPicker);
          isar.writeTxnSync(() {
            settings.timeStart = time24h;
            isar.settings.putSync(settings);
          });
          if (!context.mounted) return;
          MyApp.updateAppState(context, newTimeStart: time24h);
          if (settings.notifications) {
            flutterLocalNotificationsPlugin.cancelAll();
            weatherController.notification(weatherController.mainWeather);
          }
          setState(() {});
        }
      },
    );
  }

  Widget _buildTimeEndSettingCard(BuildContext context, StateSetter setState) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.timer_pause),
      text: 'timeEnd'.tr,
      info: true,
      infoSettings: true,
      infoWidget: _TextInfo(info: weatherController.formatTime(timeEnd)),
      onPressed: () async {
        final TimeOfDay? timeEndPicker = await showTimePicker(
          context: context,
          initialTime: weatherController.parseTime(timeEnd),
          builder: (context, child) {
            final Widget mediaQueryWrapper = MediaQuery(
              data: MediaQuery.of(context).copyWith(
                alwaysUse24HourFormat: settings.timeformat == '12'
                    ? false
                    : true,
              ),
              child: child!,
            );
            return mediaQueryWrapper;
          },
        );
        if (timeEndPicker != null) {
          final String time24h = weatherController.timeTo24h(timeEndPicker);
          isar.writeTxnSync(() {
            settings.timeEnd = time24h;
            isar.settings.putSync(settings);
          });
          if (!context.mounted) return;
          MyApp.updateAppState(context, newTimeEnd: time24h);
          if (settings.notifications) {
            flutterLocalNotificationsPlugin.cancelAll();
            weatherController.notification(weatherController.mainWeather);
          }
          setState(() {});
        }
      },
    );
  }

  Widget _buildDataCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.d_square),
      text: 'data'.tr,
      onPressed: () {
        _showDataBottomSheet(context);
      },
    );
  }

  void _showDataBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDataTitle(context),
                    _buildRoundDegreeSettingCard(context, setState),
                    _buildDegreesSettingCard(context, setState),
                    _buildMeasurementsSettingCard(context, setState),
                    _buildWindSettingCard(context, setState),
                    _buildPressureSettingCard(context, setState),
                    _buildTimeFormatSettingCard(context, setState),
                    const Gap(10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDataTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'data'.tr,
        style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildRoundDegreeSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.cloud_notif),
      text: 'roundDegree'.tr,
      switcher: true,
      value: settings.roundDegree,
      onChange: (value) {
        settings.roundDegree = value;
        isar.writeTxnSync(() => isar.settings.putSync(settings));
        MyApp.updateAppState(context, newRoundDegree: value);
        setState(() {});
      },
    );
  }

  Widget _buildDegreesSettingCard(BuildContext context, StateSetter setState) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.sun_1),
      text: 'degrees'.tr,
      dropdown: true,
      dropdownName: settings.degrees.tr,
      dropdownList: <String>['celsius'.tr, 'fahrenheit'.tr],
      dropdownChange: (String? newValue) async {
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
    );
  }

  Widget _buildMeasurementsSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.rulerpen),
      text: 'measurements'.tr,
      dropdown: true,
      dropdownName: settings.measurements.tr,
      dropdownList: <String>['metric'.tr, 'imperial'.tr],
      dropdownChange: (String? newValue) async {
        isar.writeTxnSync(() {
          settings.measurements = newValue == 'metric'.tr
              ? 'metric'
              : 'imperial';
          isar.settings.putSync(settings);
        });
        await weatherController.deleteAll(false);
        await weatherController.setLocation();
        await weatherController.updateCacheCard(true);
        setState(() {});
      },
    );
  }

  Widget _buildWindSettingCard(BuildContext context, StateSetter setState) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.wind),
      text: 'wind'.tr,
      dropdown: true,
      dropdownName: settings.wind.tr,
      dropdownList: <String>['kph'.tr, 'm/s'.tr],
      dropdownChange: (String? newValue) async {
        isar.writeTxnSync(() {
          settings.wind = newValue == 'kph'.tr ? 'kph' : 'm/s';
          isar.settings.putSync(settings);
        });
        setState(() {});
      },
    );
  }

  Widget _buildPressureSettingCard(BuildContext context, StateSetter setState) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.ruler),
      text: 'pressure'.tr,
      dropdown: true,
      dropdownName: settings.pressure.tr,
      dropdownList: <String>['hPa'.tr, 'mmHg'.tr],
      dropdownChange: (String? newValue) async {
        isar.writeTxnSync(() {
          settings.pressure = newValue == 'hPa'.tr ? 'hPa' : 'mmHg';
          isar.settings.putSync(settings);
        });
        setState(() {});
      },
    );
  }

  Widget _buildTimeFormatSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.clock_1),
      text: 'timeformat'.tr,
      dropdown: true,
      dropdownName: settings.timeformat.tr,
      dropdownList: <String>['12'.tr, '24'.tr],
      dropdownChange: (String? newValue) {
        isar.writeTxnSync(() {
          settings.timeformat = newValue == '12'.tr ? '12' : '24';
          isar.settings.putSync(settings);
        });
        setState(() {});
      },
    );
  }

  Widget _buildWidgetCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.setting_3),
      text: 'widget'.tr,
      onPressed: () {
        _showWidgetBottomSheet(context);
      },
    );
  }

  void _showWidgetBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildWidgetTitle(context),
                    _buildAddWidgetSettingCard(context, setState),
                    _buildWidgetBackgroundSettingCard(context, setState),
                    _buildWidgetTextSettingCard(context, setState),
                    const Gap(10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildWidgetTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'widget'.tr,
        style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildAddWidgetSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.add_square),
      text: 'addWidget'.tr,
      onPressed: () async {
        if (!Platform.isAndroid) return;

        final supported =
            await HomeWidget.isRequestPinWidgetSupported() ?? false;
        if (!supported) {
          showSnackBar(content: 'addWidgetLauncher'.tr);
          return;
        }

        await HomeWidget.requestPinWidget(
          name: androidWidgetName,
          androidName: androidWidgetName,
          qualifiedAndroidName: 'com.yoshi.rain.OreoWidget',
        );
      },
    );
  }

  Widget _buildWidgetBackgroundSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.bucket_square),
      text: 'widgetBackground'.tr,
      info: true,
      infoWidget: CircleAvatar(
        backgroundColor: context.theme.dividerColor,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildWidgetBackgroundTitle(context),
                  _buildColorPicker(context),
                  _buildColorPickerButton(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWidgetBackgroundTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'widgetBackground'.tr,
        style: context.textTheme.titleMedium?.copyWith(fontSize: 18),
      ),
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Theme(
        data: context.theme.copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        child: ColorPicker(
          color: widgetBackgroundColor.isEmpty
              ? context.theme.primaryColor
              : HexColor.fromHex(widgetBackgroundColor),
          onChanged: (pickedColor) {
            colorBackground = pickedColor.toHex();
          },
        ),
      ),
    );
  }

  Widget _buildColorPickerButton(BuildContext context) {
    return IconButton(
      icon: const Icon(IconsaxPlusLinear.tick_square),
      onPressed: () {
        if (colorBackground == null) {
          return;
        }
        weatherController.updateWidgetBackgroundColor(colorBackground!);
        MyApp.updateAppState(
          context,
          newWidgetBackgroundColor: colorBackground,
        );
        Get.back();
      },
    );
  }

  Widget _buildWidgetTextSettingCard(
    BuildContext context,
    StateSetter setState,
  ) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.text_block),
      text: 'widgetText'.tr,
      info: true,
      infoWidget: CircleAvatar(
        backgroundColor: context.theme.dividerColor,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildWidgetTextTitle(context),
                  _buildTextColorPicker(context),
                  _buildTextColorPickerButton(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWidgetTextTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'widgetText'.tr,
        style: context.textTheme.titleMedium?.copyWith(fontSize: 18),
      ),
    );
  }

  Widget _buildTextColorPicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Theme(
        data: context.theme.copyWith(
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        child: ColorPicker(
          color: widgetTextColor.isEmpty
              ? context.theme.primaryColor
              : HexColor.fromHex(widgetTextColor),
          onChanged: (pickedColor) {
            colorText = pickedColor.toHex();
          },
        ),
      ),
    );
  }

  Widget _buildTextColorPickerButton(BuildContext context) {
    return IconButton(
      icon: const Icon(IconsaxPlusLinear.tick_square),
      onPressed: () {
        if (colorText == null) {
          return;
        }
        weatherController.updateWidgetTextColor(colorText!);
        MyApp.updateAppState(context, newWidgetTextColor: colorText);
        Get.back();
      },
    );
  }

  Widget _buildMapCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.map),
      text: 'map'.tr,
      onPressed: () {
        _showMapBottomSheet(context);
      },
    );
  }

  void _showMapBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMapTitle(context),
                    _buildHideMapSettingCard(context, setState),
                    _buildClearCacheStoreSettingCard(context),
                    const Gap(10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildMapTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'map'.tr,
        style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildHideMapSettingCard(BuildContext context, StateSetter setState) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.location_slash),
      text: 'hideMap'.tr,
      switcher: true,
      value: settings.hideMap,
      onChange: (value) {
        settings.hideMap = value;
        isar.writeTxnSync(() => isar.settings.putSync(settings));
        setState(() {});
        Future.delayed(
          const Duration(milliseconds: 500),
          () => Restart.restartApp(),
        );
      },
    );
  }

  Widget _buildClearCacheStoreSettingCard(BuildContext context) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(IconsaxPlusLinear.trash_square),
      text: 'clearCacheStore'.tr,
      onPressed: () => _showClearCacheStoreDialog(context),
    );
  }

  void _showClearCacheStoreDialog(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text(
          'deletedCacheStore'.tr,
          style: context.textTheme.titleLarge,
        ),
        content: Text(
          'deletedCacheStoreQuery'.tr,
          style: context.textTheme.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'cancel'.tr,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.blueAccent,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              final dir = await getTemporaryDirectory();
              final cacheStoreFuture = FileCacheStore(
                '${dir.path}${Platform.pathSeparator}MapTiles',
              );
              cacheStoreFuture.clean();
              Get.back();
            },
            child: Text(
              'delete'.tr,
              style: context.textTheme.titleMedium?.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.language_square),
      text: 'language'.tr,
      info: true,
      infoSettings: true,
      infoWidget: _TextInfo(
        info: appLanguages.firstWhere(
          (element) => (element['locale'] == locale),
          orElse: () => {'name': ''},
        )['name'],
      ),
      onPressed: () {
        _showLanguageBottomSheet(context);
      },
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return ListView(
                children: [
                  _buildLanguageTitle(context),
                  _buildLanguageList(context),
                  const Gap(10),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLanguageTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'language'.tr,
        style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildLanguageList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: appLanguages.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            title: Text(
              appLanguages[index]['name'],
              style: context.textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            onTap: () {
              MyApp.updateAppState(
                context,
                newLocale: appLanguages[index]['locale'],
              );
              _updateLanguage(appLanguages[index]['locale']);
            },
          ),
        );
      },
    );
  }

  Widget _buildGroupsCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.link_square),
      text: 'groups'.tr,
      onPressed: () {
        _showGroupsBottomSheet(context);
      },
    );
  }

  void _showGroupsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildGroupsTitle(context),
                    _buildDiscordSettingCard(context),
                    _buildTelegramSettingCard(context),
                    const Gap(10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildGroupsTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        'groups'.tr,
        style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildDiscordSettingCard(BuildContext context) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(LineAwesomeIcons.discord),
      text: 'Discord',
      onPressed: () =>
          weatherController.urlLauncher('https://discord.gg/JMMa9aHh8f'),
    );
  }

  Widget _buildTelegramSettingCard(BuildContext context) {
    return SettingCard(
      elevation: 4,
      icon: const Icon(LineAwesomeIcons.telegram),
      text: 'Telegram',
      onPressed: () =>
          weatherController.urlLauncher('https://t.me/darkmoonightX'),
    );
  }

  Widget _buildLicenseCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.document),
      text: 'license'.tr,
      onPressed: () => Get.to(
        () => LicensePage(
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
    );
  }

  Widget _buildVersionCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(IconsaxPlusLinear.hierarchy_square_2),
      text: 'version'.tr,
      info: true,
      infoWidget: _TextInfo(info: '$appVersion'),
    );
  }

  Widget _buildGitHubCard(BuildContext context) {
    return SettingCard(
      icon: const Icon(LineAwesomeIcons.github),
      text: '${'project'.tr} GitHub',
      onPressed: () =>
          weatherController.urlLauncher('https://github.com/darkmoonight/Rain'),
    );
  }

  Widget _buildOpenMeteoText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        child: Text(
          'openMeteo'.tr,
          style: context.textTheme.bodyMedium,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
        ),
        onTap: () => weatherController.urlLauncher('https://open-meteo.com/'),
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
