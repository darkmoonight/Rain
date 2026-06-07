import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/core/constants/app_constants.dart';

/// Material confirmation dialog with icon, title, and action buttons.
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.icon = IconsaxPlusBold.warning_2,
    this.iconColor,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.isDestructive = false,
    this.showCancelButton = true,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color? iconColor;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isDestructive;
  final bool showCancelButton;

  /// Builds the confirmation dialog layout with icon, text, and actions.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveUtils.isMobile(context);

    final resolvedIconColor =
        iconColor ?? (isDestructive ? colorScheme.error : colorScheme.primary);

    final buttonBgColor = isDestructive
        ? colorScheme.errorContainer
        : colorScheme.primaryContainer;

    final buttonTextColor = isDestructive
        ? colorScheme.onErrorContainer
        : colorScheme.onPrimaryContainer;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : AppConstants.maxDialogWidth,
        ),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusXXLarge,
            ),
            side: BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              width: AppConstants.borderWidthThin,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.spacingXXL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildIcon(resolvedIconColor, colorScheme),
                const SizedBox(height: AppConstants.spacingL),
                _buildTitle(context, colorScheme),
                const SizedBox(height: AppConstants.spacingM),
                _buildMessage(context, colorScheme),
                const SizedBox(height: AppConstants.spacingXXL),
                _buildActions(
                  context,
                  colorScheme,
                  buttonBgColor,
                  buttonTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the circular icon badge at the top of the dialog.
  Widget _buildIcon(Color resolvedIconColor, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacingL),
      decoration: BoxDecoration(
        color: resolvedIconColor.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: AppConstants.iconSizeXLarge,
        color: resolvedIconColor,
      ),
    );
  }

  /// Builds the localized dialog title text.
  Widget _buildTitle(BuildContext context, ColorScheme colorScheme) {
    return Text(
      title.tr,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 20),
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Builds the localized dialog message body.
  Widget _buildMessage(BuildContext context, ColorScheme colorScheme) {
    return Text(
      message.tr,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Builds the confirm button and optional cancel button.
  Widget _buildActions(
    BuildContext context,
    ColorScheme colorScheme,
    Color buttonBgColor,
    Color buttonTextColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showCancelButton) ...[
          TextButton(
            onPressed: () {
              onCancel?.call();
              Navigator.of(context).pop(false);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacingXL,
                vertical: AppConstants.spacingM,
              ),
            ),
            child: Text(
              (cancelText ?? 'cancel').tr,
              style: TextStyle(
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: AppConstants.spacingS),
        ],
        FilledButton.tonal(
          onPressed: () {
            onConfirm?.call();
            NavigationHelper.back(context, result: true);
          },
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacingXL,
              vertical: AppConstants.spacingM,
            ),
            backgroundColor: buttonBgColor,
            foregroundColor: buttonTextColor,
          ),
          child: Text(
            (confirmText ?? 'confirm').tr,
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

/// Shows [ConfirmationDialog] and returns whether the user confirmed.
Future<bool> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String message,
  IconData icon = IconsaxPlusBold.warning_2,
  Color? iconColor,
  String? confirmText,
  String? cancelText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  bool isDestructive = false,
  bool showCancelButton = true,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => ConfirmationDialog(
      title: title,
      message: message,
      icon: icon,
      iconColor: iconColor,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      isDestructive: isDestructive,
      showCancelButton: showCancelButton,
    ),
  );
  return result ?? false;
}

/// Shows a destructive delete confirmation dialog.
Future<bool> showDeleteConfirmation({
  required BuildContext context,
  required String title,
  required String message,
  VoidCallback? onConfirm,
}) async {
  return showConfirmationDialog(
    context: context,
    title: title,
    message: message,
    icon: IconsaxPlusBold.trash,
    confirmText: 'delete',
    isDestructive: true,
    onConfirm: onConfirm,
  );
}

/// Shows an archive or unarchive confirmation dialog.
Future<bool> showArchiveConfirmation({
  required BuildContext context,
  required String title,
  required String message,
  required bool isUnarchive,
  VoidCallback? onConfirm,
}) async {
  final colorScheme = Theme.of(context).colorScheme;

  return showConfirmationDialog(
    context: context,
    title: title,
    message: message,
    icon: isUnarchive
        ? IconsaxPlusBold.refresh_left_square
        : IconsaxPlusBold.archive_add,
    iconColor: colorScheme.primary,
    confirmText: isUnarchive ? 'noArchive' : 'archive',
    isDestructive: false,
    onConfirm: onConfirm,
  );
}

/// Shows a destructive confirmation before clearing text input.
Future<bool> showClearTextConfirmation({
  required BuildContext context,
  VoidCallback? onConfirm,
}) async {
  return showConfirmationDialog(
    context: context,
    title: 'clearText',
    message: 'clearTextWarning',
    icon: IconsaxPlusBold.warning_2,
    confirmText: 'delete',
    isDestructive: true,
    onConfirm: onConfirm,
  );
}
