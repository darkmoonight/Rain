import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/settings/presentation/widgets/selection_dialog.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/core/utils/app_time_picker.dart';
import 'package:rain/core/bootstrap/app_initializer.dart';
import 'package:rain/core/config/app_config.dart';
import 'package:rain/features/settings/presentation/view/widget_settings_page.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/utils/url_launcher_util.dart';
import 'package:restart_app/restart_app.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  String? appVersion;
  Settings get settings => ref.watch(settingsProvider);
  AppSettingsState get appSettings => ref.watch(appSettingsProvider);
  Locale get locale => ref.watch(localeProvider);

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
    if (timeStr == null || timeStr.isEmpty) return '--:--';
    ref.watch(settingsRevisionProvider);
    return TimeIndexHelper.formatTime(
      timeStr,
      ref.watch(settingsProvider),
      ref.watch(localeProvider).languageCode,
    );
  }

  Future<void> _refreshWidgets() async {
    if (!Platform.isAndroid) return;
    await ref
        .read(homeWidgetServiceProvider)
        .updateFromIsar(ref.read(isarProvider));
  }

  Future<void> _updateLanguage(Locale locale) async {
    final settings = ref.read(settingsProvider);
    settings.language = '${locale.languageCode}_${locale.countryCode}';
    await ref.read(settingsRepositoryProvider).save(settings);
    ref.read(appSettingsProvider.notifier).update(locale: locale);
    await _refreshWidgets();
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
            if (Platform.isAndroid) ...[
              const Gap(24),
              _buildWidgetSection(context),
            ],
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
                await ref.read(themeModeProvider.notifier).saveOledTheme(value);
                if (!mounted) return;
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
                await ref
                    .read(themeModeProvider.notifier)
                    .saveMaterialTheme(value);
                if (!mounted) return;
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
                await ref.read(settingsRepositoryProvider).save(settings);
                if (!mounted) return;
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
          value: '${appSettings.timeRange}',
          onTap: () => _showTimeRangeDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.timer_start),
          title: 'timeStart',
          value: _safeFormatTime(
            settings.timeStart ?? AppConstants.defaultNotificationTimeStart,
          ),
          onTap: () => _showTimeStartPicker(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.timer_pause),
          title: 'timeEnd',
          value: _safeFormatTime(
            settings.timeEnd ?? AppConstants.defaultNotificationTimeEnd,
          ),
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
                await ref.read(settingsRepositoryProvider).save(settings);
                if (Platform.isAndroid) {
                  await ref
                      .read(homeWidgetServiceProvider)
                      .updateFromIsar(ref.read(isarProvider));
                }
                if (!mounted) return;
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
          leading: const Icon(IconsaxPlusLinear.setting_4),
          title: 'widget',
          trailing: Icon(
            IconsaxPlusLinear.arrow_right_3,
            size: 20,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const WidgetSettingsPage()),
            );
          },
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
                await ref.read(settingsRepositoryProvider).save(settings);
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
    final currentLanguage = appLanguages
        .firstWhere(
          (option) => option.locale == locale,
          orElse: () => defaultLanguageOption,
        )
        .name;

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
          onTap: () => openUrl('https://discord.gg/JMMa9aHh8f'),
        ),
        SettingsTile(
          leading: const Icon(LineAwesomeIcons.telegram),
          title: 'telegram'.tr,
          onTap: () => openUrl('https://t.me/darkmoonightX'),
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
          onTap: () => openUrl('https://github.com/darkmoonight/Rain'),
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
        await ref.read(themeModeProvider.notifier).saveTheme(value);
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
      currentValue: '${appSettings.timeRange}',
      itemBuilder: (value) => value,
      onSelected: (value) async {
        settings.timeRange = int.parse(value);
        await ref.read(settingsRepositoryProvider).save(settings);
        if (!mounted) return;
        if (settings.notifications) {
          await ref.read(notificationServiceProvider).cancelAll();
          final w = ref.read(mainWeatherNotifierProvider);
          await ref
              .read(notificationServiceProvider)
              .scheduleForWeather(
                cache: w.mainWeather,
                settings: settings,
                appSettings: appSettings,
                cityLabel: w.location.city ?? '',
              );
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
        await ref.read(settingsRepositoryProvider).save(settings);
        await _refreshWidgets();
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
        await ref.read(settingsRepositoryProvider).save(settings);
        await _refreshWidgets();
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
        await ref.read(settingsRepositoryProvider).save(settings);
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
        await ref.read(settingsRepositoryProvider).save(settings);
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
        await ref.read(settingsRepositoryProvider).save(settings);
        if (Platform.isAndroid) {
          await ref
              .read(homeWidgetServiceProvider)
              .updateFromIsar(ref.read(isarProvider));
        }
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showSelectionDialog<LanguageOption>(
      context: context,
      title: 'language'.tr,
      icon: IconsaxPlusLinear.language_square,
      items: appLanguages,
      currentValue: appLanguages.firstWhere(
        (option) => option.locale.languageCode == locale.languageCode,
        orElse: () => defaultLanguageOption,
      ),
      itemBuilder: (lang) => lang.name,
      onSelected: (value) => _updateLanguage(value.locale),
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
      ref.read(mainWeatherNotifierProvider.notifier).getCurrentLocation();
    }
    settings.location = value;
    await ref.read(settingsRepositoryProvider).save(settings);
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
    if (value) {
      await flutterLocalNotificationsPlugin
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
      final notificationsGranted = result ?? false;
      if (!notificationsGranted) return;
    }

    final settings = ref.read(settingsProvider);
    settings.notifications = value;
    await ref.read(settingsRepositoryProvider).save(settings);
    if (value) {
      final weather = ref.read(mainWeatherNotifierProvider);
      await ref
          .read(notificationServiceProvider)
          .scheduleForWeather(
            cache: weather.mainWeather,
            settings: settings,
            appSettings: ref.read(appSettingsProvider),
            cityLabel: weather.city,
          );
    } else {
      await ref.read(notificationServiceProvider).cancelAll();
    }
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _showTimeStartPicker(BuildContext context) async {
    final settings = ref.read(settingsProvider);
    final stored =
        settings.timeStart ?? AppConstants.defaultNotificationTimeStart;
    final TimeOfDay? timeStartPicker = await showAppTimePicker(
      context: context,
      ref: ref,
      initialTime: TimeIndexHelper.parseTime(stored),
    );
    if (timeStartPicker != null) {
      final String time24h = ref
          .read(mainWeatherNotifierProvider.notifier)
          .timeTo24h(timeStartPicker);
      settings.timeStart = time24h;
      await ref.read(settingsRepositoryProvider).save(settings);
      if (!mounted) return;
      if (settings.notifications) {
        await ref.read(notificationServiceProvider).cancelAll();
        final weather = ref.read(mainWeatherNotifierProvider);
        await ref
            .read(notificationServiceProvider)
            .scheduleForWeather(
              cache: weather.mainWeather,
              settings: settings,
              appSettings: ref.read(appSettingsProvider),
              cityLabel: weather.city,
            );
      }
      setState(() {});
    }
  }

  Future<void> _showTimeEndPicker(BuildContext context) async {
    final settings = ref.read(settingsProvider);
    final stored = settings.timeEnd ?? AppConstants.defaultNotificationTimeEnd;
    final TimeOfDay? timeEndPicker = await showAppTimePicker(
      context: context,
      ref: ref,
      initialTime: TimeIndexHelper.parseTime(stored),
    );
    if (timeEndPicker != null) {
      final String time24h = ref
          .read(mainWeatherNotifierProvider.notifier)
          .timeTo24h(timeEndPicker);
      settings.timeEnd = time24h;
      await ref.read(settingsRepositoryProvider).save(settings);
      if (!mounted) return;
      if (settings.notifications) {
        await ref.read(notificationServiceProvider).cancelAll();
        final weather = ref.read(mainWeatherNotifierProvider);
        await ref
            .read(notificationServiceProvider)
            .scheduleForWeather(
              cache: weather.mainWeather,
              settings: settings,
              appSettings: ref.read(appSettingsProvider),
              cityLabel: weather.city,
            );
      }
      setState(() {});
    }
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
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
      ),
    ),
    onTap: () => openUrl('https://open-meteo.com/'),
  );
}
