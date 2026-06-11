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
}
