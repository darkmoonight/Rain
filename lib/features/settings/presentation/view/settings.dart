import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/weather/aqi_helper.dart';
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

/// Scrollable settings screen grouped into themed sections.
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  /// Creates the state for [SettingsPage].
  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

// --- SettingsPageState ---

/// State for [SettingsPage] handling settings UI, dialogs, and persistence.
class _SettingsPageState extends ConsumerState<SettingsPage> {
  String? appVersion;

  /// Persisted Isar settings watched from Riverpod.
  Settings get settings => ref.watch(settingsProvider);

  /// In-memory app settings snapshot watched from Riverpod.
  AppSettingsState get appSettings => ref.watch(appSettingsProvider);

  /// Active UI locale watched from Riverpod.
  Locale get locale => ref.watch(localeProvider);

  /// Loads package version on first frame.
  @override
  void initState() {
    super.initState();
    _infoVersion();
  }

  /// Loads the app version string from package info for the about section.
  Future<void> _infoVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() => appVersion = packageInfo.version);
  }

  /// Formats a stored time string, or `--:--` when null or empty.
  String _safeFormatTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return '--:--';
    ref.watch(settingsRevisionProvider);
    return TimeIndexHelper.formatTime(
      timeStr,
      ref.watch(settingsProvider),
      ref.watch(localeProvider).languageCode,
    );
  }

  /// Pushes the latest settings to Android home widgets when on Android.
  Future<void> _refreshWidgets() async {
    if (!Platform.isAndroid) return;
    await ref
        .read(homeWidgetServiceProvider)
        .updateFromIsar(ref.read(isarProvider));
  }

  /// Persists a new locale, updates in-memory settings, and refreshes widgets.
  Future<void> _updateLanguage(Locale locale) async {
    final settings = ref.read(settingsProvider);
    settings.language = '${locale.languageCode}_${locale.countryCode}';
    await ref.read(settingsRepositoryProvider).save(settings);
    ref.read(appSettingsProvider.notifier).update(locale: locale);
    await _refreshWidgets();
    setState(() {});
  }

  /// Builds the scrollable settings page with all sections.
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

  // --- Sections ---

  /// Builds the appearance settings section.
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

  /// Builds the functions settings section.
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

  /// Builds the data and units settings section.
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
          leading: const Icon(IconsaxPlusLinear.health),
          title: 'aqiStandard',
          value: settings.aqiStandard.tr,
          onTap: () => _showAqiStandardDialog(context),
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

  /// Builds the Android home widget settings section.
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

  /// Builds the map and cache settings section.
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

  /// Builds the language selection settings section.
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

  /// Builds the community links settings section.
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

  /// Builds the about app settings section.
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

  // --- Dialogs ---

  /// Opens the light/dark/system theme picker.
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

  /// Opens the notification interval picker and reschedules when needed.
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

  /// Opens the Celsius/Fahrenheit temperature unit picker.
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

  /// Opens the metric/imperial measurements picker.
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

  /// Opens the wind speed unit picker.
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

  /// Opens the pressure unit picker.
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

  /// Opens the European / US AQI standard picker.
  void _showAqiStandardDialog(BuildContext context) {
    showSelectionDialog<String>(
      context: context,
      title: 'aqiStandard'.tr,
      icon: IconsaxPlusLinear.health,
      items: [AqiHelper.european, AqiHelper.american],
      currentValue: settings.aqiStandard,
      itemBuilder: (value) => value.tr,
      onSelected: (value) async {
        settings.aqiStandard = value;
        await ref.read(settingsRepositoryProvider).save(settings);
        if (!mounted) return;
        setState(() {});
      },
    );
  }

  /// Opens the 12/24-hour clock format picker.
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

  /// Opens the searchable language list and applies the selection.
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

  /// Toggles GPS-based weather and prompts when location services are off.
  Future<void> _onLocationChanged(bool value, BuildContext context) async {
    if (value) {
      final serviceEnabled = await ref
          .read(locationServiceProvider)
          .isServiceEnabled();
      if (!serviceEnabled) {
        if (!context.mounted) return;
        await _showLocationDialog(context);
        return;
      }
    }
    settings.location = value;
    await ref.read(settingsRepositoryProvider).save(settings);
    if (value) {
      await ref.read(mainWeatherNotifierProvider.notifier).getCurrentLocation();
    }
    if (!mounted) return;
    setState(() {});
  }

  /// Prompts the user to open system location settings.
  Future<bool> _showLocationDialog(BuildContext context) async {
    return showConfirmationDialog(
      context: context,
      title: 'location'.tr,
      message: 'no_location'.tr,
      icon: IconsaxPlusBold.location,
      confirmText: 'settings'.tr,
      onConfirm: () => ref.read(locationServiceProvider).openLocationSettings(),
    );
  }

  /// When enabling, requests notification permissions and schedules alerts; when disabling, cancels all.
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
      if (result == false) return;
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

  /// Picks the daily notification window start time and reschedules alerts.
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
      final time24h = TimeIndexHelper.timeTo24h(timeStartPicker);
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

  /// Picks the daily notification window end time and reschedules alerts.
  Future<void> _showTimeEndPicker(BuildContext context) async {
    final settings = ref.read(settingsProvider);
    final stored = settings.timeEnd ?? AppConstants.defaultNotificationTimeEnd;
    final TimeOfDay? timeEndPicker = await showAppTimePicker(
      context: context,
      ref: ref,
      initialTime: TimeIndexHelper.parseTime(stored),
    );
    if (timeEndPicker != null) {
      final time24h = TimeIndexHelper.timeTo24h(timeEndPicker);
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

  /// Confirms and clears cached map tile files.
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

  // --- Widgets ---

  /// Builds the tappable Open-Meteo attribution footer.
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
