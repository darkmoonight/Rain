import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/weather/time_index_helper.dart';

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

      // e.g. ru defaults to H_colon_mm even when alwaysUse24HourFormat is false.
      if (use12Hour && _materialPickerDefaultsTo24h(context)) {
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
