import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/utils/color_converter.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/i18n/tr.dart';

/// Opens an HSV picker for a widget color slot with save and Material You reset.
void showWidgetColorPicker({
  required BuildContext context,
  required String titleKey,
  required Color initialColor,
  required Future<void> Function(String color) onSave,
  required Future<void> Function() onReset,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) => _WidgetColorPickerDialog(
      titleKey: titleKey,
      initialColor: initialColor,
      onSave: onSave,
      onReset: onReset,
    ),
  );
}

/// Dialog content for picking a single widget background or text color.
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
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                widget.titleKey.tr,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ColorPicker(
                color: widget.initialColor,
                onChanged: (color) => _pickedColor = color.toHex(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(IconsaxPlusLinear.rotate_left),
                  tooltip: 'resetToMaterialYou'.tr,
                  onPressed: () async {
                    await widget.onReset();
                    if (context.mounted) NavigationHelper.back(context);
                  },
                ),
                IconButton(
                  icon: const Icon(IconsaxPlusLinear.tick_square),
                  onPressed: () async {
                    final color = _pickedColor;
                    if (color == null) return;
                    await widget.onSave(color);
                    if (context.mounted) NavigationHelper.back(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
