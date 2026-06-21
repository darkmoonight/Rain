import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/config/setting_appearance_pickers.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/di/settings_revision.dart';
import 'package:rain/core/theme/color_palette.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/settings/presentation/widgets/selection_dialog.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section_state.dart';
import 'package:rain/features/settings/presentation/widgets/settings_switch_tile.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/i18n/tr.dart';

/// Theme, palette, font, and icon appearance settings.
class SettingsAppearanceSection extends ConsumerStatefulWidget {
  const SettingsAppearanceSection({super.key});

  @override
  ConsumerState<SettingsAppearanceSection> createState() =>
      _SettingsAppearanceSectionState();
}

class _SettingsAppearanceSectionState
    extends SettingsSectionConsumerState<SettingsAppearanceSection> {
  @override
  Widget build(BuildContext context) {
    ref.watch(settingsRevisionProvider);
    ref.watch(themeModeProvider);
    final settings = ref.watch(settingsProvider);

    return SettingsSection(
      title: 'appearance',
      icon: IconsaxPlusBold.brush_1,
      children: [
        SettingsTile(
          leading: const Icon(IconsaxPlusLinear.moon),
          title: 'theme',
          value: themePreferenceLabel(settings.theme),
          onTap: () => _showThemeDialog(context),
        ),
        SettingsSwitchTile(
          leading: const Icon(IconsaxPlusLinear.mobile),
          title: 'amoledTheme',
          value: settings.amoledTheme,
          onChanged: (value) async {
            await ref.read(themeModeProvider.notifier).saveOledTheme(value);
          },
        ),
        SettingsSwitchTile(
          leading: const Icon(IconsaxPlusLinear.colorfilter),
          title: 'materialColor',
          value: settings.materialColor,
          onChanged: (value) async {
            await ref.read(themeModeProvider.notifier).saveMaterialTheme(value);
          },
        ),
        _buildColorPaletteTile(context, settings),
        SettingsSwitchTile(
          leading: const Icon(IconsaxPlusLinear.additem),
          title: 'largeElement',
          value: settings.largeElement,
          onChanged: (value) async {
            settings.largeElement = value;
            await actions.saveSettings();
          },
        ),
        for (final def in settingAppearanceCatalogPickers)
          if (def.titleKey != 'colorPalette') _buildCatalogTile(settings, def),
      ],
    );
  }

  SettingsTile _buildColorPaletteTile(BuildContext context, Settings settings) {
    final disabled = settings.materialColor;
    final muted = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.38);

    return SettingsTile(
      leading: const Icon(IconsaxPlusLinear.color_swatch),
      title: 'colorPalette',
      subtitle: disabled ? 'colorPaletteSystemHint' : null,
      value: disabled
          ? null
          : AppColorPalette.label(
              AppColorPalette.resolve(settings.colorPalette),
            ),
      titleColor: disabled ? muted : null,
      iconColor: disabled ? muted : null,
      onTap: disabled
          ? null
          : () => _showCatalogDialog(
              context,
              settingAppearanceCatalogPickers.first,
              settings,
            ),
    );
  }

  SettingsTile _buildCatalogTile(
    Settings settings,
    SettingAppearancePickerDefinition def,
  ) {
    return SettingsTile(
      leading: Icon(def.icon),
      title: def.titleKey,
      value: def.itemBuilder(def.read(settings)),
      onTap: () => _showCatalogDialog(context, def, settings),
    );
  }

  void _showThemeDialog(BuildContext context) {
    final settings = ref.read(settingsProvider);
    showSelectionDialog<String>(
      context: context,
      title: 'theme'.tr,
      icon: IconsaxPlusBold.moon,
      items: const ['system', 'dark', 'light'],
      currentValue: settings.theme ?? 'system',
      itemBuilder: (theme) => theme.tr,
      onSelected: (value) =>
          ref.read(themeModeProvider.notifier).saveTheme(value),
    );
  }

  void _showCatalogDialog(
    BuildContext context,
    SettingAppearancePickerDefinition def,
    Settings settings,
  ) {
    showSelectionDialog<String>(
      context: context,
      title: def.titleKey.tr,
      icon: def.icon,
      items: def.items,
      currentValue: def.read(settings),
      itemBuilder: def.itemBuilder,
      leadingBuilder: def.leadingBuilder,
      enableSearch: def.enableSearch,
      onSelected: (value) async {
        def.write(settings, value);
        await actions.saveSettings(
          afterSave: _afterSaveForPicker(def),
          backgroundAfterSave: def.syncNotificationContent,
        );
      },
    );
  }

  Future<void> Function()? _afterSaveForPicker(
    SettingAppearancePickerDefinition def,
  ) {
    if (def.syncNotificationContent && def.refreshWidgets) {
      return actions.syncWidgetsAndNotificationContent;
    }
    if (def.syncNotificationContent) {
      return actions.weather.rebuildNotificationContentFromCache;
    }
    if (def.refreshWidgets) {
      return actions.refreshWidgets;
    }
    return null;
  }
}
