import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';

/// Shared card chrome for settings sections and related screens.
abstract final class SettingsCardShape {
  /// Outline used on AMOLED; `null` lets the theme provide the default shape.
  static ShapeBorder? cardShape({
    required bool amoledTheme,
    required ColorScheme colorScheme,
  }) {
    if (!amoledTheme) return null;

    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
      side: BorderSide(
        color: settingsDividerColor(colorScheme),
        width: AppConstants.borderWidthThin,
      ),
    );
  }

  /// Divider color between tiles inside a settings card.
  static Color settingsDividerColor(ColorScheme colorScheme) =>
      colorScheme.outlineVariant.withValues(alpha: 0.3);
}
