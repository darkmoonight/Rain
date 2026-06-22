import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/color_converter.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/features/settings/presentation/widgets/app_widget_color_picker.dart';
import 'package:rain/features/settings/presentation/widgets/settings_list_dialog_shell.dart';
import 'package:rain/features/settings/presentation/widgets/widget_color_picker_ui.dart';
import 'package:rain/i18n/tr.dart';

/// Opens the widget color picker used on the widget settings page.
Future<void> showWidgetColorPicker({
  required BuildContext context,
  required String titleKey,
  required Color initialColor,
  required Future<void> Function(String color) onSave,
  required Future<void> Function() onReset,
  bool allowTransparent = false,
}) async {
  await NavigationHelper.showAppDialog<void>(
    context: context,
    child: _WidgetColorPickerDialog(
      titleKey: titleKey,
      initialColor: initialColor,
      onSave: onSave,
      onReset: onReset,
      allowTransparent: allowTransparent,
    ),
  );
}

class _WidgetColorPickerDialog extends StatefulWidget {
  const _WidgetColorPickerDialog({
    required this.titleKey,
    required this.initialColor,
    required this.onSave,
    required this.onReset,
    this.allowTransparent = false,
  });

  final String titleKey;
  final Color initialColor;
  final Future<void> Function(String color) onSave;
  final Future<void> Function() onReset;
  final bool allowTransparent;

  @override
  State<_WidgetColorPickerDialog> createState() =>
      _WidgetColorPickerDialogState();
}

class _WidgetColorPickerDialogState extends State<_WidgetColorPickerDialog> {
  String? _pickedColorHex;
  late bool _transparentSelected;

  @override
  void initState() {
    super.initState();
    _transparentSelected = widget.initialColor.isFullyTransparent;
    if (!_transparentSelected) {
      _pickedColorHex = widget.initialColor.toHex();
    }
  }

  /// Color shown in the picker when the user has not chosen a custom value yet.
  Color _pickerColor(BuildContext context) {
    if (_pickedColorHex != null) return HexColor.fromHex(_pickedColorHex!);
    if (!_transparentSelected && !widget.initialColor.isFullyTransparent) {
      return widget.initialColor;
    }
    return Theme.of(context).colorScheme.surface;
  }

  Future<void> _saveAndClose(String colorHex) async {
    await widget.onSave(colorHex);
    if (mounted) NavigationHelper.back(context);
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.allowTransparent) ...[
              WidgetTransparentOption(
                isSelected: _transparentSelected,
                onTap: () =>
                    _saveAndClose(AppConstants.transparentWidgetColorHex),
              ),
              const SizedBox(height: AppConstants.spacingL),
            ],
            WidgetColorPickerPanel(
              child: AppWidgetColorPicker(
                color: _pickerColor(context),
                onChanged: (color) => setState(() {
                  _pickedColorHex = color.toHex();
                  _transparentSelected = false;
                }),
              ),
            ),
          ],
        ),
      ),
      footer: SettingsListDialogCancelSaveActions(
        onSave: () async {
          final colorHex = _pickedColorHex;
          if (colorHex == null) return;
          await _saveAndClose(colorHex);
        },
        leading: IconButton(
          icon: const Icon(IconsaxPlusLinear.rotate_left),
          tooltip: 'resetToMaterialYou'.tr,
          onPressed: () async {
            await widget.onReset();
            if (mounted) NavigationHelper.back(context);
          },
        ),
      ),
    );
  }
}
