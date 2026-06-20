import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_cache_file_store/http_cache_file_store.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/theme/app_font.dart';
import 'package:rain/core/theme/color_palette.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:rain/core/weather/aqi_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/settings/presentation/widgets/settings_about_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_functions_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_save_actions.dart';
import 'package:rain/features/settings/presentation/widgets/selection_dialog.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/core/config/app_config.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/core/utils/url_launcher_util.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/features/settings/presentation/view/widget_settings_page.dart';
import 'package:restart_app/restart_app.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  late final SettingsSaveActions _saveActions;

  Settings get settings => ref.watch(settingsProvider);

  Locale get locale => ref.watch(localeProvider);

  @override
  void initState() {
    super.initState();
    _saveActions = SettingsSaveActions(ref, setState);
  }

  Future<void> _refreshWidgets() async {
    if (!Platform.isAndroid) return;
    await ref.read(widgetSettingsServiceProvider).refreshWidgets();
  }

  Future<void> _saveSettings({
    Future<void> Function()? afterSave,
    bool backgroundAfterSave = false,
  }) => _saveActions.saveSettings(
    afterSave: afterSave,
    backgroundAfterSave: backgroundAfterSave,
  );

  Future<void> _saveWithNotificationContentSync({
    bool refreshWidgets = false,
  }) => _saveSettings(
    afterSave: refreshWidgets
        ? _syncWidgetsAndNotificationContent
        : _saveActions.weather.rebuildNotificationContentFromCache,
    backgroundAfterSave: true,
  );

  Future<void> _syncWidgetsAndNotificationContent() async {
    await _refreshWidgets();
    await _saveActions.weather.rebuildNotificationContentFromCache();
  }

  void _runInBackground(Future<void> Function()? action) =>
      _saveActions.runInBackground(action);

  void _showCatalogDialog(
    BuildContext context, {
    required String titleKey,
    required IconData icon,
    required List<String> items,
    required String currentValue,
    required String Function(String) itemBuilder,
    required void Function(String value) apply,
    Widget? Function(String)? leadingBuilder,
    Future<void> Function()? afterSave,
    bool backgroundAfterSave = false,
    bool enableSearch = false,
  }) {
    showSelectionDialog<String>(
      context: context,
      title: titleKey.tr,
      icon: icon,
      items: items,
      currentValue: currentValue,
      itemBuilder: itemBuilder,
      leadingBuilder: leadingBuilder,
      enableSearch: enableSearch,
      onSelected: (value) async {
        apply(value);
        await _saveSettings(
          afterSave: afterSave,
          backgroundAfterSave: backgroundAfterSave,
        );
      },
    );
  }

  Future<void> _updateLanguage(Locale locale) async {
    final settings = ref.read(settingsProvider);
    settings.language = '${locale.languageCode}_${locale.countryCode}';
    await ref.read(settingsRepositoryProvider).save(settings);
    ref.read(appSettingsProvider.notifier).update(locale: locale);
    await applyAppLocale(appLocaleFromFlutterLocale(locale));
    await _refreshWidgets();
    _runInBackground(_saveActions.weather.rebuildNotificationContentFromCache);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingL,
          vertical: AppConstants.spacingM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppearanceSection(context),
            const Gap(24),
            const SettingsFunctionsSection(),
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
            const SettingsAboutSection(),
            const Gap(16),
          ],
        ),
      ),
    );
  }

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
          leading: const Icon(IconsaxPlusLinear.color_swatch),
          title: 'colorPalette',
          value: AppColorPalette.label(settings.colorPalette),
          onTap: () => _showColorPaletteDialog(context),
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
                await _saveSettings();
              },
            ),
          ),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.text),
          title: 'appFont',
          value: AppFont.label(settings.appFont),
          onTap: () => _showAppFontDialog(context),
        ),
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.cloud_sunny),
          title: 'weatherIconTheme',
          value: WeatherIconTheme.label(settings.weatherIconTheme),
          onTap: () => _showWeatherIconThemeDialog(context),
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
                await _saveWithNotificationContentSync(refreshWidgets: true);
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
          onTap: () => context.pushRouteUp(const WidgetSettingsPage()),
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

  void _showColorPaletteDialog(BuildContext context) {
    _showCatalogDialog(
      context,
      titleKey: 'colorPalette',
      icon: IconsaxPlusLinear.color_swatch,
      items: AppColorPalette.choices,
      currentValue: AppColorPalette.resolve(settings.colorPalette),
      itemBuilder: AppColorPalette.label,
      leadingBuilder: AppColorPalette.previewLeading,
      enableSearch: true,
      apply: (value) => settings.colorPalette = value,
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
        await _saveWithNotificationContentSync(refreshWidgets: true);
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
        await _saveSettings(afterSave: _refreshWidgets);
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
        await _saveSettings();
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
        await _saveSettings();
      },
    );
  }

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
        await _saveSettings();
      },
    );
  }

  void _showAppFontDialog(BuildContext context) {
    _showCatalogDialog(
      context,
      titleKey: 'appFont',
      icon: IconsaxPlusLinear.text,
      items: AppFont.choices,
      currentValue: AppFont.resolve(settings.appFont),
      itemBuilder: AppFont.label,
      apply: (value) => settings.appFont = value,
    );
  }

  void _showWeatherIconThemeDialog(BuildContext context) {
    _showCatalogDialog(
      context,
      titleKey: 'weatherIconTheme',
      icon: IconsaxPlusLinear.cloud_sunny,
      items: WeatherIconTheme.choices,
      currentValue: WeatherIconTheme.resolve(settings.weatherIconTheme),
      itemBuilder: WeatherIconTheme.label,
      leadingBuilder: WeatherIconTheme.previewLeading,
      apply: (value) => settings.weatherIconTheme = value,
      afterSave: _syncWidgetsAndNotificationContent,
      backgroundAfterSave: true,
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
        await _saveWithNotificationContentSync(refreshWidgets: true);
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
}
