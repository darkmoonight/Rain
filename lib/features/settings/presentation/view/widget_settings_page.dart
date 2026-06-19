import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/config/widget_color_sections.dart';
import 'package:rain/core/config/widget_registry.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/services/background_platform_service.dart';
import 'package:rain/core/utils/color_converter.dart';
import 'package:rain/core/utils/show_snack_bar.dart';
import 'package:rain/features/settings/presentation/widgets/settings_secondary_app_bar.dart';
import 'package:rain/features/settings/presentation/widgets/settings_section.dart';
import 'package:rain/features/settings/presentation/widgets/settings_tile.dart';
import 'package:rain/features/settings/presentation/widgets/widget_color_picker_dialog.dart';
import 'package:rain/i18n/tr.dart';

/// Android home-screen widget configuration and pin-to-home actions.
class WidgetSettingsPage extends ConsumerStatefulWidget {
  const WidgetSettingsPage({super.key});

  @override
  ConsumerState<WidgetSettingsPage> createState() => _WidgetSettingsPageState();
}

/// State for [WidgetSettingsPage] managing widget colors and pin actions.
class _WidgetSettingsPageState extends ConsumerState<WidgetSettingsPage> {
  WidgetSettingsService get _service => ref.read(widgetSettingsServiceProvider);

  /// Runs a widget action and shows a success or error snackbar.
  Future<void> _runWidgetAction(
    Future<bool> Function() action, {
    required String successKey,
    String failureKey = 'error_occurred',
    bool showSuccess = true,
  }) async {
    final ok = await action();
    if (!mounted) return;
    if (ok && showSuccess) {
      showSnackBar(successKey.tr, isInfo: true);
    } else if (!ok) {
      showSnackBar(failureKey.tr, isError: true);
    }
  }

  /// Pins a widget to the home screen, then pushes the latest data to it.
  Future<void> _requestPinWidget(WidgetDefinition widget) async {
    if (!Platform.isAndroid) return;

    final supported = await HomeWidget.isRequestPinWidgetSupported() ?? false;
    if (!supported || !mounted) return;

    await HomeWidget.requestPinWidget(
      name: widget.androidName,
      androidName: widget.androidName,
      qualifiedAndroidName: widget.qualifiedAndroidName,
    );
    await _service.refreshWidgets();
  }

  Color _resolvedColor(String hex, Color fallback) =>
      hex.isEmpty ? fallback : HexColor.fromHex(hex);

  Widget _colorSwatch(String hex, Color fallback) {
    final outline = Theme.of(context).colorScheme.outlineVariant;
    return CircleAvatar(
      backgroundColor: outline.withValues(alpha: 0.4),
      radius: 11,
      child: CircleAvatar(
        backgroundColor: _resolvedColor(hex, fallback),
        radius: 10,
      ),
    );
  }

  /// Builds one background or text color tile inside a theme section.
  SettingsTile _colorTile({
    required IconData leading,
    required String titleKey,
    required String colorHex,
    required Color previewFallback,
    required Future<void> Function(String) onSave,
    required Future<void> Function() onReset,
  }) {
    return SettingsTile(
      leading: Icon(leading),
      title: titleKey,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _colorSwatch(colorHex, previewFallback),
          const SizedBox(width: 8),
          Icon(
            IconsaxPlusLinear.arrow_right_3,
            size: 20,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ],
      ),
      onTap: () => showWidgetColorPicker(
        context: context,
        titleKey: titleKey,
        initialColor: _resolvedColor(colorHex, previewFallback),
        onSave: onSave,
        onReset: onReset,
      ),
    );
  }

  /// Builds the light or dark widget color [SettingsSection].
  Widget _buildColorSection(WidgetColorSectionDefinition definition) {
    final settings = ref.watch(appSettingsProvider);

    return SettingsSection(
      title: definition.sectionTitleKey,
      icon: definition.sectionIcon,
      children: [
        _colorTile(
          leading: IconsaxPlusLinear.bucket_square,
          titleKey: definition.backgroundTitleKey,
          colorHex: definition.backgroundHex(settings),
          previewFallback: definition.previewBackground,
          onSave: definition.saveBackground(_service),
          onReset: () => definition.resetBackground(_service)(),
        ),
        _colorTile(
          leading: IconsaxPlusLinear.text_block,
          titleKey: definition.textTitleKey,
          colorHex: definition.textHex(settings),
          previewFallback: definition.previewText,
          onSave: definition.saveText(_service),
          onReset: () => definition.resetText(_service)(),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) =>
      SettingsSecondaryAppBar(title: 'widget'.tr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            SettingsSection(
              title: 'widget',
              icon: IconsaxPlusBold.setting_3,
              children: [
                ...rainWidgetRegistry.map(
                  (widget) => SettingsTile(
                    leading: const Icon(IconsaxPlusLinear.add_square),
                    title: widget.labelKey.tr,
                    onTap: () => _requestPinWidget(widget),
                  ),
                ),
                SettingsTile(
                  leading: const Icon(IconsaxPlusLinear.refresh),
                  title: 'reloadWidget',
                  onTap: () => _runWidgetAction(
                    _service.refreshWidgets,
                    successKey: 'reloadWidgetSuccess',
                    failureKey: 'reloadWidgetFailed',
                  ),
                ),
                SettingsTile(
                  leading: const Icon(IconsaxPlusLinear.battery_full),
                  title: 'widgetBattery',
                  subtitle: 'widgetBatteryHint',
                  onTap: () => _runWidgetAction(
                    openBatterySettings,
                    successKey: 'widgetBattery',
                    showSuccess: false,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacingL),
            for (final definition in WidgetColorSectionDefinition.sections) ...[
              _buildColorSection(definition),
              const SizedBox(height: AppConstants.spacingL),
            ],
            SettingsSection(
              title: 'resetColor',
              icon: IconsaxPlusBold.rotate_left,
              children: [
                SettingsTile(
                  leading: const Icon(IconsaxPlusLinear.rotate_left),
                  title: 'resetAllWidgetColors',
                  onTap: () => _runWidgetAction(
                    _service.resetAllWidgetColors,
                    successKey: 'resetAllWidgetColorsSuccess',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
