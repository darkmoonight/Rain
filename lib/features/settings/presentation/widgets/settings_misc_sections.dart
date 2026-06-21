import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/config/app_config.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/utils/url_launcher_util.dart';
import 'package:rain/core/widgets/confirmation_dialog.dart';
import 'package:rain/features/settings/presentation/view/widget_settings_page.dart';
import 'package:rain/features/settings/presentation/widgets/selection_dialog.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/core/widgets/map_tiles.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section_state.dart';
import 'package:rain/features/settings/presentation/widgets/settings_switch_tile.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/tr.dart';

/// Map, widget shortcut, language, and community link settings.
class SettingsMiscSections extends ConsumerStatefulWidget {
  const SettingsMiscSections({super.key});

  @override
  ConsumerState<SettingsMiscSections> createState() =>
      _SettingsMiscSectionsState();
}

class _SettingsMiscSectionsState
    extends SettingsSectionConsumerState<SettingsMiscSections> {
  Locale get locale => ref.watch(localeProvider);

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final currentLanguage = appLanguages
        .firstWhere(
          (option) => option.locale == locale,
          orElse: () => defaultLanguageOption,
        )
        .name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Platform.isAndroid) ...[
          SettingsSection(
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
          ),
          const Gap(AppConstants.spacingXXL),
        ],
        SettingsSection(
          title: 'map',
          icon: IconsaxPlusBold.map,
          children: [
            SettingsSwitchTile(
              leading: const Icon(IconsaxPlusLinear.location_slash),
              title: 'hideMap',
              value: settings.hideMap,
              onChanged: actions.saveHideMapToggle,
            ),
            SettingsTile(
              leading: const Icon(IconsaxPlusLinear.trash_square),
              title: 'clearCacheStore',
              onTap: () => _showClearCacheDialog(context),
            ),
          ],
        ),
        const Gap(AppConstants.spacingXXL),
        SettingsSection(
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
        ),
        const Gap(AppConstants.spacingXXL),
        SettingsSection(
          title: 'groups',
          icon: IconsaxPlusBold.link_square,
          children: [
            SettingsTile(
              leading: const Icon(LineAwesomeIcons.discord),
              title: 'discord',
              onTap: () => openUrl('https://discord.gg/JMMa9aHh8f'),
            ),
            SettingsTile(
              leading: const Icon(LineAwesomeIcons.telegram),
              title: 'telegram',
              onTap: () => openUrl('https://t.me/darkmoonightX'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _updateLanguage(Locale locale) async {
    final settings = ref.read(settingsProvider);
    settings.language = '${locale.languageCode}_${locale.countryCode}';
    await ref.read(settingsRepositoryProvider).save(settings);
    ref.read(appSettingsProvider.notifier).update(locale: locale);
    await applyAppLocale(appLocaleFromFlutterLocale(locale));
    await actions.refreshWidgets();
    actions.runInBackground(
      actions.weather.rebuildNotificationContentFromCache,
    );
    if (mounted) setState(() {});
  }

  void _showLanguageDialog(BuildContext context) {
    showSelectionDialog<LanguageOption>(
      context: context,
      title: 'language'.tr,
      icon: IconsaxPlusLinear.language_square,
      items: appLanguages,
      currentValue: appLanguages.firstWhere(
        (option) => option.locale == locale,
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
      title: 'deletedCacheStore',
      message: 'deletedCacheStoreQuery',
      icon: IconsaxPlusBold.trash,
      confirmText: 'delete',
      isDestructive: true,
      onConfirm: () async {
        final cacheStore = await openMapTilesCacheStore();
        await cacheStore.clean();
      },
    );
  }
}
