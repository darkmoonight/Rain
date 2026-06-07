import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/responsive_utils.dart';

/// Single row in a settings section with optional value and trailing control.
class SettingsTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subtitle;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? iconColor;

  const SettingsTile({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.value,
    this.trailing,
    this.onTap,
    this.titleColor,
    this.iconColor,
  });

  /// Builds the settings list tile with leading icon and trailing control.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingL,
        vertical: AppConstants.spacingXS,
      ),
      leading: IconTheme(
        data: IconThemeData(
          color: iconColor ?? titleColor ?? colorScheme.onSurfaceVariant,
          size: 24,
        ),
        child: leading,
      ),
      title: Text(
        title.tr,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: titleColor ?? colorScheme.onSurface,
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 15),
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!.tr,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
              ),
            )
          : null,
      trailing: trailing ?? _buildDefaultTrailing(context, colorScheme),
    );
  }

  /// Builds the default trailing value text or chevron when none is provided.
  Widget? _buildDefaultTrailing(BuildContext context, ColorScheme colorScheme) {
    if (value != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
            ),
          ),
          const SizedBox(width: AppConstants.spacingS),
          Icon(
            IconsaxPlusLinear.arrow_right_3,
            size: 20,
            color: colorScheme.onSurfaceVariant,
          ),
        ],
      );
    }

    if (onTap != null) {
      return Icon(
        IconsaxPlusLinear.arrow_right_3,
        size: 20,
        color: colorScheme.onSurfaceVariant,
      );
    }

    return null;
  }
}
