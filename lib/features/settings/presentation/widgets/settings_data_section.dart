import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/config/setting_enum_pickers.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/settings/presentation/widgets/selection_dialog.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section_state.dart';
import 'package:rain/features/settings/presentation/widgets/settings_switch_tile.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/i18n/tr.dart';

/// Units, formats, and display data settings.
class SettingsDataSection extends ConsumerStatefulWidget {
  const SettingsDataSection({super.key});

  @override
  ConsumerState<SettingsDataSection> createState() =>
      _SettingsDataSectionState();
}

class _SettingsDataSectionState
    extends SettingsSectionConsumerState<SettingsDataSection> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    return SettingsSection(
      title: 'data',
      icon: IconsaxPlusBold.d_square,
      children: [
        SettingsSwitchTile(
          leading: const Icon(IconsaxPlusLinear.cloud_notif),
          title: 'roundDegree',
          value: settings.roundDegree,
          onChanged: (value) async {
            settings.roundDegree = value;
            await actions.saveSettings(
              afterSave: actions.syncWidgetsAndNotificationContent,
              backgroundAfterSave: true,
            );
          },
        ),
        for (final def in settingDataEnumPickers)
          SettingsTile(
            leading: Icon(def.icon),
            title: def.titleKey,
            value: def.read(settings).tr,
            onTap: () => _showDataEnumPicker(context, settings, def),
          ),
      ],
    );
  }

  /// Shows an enum picker and runs widget/notification side-effects per [def] flags.
  void _showDataEnumPicker(
    BuildContext context,
    Settings settings,
    SettingEnumPickerDefinition def,
  ) {
    showSelectionDialog<String>(
      context: context,
      title: def.titleKey.tr,
      icon: def.icon,
      items: def.items,
      currentValue: def.read(settings),
      itemBuilder: (value) => value.tr,
      onSelected: (value) async {
        def.write(settings, value);
        await actions.saveSettings(
          afterSave: actions.afterSaveForEnumPicker(def),
          backgroundAfterSave: actions.backgroundAfterSaveForEnumPicker(def),
        );
      },
    );
  }
}
