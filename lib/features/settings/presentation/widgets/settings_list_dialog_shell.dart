import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/theme/theme_text.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/features/settings/presentation/widgets/settings_card_shape.dart';
import 'package:rain/i18n/tr.dart';

/// Shared shell for settings-style modal dialogs.
class SettingsListDialogShell extends StatelessWidget {
  const SettingsListDialogShell({
    super.key,
    required this.body,
    this.header,
    this.footer,
    this.maxHeightFraction = 0.7,
  });

  final Widget? header;
  final Widget body;
  final Widget? footer;
  final double maxHeightFraction;

  /// Horizontal body padding used by scrollable settings dialogs.
  static const EdgeInsets dialogBodyPadding = EdgeInsets.fromLTRB(
    AppConstants.spacingXXL,
    0,
    AppConstants.spacingXXL,
    AppConstants.spacingS,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveUtils.isMobile(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : AppConstants.maxDialogWidth,
          maxHeight: MediaQuery.of(context).size.height * maxHeightFraction,
        ),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusXXLarge,
            ),
            side: BorderSide(
              color: SettingsCardShape.settingsDividerColor(colorScheme),
              width: AppConstants.borderWidthThin,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ?header,
              Flexible(child: body),
              ?footer,
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsListDialogHeader extends StatelessWidget {
  const SettingsListDialogHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  /// Already localized title text.
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppConstants.spacingXXL),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppConstants.spacingM),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusMedium,
              ),
            ),
            child: Icon(
              icon,
              size: AppConstants.iconSizeLarge,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: AppConstants.spacingL),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Single dismiss action for read-only settings dialogs.
class SettingsListDialogDismissAction extends StatelessWidget {
  const SettingsListDialogDismissAction({super.key, this.labelKey = 'close'});

  /// i18n key for the dismiss button (defaults to [close]).
  final String labelKey;

  @override
  Widget build(BuildContext context) => SettingsListDialogActionsFooter(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SettingsListDialogTonalButton(
          labelKey: labelKey,
          onPressed: () => NavigationHelper.back(context),
        ),
      ],
    ),
  );
}

class SettingsDialogListTile extends StatelessWidget {
  const SettingsDialogListTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.leading,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingXXL,
        vertical: AppConstants.spacingXS,
      ),
      leading: leading,
      title: Text(
        title,
        style: ThemeText.settingsBody(
          context,
          weight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? colorScheme.primary : colorScheme.onSurface,
        ),
      ),
      trailing: isSelected
          ? Icon(
              IconsaxPlusBold.tick_circle,
              color: colorScheme.primary,
              size: AppConstants.iconSizeMedium,
            )
          : null,
      onTap: onTap,
    );
  }
}

class SettingsListDialogCancelSaveActions extends StatelessWidget {
  const SettingsListDialogCancelSaveActions({
    super.key,
    required this.onSave,
    this.confirmLabelKey = 'save',
    this.leading,
  });

  final VoidCallback onSave;

  /// i18n key for the confirm button (defaults to [save]).
  final String confirmLabelKey;

  /// Optional action before cancel/save (e.g. reset).
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    if (leading == null) {
      return SettingsListDialogConfirmActions(
        onConfirm: onSave,
        confirmLabelKey: confirmLabelKey,
      );
    }

    return SettingsListDialogActionsFooter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          leading!,
          const SizedBox(width: AppConstants.spacingS),
          SettingsListDialogTonalButton(
            labelKey: confirmLabelKey,
            onPressed: onSave,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ],
      ),
    );
  }
}

/// Cancel and confirm action row for settings dialogs.
class SettingsListDialogConfirmActions extends StatelessWidget {
  const SettingsListDialogConfirmActions({
    super.key,
    required this.onConfirm,
    this.onCancel,
    this.confirmLabelKey = 'confirm',
    this.cancelLabelKey = 'cancel',
    this.isDestructive = false,
    this.showCancelButton = true,
    this.cancelResult,
  });

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  /// i18n key for the confirm button (defaults to [confirm]).
  final String confirmLabelKey;

  /// i18n key for the cancel button (defaults to [cancel]).
  final String cancelLabelKey;
  final bool isDestructive;
  final bool showCancelButton;

  /// Value passed to [NavigationHelper.back] when cancel is pressed.
  final Object? cancelResult;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final buttonBgColor = isDestructive
        ? colorScheme.errorContainer
        : colorScheme.primaryContainer;
    final buttonTextColor = isDestructive
        ? colorScheme.onErrorContainer
        : colorScheme.onPrimaryContainer;

    return SettingsListDialogActionsFooter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (showCancelButton) ...[
            TextButton(
              onPressed: () {
                onCancel?.call();
                NavigationHelper.back(context, result: cancelResult);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingXL,
                  vertical: AppConstants.spacingM,
                ),
              ),
              child: Text(
                cancelLabelKey.tr,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: AppConstants.spacingS),
          ],
          SettingsListDialogTonalButton(
            labelKey: confirmLabelKey,
            onPressed: onConfirm,
            backgroundColor: buttonBgColor,
            foregroundColor: buttonTextColor,
          ),
        ],
      ),
    );
  }
}

/// Bottom padding wrapper shared by settings dialog action rows.
class SettingsListDialogActionsFooter extends StatelessWidget {
  const SettingsListDialogActionsFooter({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(
      AppConstants.spacingXXL,
      AppConstants.spacingS,
      AppConstants.spacingXXL,
      AppConstants.spacingXXL,
    ),
    child: child,
  );
}

/// Primary tonal button used in settings dialogs.
class SettingsListDialogTonalButton extends StatelessWidget {
  const SettingsListDialogTonalButton({
    super.key,
    required this.labelKey,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String labelKey;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingXL,
          vertical: AppConstants.spacingM,
        ),
        backgroundColor: backgroundColor ?? colorScheme.primaryContainer,
        foregroundColor: foregroundColor ?? colorScheme.onPrimaryContainer,
      ),
      child: Text(
        labelKey.tr,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
