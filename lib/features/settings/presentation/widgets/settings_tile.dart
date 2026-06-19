import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/responsive_utils.dart';

/// Single row inside a [SettingsSection] card.
class SettingsTile extends StatelessWidget {
  final Widget leading;

  /// i18n key for the title (ignored when [titleText] is set).
  final String? title;

  /// Pre-localized title when the text must not go through `.tr`.
  final String? titleText;
  final String? subtitle;

  /// Pre-localized subtitle when the text is built at runtime (e.g. weekday list).
  final String? subtitleText;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? iconColor;

  const SettingsTile({
    super.key,
    required this.leading,
    this.title,
    this.titleText,
    this.subtitle,
    this.subtitleText,
    this.value,
    this.trailing,
    this.onTap,
    this.titleColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    assert(
      title != null || titleText != null,
      'SettingsTile needs title or titleText',
    );
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
        titleText ?? title!.tr,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: titleColor ?? colorScheme.onSurface,
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 15),
        ),
      ),
      subtitle: _buildSubtitle(context, colorScheme),
      trailing: trailing ?? _buildDefaultTrailing(context, colorScheme),
    );
  }

  /// Subtitle from [subtitleText] or translated [subtitle].
  Widget? _buildSubtitle(BuildContext context, ColorScheme colorScheme) {
    final text = subtitleText ?? subtitle?.tr;
    if (text == null) return null;

    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
      ),
    );
  }

  Widget? _buildDefaultTrailing(BuildContext context, ColorScheme colorScheme) {
    if (value != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.35,
            ),
            child: Text(
              value!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
              ),
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
