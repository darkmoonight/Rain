import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/config/widget_registry.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/services/widget_settings_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/utils/color_converter.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/i18n/tr.dart';

/// Android home-screen widget configuration and pin-to-home actions.
class WidgetSettingsPage extends ConsumerStatefulWidget {
  const WidgetSettingsPage({super.key});

  /// Creates the state for [WidgetSettingsPage].
  @override
  ConsumerState<WidgetSettingsPage> createState() => _WidgetSettingsPageState();
}

// --- WidgetSettingsPageState ---

/// State for [WidgetSettingsPage] managing widget colors and pin actions.
class _WidgetSettingsPageState extends ConsumerState<WidgetSettingsPage> {
  String? _pickedBackgroundColor;
  String? _pickedTextColor;

  /// In-memory app settings snapshot watched from Riverpod.
  AppSettingsState get appSettings => ref.watch(appSettingsProvider);

  /// Requests to pin a home-screen widget and refreshes widget data.
  Future<void> _requestPinWidget(WidgetDefinition widget) async {
    if (!Platform.isAndroid) return;

    final supported = await HomeWidget.isRequestPinWidgetSupported() ?? false;
    if (!supported || !mounted) return;

    await HomeWidget.requestPinWidget(
      name: widget.androidName,
      androidName: widget.androidName,
      qualifiedAndroidName: widget.qualifiedAndroidName,
    );
    await ref
        .read(homeWidgetServiceProvider)
        .updateFromIsar(ref.read(isarProvider));
  }

  /// Shows the HSV color picker for widget background color.
  void _showBackgroundPicker() {
    _pickedBackgroundColor = null;
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'widgetBackground'.tr,
                  style: Theme.of(
                    dialogContext,
                  ).textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ColorPicker(
                  color: appSettings.widgetBackgroundColor.isEmpty
                      ? Theme.of(dialogContext).colorScheme.surface
                      : HexColor.fromHex(appSettings.widgetBackgroundColor),
                  onChanged: (color) => _pickedBackgroundColor = color.toHex(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.rotate_left),
                    tooltip: 'resetColor'.tr,
                    onPressed: () {
                      ref
                          .read(widgetSettingsServiceProvider)
                          .resetBackgroundColor();
                      NavigationHelper.back(dialogContext);
                    },
                  ),
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.tick_square),
                    onPressed: () {
                      final color = _pickedBackgroundColor;
                      if (color == null) return;
                      ref
                          .read(widgetSettingsServiceProvider)
                          .updateBackgroundColor(color);
                      NavigationHelper.back(dialogContext);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Shows the HSV color picker for widget text color.
  void _showTextColorPicker() {
    _pickedTextColor = null;
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'widgetText'.tr,
                  style: Theme.of(
                    dialogContext,
                  ).textTheme.titleMedium?.copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ColorPicker(
                  color: appSettings.widgetTextColor.isEmpty
                      ? Theme.of(dialogContext).colorScheme.onSurface
                      : HexColor.fromHex(appSettings.widgetTextColor),
                  onChanged: (color) => _pickedTextColor = color.toHex(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.rotate_left),
                    tooltip: 'resetColor'.tr,
                    onPressed: () {
                      ref.read(widgetSettingsServiceProvider).resetTextColor();
                      NavigationHelper.back(dialogContext);
                    },
                  ),
                  IconButton(
                    icon: const Icon(IconsaxPlusLinear.tick_square),
                    onPressed: () {
                      final color = _pickedTextColor;
                      if (color == null) return;
                      ref
                          .read(widgetSettingsServiceProvider)
                          .updateTextColor(color);
                      NavigationHelper.back(dialogContext);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the widget settings app bar with back navigation.
  AppBar _buildAppBar(BuildContext context) => AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => NavigationHelper.back(context),
      icon: const Icon(IconsaxPlusLinear.arrow_left_3, size: 20),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    title: Text(
      'widget'.tr,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
  );

  /// Builds the widget settings scaffold with pin and color options.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SettingsSection(
          title: 'widget',
          icon: IconsaxPlusBold.setting_3,
          children: [
            ...rainWidgetRegistry.map(
              (widget) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingL,
                  vertical: AppConstants.spacingXS,
                ),
                leading: const Icon(IconsaxPlusLinear.add_square),
                title: Text(widgetDisplayLabels[widget.id] ?? widget.id),
                trailing: const Icon(IconsaxPlusLinear.arrow_right_3, size: 20),
                onTap: () => _requestPinWidget(widget),
              ),
            ),
            SettingsTile(
              leading: const Icon(IconsaxPlusLinear.bucket_square),
              title: 'widgetBackground',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).dividerColor,
                    radius: 11,
                    child: CircleAvatar(
                      backgroundColor: appSettings.widgetBackgroundColor.isEmpty
                          ? Theme.of(context).colorScheme.surface
                          : HexColor.fromHex(appSettings.widgetBackgroundColor),
                      radius: 10,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    IconsaxPlusLinear.arrow_right_3,
                    size: 20,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              onTap: _showBackgroundPicker,
            ),
            SettingsTile(
              leading: const Icon(IconsaxPlusLinear.text_block),
              title: 'widgetText',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).dividerColor,
                    radius: 11,
                    child: CircleAvatar(
                      backgroundColor: appSettings.widgetTextColor.isEmpty
                          ? Theme.of(context).colorScheme.onSurface
                          : HexColor.fromHex(appSettings.widgetTextColor),
                      radius: 10,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    IconsaxPlusLinear.arrow_right_3,
                    size: 20,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              onTap: _showTextColorPicker,
            ),
          ],
        ),
      ),
    );
  }
}
