import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/core/di/provider_refs.dart';

/// Titled card grouping related settings tiles.
class SettingsSection extends ConsumerWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppConstants.spacingL,
            bottom: AppConstants.spacingM,
          ),
          child: Row(
            children: [
              Icon(icon, size: 20, color: colorScheme.primary),
              const SizedBox(width: AppConstants.spacingS),
              Text(
                title.tr,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.zero,
          shape: settings.amoledTheme
              ? RoundedRectangleBorder(
                  side: BorderSide(
                    color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                )
              : null,
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  Divider(
                    height: 1,
                    color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                  ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
