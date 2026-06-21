import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/features/settings/presentation/widgets/settings_about_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_appearance_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_data_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_functions_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_misc_sections.dart';

/// Root settings screen composing feature-specific sections.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingL,
          vertical: AppConstants.spacingM,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingsAppearanceSection(),
            const Gap(AppConstants.spacingXXL),
            const SettingsFunctionsSection(),
            const Gap(AppConstants.spacingXXL),
            const SettingsDataSection(),
            const Gap(AppConstants.spacingXXL),
            const SettingsMiscSections(),
            const Gap(AppConstants.spacingXXL),
            const SettingsAboutSection(),
            const Gap(AppConstants.spacingL),
          ],
        ),
      ),
    );
  }
}
