import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart' as tz;

/// Resolves hourly/daily indices and formats times in the location timezone.
class TimeIndexHelper {
  /// Index of the current hour in an ISO time series for [timezone].
  static int getTime(List<String> time, String timezone) =>
      resolveTimeIndex(time, timezone);

  /// Index of today in a daily date series for [timezone].
  static int getDay(List<DateTime> time, String timezone) =>
      resolveDayIndex(time, timezone);

  /// Finds the hourly slot matching now, or the latest past hour today.
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

  /// Finds today's daily slot, or the nearest upcoming/final day.
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

  /// Whether [currentTime] falls between [sunrise] and [sunset].
  static bool isDaytime(String currentTime, String sunrise, String sunset) {
    final current = _minutesOfDay(_timePart(currentTime));
    final rise = _minutesOfDay(_timePart(sunrise));
    final set = _minutesOfDay(_timePart(sunset));
    return current >= rise && current < set;
  }

  /// Parses a time string in 12h, 24h, or ISO form into [TimeOfDay].
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

  /// Formats [time] as an HH:mm string for storage.
  static String timeTo24h(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  /// Whether the user prefers 12-hour clock display.
  static bool is12HourFormat(Settings settings) => settings.timeformat == '12';

  /// Returns the [DateFormat] for app time display in [languageCode].
  static DateFormat appTimeFormat(Settings settings, String languageCode) {
    if (is12HourFormat(settings)) {
      return DateFormat('h:mm a', languageCode);
    }
    return DateFormat('HH:mm', languageCode);
  }

  /// Formats [dateTime] using the user's 12/24-hour preference.
  static String formatDateTime(
    DateTime dateTime,
    Settings settings,
    String languageCode,
  ) => appTimeFormat(settings, languageCode).format(dateTime);

  /// Formats a time-only string using the user's clock preference.
  static String formatTime(
    String? timeStr,
    Settings settings,
    String languageCode,
  ) {
    final time = parseTime(timeStr);
    final dateTime = DateTime(0, 0, 0, time.hour, time.minute);
    return formatDateTime(dateTime, settings, languageCode);
  }

  /// Extracts year/month/day/hour from an ISO datetime string.
  static _IsoParts _parseIsoParts(String value) {
    final dt = DateTime.parse(value);
    return _IsoParts(dt.year, dt.month, dt.day, dt.hour);
  }

  /// Strips the date portion from an ISO or plain time string.
  static String _timePart(String value) {
    if (value.contains('T')) {
      final part = value.split('T').last;
      return part.split('.').first.split('Z').first;
    }
    return value;
  }

  /// Converts a time string to minutes since midnight.
  static int _minutesOfDay(String value) {
    final time = parseTime(value);
    return time.hour * 60 + time.minute;
  }
}

/// Parsed year, month, day, and hour parts from an ISO time string.
class _IsoParts {
  /// Creates ISO date-time parts for index calculations.
  const _IsoParts(this.year, this.month, this.day, this.hour);

  final int year;
  final int month;
  final int day;
  final int hour;
}
