import 'package:flutter/material.dart';
import 'package:rain/core/utils/responsive_utils.dart';

/// Shared text-style helpers for cards and weather widgets.
class ThemeText {
  ThemeText._();

  /// Muted secondary label (captions, metadata).
  static TextStyle? muted(
    ThemeData theme,
    TextStyle? base, {
    double height = 1.25,
  }) =>
      base?.copyWith(color: theme.colorScheme.onSurfaceVariant, height: height);

  /// Centered app-bar title (detail screens, search, settings sub-pages).
  static TextStyle? appBarTitle(ThemeData theme) => theme.textTheme.titleMedium
      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18);

  /// Primary body text inside settings rows and dialogs.
  static TextStyle? settingsBody(
    BuildContext context, {
    double size = 15,
    FontWeight weight = FontWeight.w600,
    Color? color,
  }) => Theme.of(context).textTheme.bodyLarge?.copyWith(
    fontWeight: weight,
    color: color,
    fontSize: ResponsiveUtils.getResponsiveFontSize(context, size),
  );

  /// Secondary label text inside settings controls.
  static TextStyle? settingsLabel(
    BuildContext context, {
    double size = 13,
    Color? color,
  }) => Theme.of(context).textTheme.bodyMedium?.copyWith(
    fontWeight: FontWeight.w500,
    color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
    fontSize: ResponsiveUtils.getResponsiveFontSize(context, size),
  );

  /// Centered title for empty, error, and loading state views.
  static TextStyle? stateTitle(ThemeData theme) => theme.textTheme.titleMedium
      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18);
}
