import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart' as tz;

class TimeIndexHelper {
  static int getTime(List<String> time, String timezone) =>
      resolveTimeIndex(time, timezone);

  static int getDay(List<DateTime> time, String timezone) =>
      resolveDayIndex(time, timezone);

  static int resolveTimeIndex(List<String> time, String timezone) {
    if (time.isEmpty) return 0;

    final tzLocation = tz.getLocation(timezone);
    final tzNow = tz.TZDateTime.now(tzLocation);

    final exact = time.indexWhere((entry) {
      final parts = _parseIsoParts(entry);
      return parts.year == tzNow.year &&
          parts.month == tzNow.month &&
          parts.day == tzNow.day &&
          parts.hour == tzNow.hour;
    });
    if (exact >= 0) return exact;

    var fallback = 0;
    for (var i = 0; i < time.length; i++) {
      final parts = _parseIsoParts(time[i]);
      if (parts.year == tzNow.year &&
          parts.month == tzNow.month &&
          parts.day == tzNow.day &&
          parts.hour <= tzNow.hour) {
        fallback = i;
      }
    }
    return fallback.clamp(0, time.length - 1);
  }

  static int resolveDayIndex(List<DateTime> time, String timezone) {
    if (time.isEmpty) return 0;

    final tzLocation = tz.getLocation(timezone);
    final tzNow = tz.TZDateTime.now(tzLocation);

    final exact = time.indexWhere(
      (entry) =>
          entry.year == tzNow.year &&
          entry.month == tzNow.month &&
          entry.day == tzNow.day,
    );
    if (exact >= 0) return exact;

    final fallback = time.indexWhere(
      (entry) =>
          entry.year > tzNow.year ||
          (entry.year == tzNow.year && entry.month > tzNow.month) ||
          (entry.year == tzNow.year &&
              entry.month == tzNow.month &&
              entry.day >= tzNow.day),
    );
    if (fallback >= 0) return fallback;

    return (time.length - 1).clamp(0, time.length - 1);
  }

  static bool isDaytime(String currentTime, String sunrise, String sunset) {
    final current = _minutesOfDay(_timePart(currentTime));
    final rise = _minutesOfDay(_timePart(sunrise));
    final set = _minutesOfDay(_timePart(sunset));
    return current >= rise && current < set;
  }

  static TimeOfDay parseTime(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) {
      return const TimeOfDay(hour: 0, minute: 0);
    }
    final normalized = _timePart(timeStr);
    if (normalized.contains(' ')) {
      final isPM = normalized.endsWith('PM');
      final timeParts = normalized.split(' ')[0].split(':');
      var hour = int.parse(timeParts[0]);
      if (isPM) hour += 12;
      final minute = int.parse(timeParts[1]);
      return TimeOfDay(hour: hour % 24, minute: minute);
    }
    final parts = normalized.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts.length > 1 ? parts[1] : '0'),
    );
  }

  static String timeTo24h(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  static bool is12HourFormat(Settings settings) => settings.timeformat == '12';

  static DateFormat appTimeFormat(Settings settings, String languageCode) {
    if (is12HourFormat(settings)) {
      return DateFormat('h:mm a', languageCode);
    }
    return DateFormat('HH:mm', languageCode);
  }

  static String formatDateTime(
    DateTime dateTime,
    Settings settings,
    String languageCode,
  ) => appTimeFormat(settings, languageCode).format(dateTime);

  static String formatTime(
    String? timeStr,
    Settings settings,
    String languageCode,
  ) {
    final time = parseTime(timeStr);
    final dateTime = DateTime(0, 0, 0, time.hour, time.minute);
    return formatDateTime(dateTime, settings, languageCode);
  }

  static _IsoParts _parseIsoParts(String value) {
    final dt = DateTime.parse(value);
    return _IsoParts(dt.year, dt.month, dt.day, dt.hour);
  }

  static String _timePart(String value) {
    if (value.contains('T')) {
      final part = value.split('T').last;
      return part.split('.').first.split('Z').first;
    }
    return value;
  }

  static int _minutesOfDay(String value) {
    final time = parseTime(value);
    return time.hour * 60 + time.minute;
  }
}

class _IsoParts {
  const _IsoParts(this.year, this.month, this.day, this.hour);

  final int year;
  final int month;
  final int day;
  final int hour;
}
