import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/color_converter.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/responsive_utils.dart';
import 'package:rain/features/settings/presentation/widgets/settings_list_dialog_shell.dart';
import 'package:rain/i18n/tr.dart';

Future<void> showWidgetColorPicker({
  required BuildContext context,
  required String titleKey,
  required Color initialColor,
  required Future<void> Function(String color) onSave,
  required Future<void> Function() onReset,
}) async {
  await NavigationHelper.showAppDialog<void>(
    context: context,
    child: _WidgetColorPickerDialog(
      titleKey: titleKey,
      initialColor: initialColor,
      onSave: onSave,
      onReset: onReset,
    ),
  );
}

class _WidgetColorPickerDialog extends StatefulWidget {
  const _WidgetColorPickerDialog({
    required this.titleKey,
    required this.initialColor,
    required this.onSave,
    required this.onReset,
  });

  final String titleKey;
  final Color initialColor;
  final Future<void> Function(String color) onSave;
  final Future<void> Function() onReset;

  @override
  State<_WidgetColorPickerDialog> createState() =>
      _WidgetColorPickerDialogState();
}

class _WidgetColorPickerDialogState extends State<_WidgetColorPickerDialog> {
  String? _pickedColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SettingsListDialogShell(
      maxHeightFraction: 0.85,
      header: SettingsListDialogHeader(
        title: widget.titleKey.tr,
        icon: IconsaxPlusLinear.colorfilter,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppConstants.spacingXXL,
          0,
          AppConstants.spacingXXL,
          AppConstants.spacingS,
        ),
        child: ColorPicker(
          color: widget.initialColor,
          onChanged: (color) => _pickedColor = color.toHex(),
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppConstants.spacingXXL,
          AppConstants.spacingS,
          AppConstants.spacingXXL,
          AppConstants.spacingXXL,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(IconsaxPlusLinear.rotate_left),
              tooltip: 'resetToMaterialYou'.tr,
              onPressed: () async {
                await widget.onReset();
                if (context.mounted) NavigationHelper.back(context);
              },
            ),
            const SizedBox(width: AppConstants.spacingS),
            FilledButton.tonal(
              onPressed: () async {
                final color = _pickedColor;
                if (color == null) return;
                await widget.onSave(color);
                if (context.mounted) NavigationHelper.back(context);
              },
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingXL,
                  vertical: AppConstants.spacingM,
                ),
                backgroundColor: colorScheme.primaryContainer,
                foregroundColor: colorScheme.onPrimaryContainer,
              ),
              child: Text(
                'save'.tr,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(context, 14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
