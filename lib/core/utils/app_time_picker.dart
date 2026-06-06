import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/weather/time_index_helper.dart';

/// Shows a time picker respecting the user's 12/24-hour preference.
Future<TimeOfDay?> showAppTimePicker({
  required BuildContext context,
  required WidgetRef ref,
  required TimeOfDay initialTime,
}) {
  final settings = ref.read(settingsProvider);
  final use12Hour = TimeIndexHelper.is12HourFormat(settings);

  return showTimePicker(
    context: context,
    initialTime: initialTime,
    builder: (context, child) {
      if (child == null) return const SizedBox.shrink();

      Widget wrapped = MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(alwaysUse24HourFormat: !use12Hour),
        child: child,
      );

      if (use12Hour && _materialPickerDefaultsTo24h(context)) {
        // Force en_US locale so Material time picker shows AM/PM on locales
        // whose MaterialLocalizations default to 24-hour format.
        wrapped = Localizations.override(
          context: context,
          locale: const Locale('en', 'US'),
          child: wrapped,
        );
      }

      return wrapped;
    },
  );
}

/// Whether the platform Material localizations default to 24-hour time.
bool _materialPickerDefaultsTo24h(BuildContext context) {
  final format = MaterialLocalizations.of(
    context,
  ).timeOfDayFormat(alwaysUse24HourFormat: false);
  return switch (format) {
    TimeOfDayFormat.h_colon_mm_space_a ||
    TimeOfDayFormat.a_space_h_colon_mm => false,
    _ => true,
  };
}
