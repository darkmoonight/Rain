import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/features/settings/presentation/widgets/settings_list_dialog_shell.dart';
import 'package:rain/i18n/tr.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final resolvedIconColor =
        iconColor ?? (isDestructive ? colorScheme.error : colorScheme.primary);

    return SettingsListDialogShell(
      maxHeightFraction: 1,
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingXXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
            ),
            const SizedBox(height: AppConstants.spacingL),
            Text(
              title.tr,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 20),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.spacingM),
            Text(
              message.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      footer: SettingsListDialogConfirmActions(
        confirmLabelKey: confirmText ?? 'confirm',
        cancelLabelKey: cancelText ?? 'cancel',
        isDestructive: isDestructive,
        showCancelButton: showCancelButton,
        cancelResult: false,
        onCancel: onCancel,
        onConfirm: () {
          onConfirm?.call();
          NavigationHelper.back(context, result: true);
        },
      ),
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
  final result = await NavigationHelper.showAppDialog<bool>(
    context: context,
    child: ConfirmationDialog(
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
