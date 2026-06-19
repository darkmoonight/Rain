import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/utils/url_launcher_util.dart';
import 'package:rain/features/settings/presentation/view/app_license_page.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/i18n/tr.dart';
import 'package:gap/gap.dart';

/// About, license, and project links in settings.
class SettingsAboutSection extends ConsumerWidget {
  const SettingsAboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appVersion = ref
        .watch(appVersionProvider)
        .maybeWhen(data: (version) => version, orElse: () => null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsSection(
          title: 'aboutApp',
          icon: IconsaxPlusBold.info_circle,
          children: [
            SettingsTile(
              leading: const Icon(IconsaxPlusLinear.document_text),
              title: 'license',
              onTap: () => context.pushRouteUp(const AppLicensePage()),
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
        ),
        const Gap(AppConstants.spacingL),
        GestureDetector(
          onTap: () => openUrl('https://open-meteo.com/'),
          child: Center(
            child: Text(
              'openMeteo'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
