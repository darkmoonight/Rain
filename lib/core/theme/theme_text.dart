import 'package:flutter/material.dart';

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
}
