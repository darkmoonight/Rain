import 'package:flutter/material.dart' as flutter;
import 'package:material_ui/material_ui.dart';

/// Converts a Flutter SDK [flutter.TextTheme] into a `material_ui` [TextTheme].
TextTheme textThemeFromFlutter(flutter.TextTheme theme) {
  return TextTheme(
    displayLarge: theme.displayLarge,
    displayMedium: theme.displayMedium,
    displaySmall: theme.displaySmall,
    headlineLarge: theme.headlineLarge,
    headlineMedium: theme.headlineMedium,
    headlineSmall: theme.headlineSmall,
    titleLarge: theme.titleLarge,
    titleMedium: theme.titleMedium,
    titleSmall: theme.titleSmall,
    bodyLarge: theme.bodyLarge,
    bodyMedium: theme.bodyMedium,
    bodySmall: theme.bodySmall,
    labelLarge: theme.labelLarge,
    labelMedium: theme.labelMedium,
    labelSmall: theme.labelSmall,
  );
}

/// Converts a `material_ui` [TextTheme] into a Flutter SDK [flutter.TextTheme]
/// for packages that still use `package:flutter/material.dart` (e.g. Google Fonts).
flutter.TextTheme textThemeToFlutter(TextTheme theme) {
  return flutter.TextTheme(
    displayLarge: theme.displayLarge,
    displayMedium: theme.displayMedium,
    displaySmall: theme.displaySmall,
    headlineLarge: theme.headlineLarge,
    headlineMedium: theme.headlineMedium,
    headlineSmall: theme.headlineSmall,
    titleLarge: theme.titleLarge,
    titleMedium: theme.titleMedium,
    titleSmall: theme.titleSmall,
    bodyLarge: theme.bodyLarge,
    bodyMedium: theme.bodyMedium,
    bodySmall: theme.bodySmall,
    labelLarge: theme.labelLarge,
    labelMedium: theme.labelMedium,
    labelSmall: theme.labelSmall,
  );
}
