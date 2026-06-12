import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rain/core/i18n/locale_format_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart' as tz;

/// Open-Meteo timezone metadata used for wall-clock calculations.
///
/// Prefer [utcOffsetSeconds] from the API; [timezone] is a fallback when offset
/// is missing. [clockSkewSeconds] corrects a wrong device clock using the HTTP
/// `Date` header from the last weather fetch.
class LocationClock {
  const LocationClock({
    this.timezone,
    this.utcOffsetSeconds,
    this.clockSkewSeconds = 0,
  });

  final String? timezone;
  final int? utcOffsetSeconds;
  final int clockSkewSeconds;

  /// Builds a clock context from cached forecast metadata.
  ///
  /// Uses per-fetch [clockSkewSeconds] when present; otherwise falls back to
  /// [settingsClockSkewSeconds] from the last successful network refresh.
  factory LocationClock.fromCache({
    required String? timezone,
    int? utcOffsetSeconds,
    int? clockSkewSeconds,
    int settingsClockSkewSeconds = 0,
  }) => LocationClock(
    timezone: timezone,
    utcOffsetSeconds: utcOffsetSeconds,
    clockSkewSeconds: clockSkewSeconds ?? settingsClockSkewSeconds,
  );

  factory LocationClock.fromWeatherCard(
    WeatherCard card, {
    int settingsClockSkewSeconds = 0,
  }) => LocationClock.fromCache(
    timezone: card.timezone,
    utcOffsetSeconds: card.utcOffsetSeconds,
    clockSkewSeconds: card.clockSkewSeconds,
    settingsClockSkewSeconds: settingsClockSkewSeconds,
  );

  factory LocationClock.fromMainWeather(
    MainWeatherCache cache, {
    int settingsClockSkewSeconds = 0,
  }) => LocationClock.fromCache(
    timezone: cache.timezone,
    utcOffsetSeconds: cache.utcOffsetSeconds,
    clockSkewSeconds: cache.clockSkewSeconds,
    settingsClockSkewSeconds: settingsClockSkewSeconds,
  );
}

/// Resolves hourly/daily indices and formats times in the location timezone.
class TimeIndexHelper {
  /// Index of the current hour in an ISO time series for [clock].
  static int getTime(List<String> time, LocationClock clock) {
    if (time.isEmpty) return 0;

    final now = wallClockNow(clock);

    final exact = time.indexWhere((entry) {
      final parts = _parseIsoParts(entry);
      return parts.year == now.year &&
          parts.month == now.month &&
          parts.day == now.day &&
          parts.hour == now.hour;
    });
    if (exact >= 0) return exact;

    var fallback = 0;
    for (var i = 0; i < time.length; i++) {
      final parts = _parseIsoParts(time[i]);
      if (parts.year == now.year &&
          parts.month == now.month &&
          parts.day == now.day &&
          parts.hour <= now.hour) {
        fallback = i;
      }
    }
    return fallback.clamp(0, time.length - 1);
  }

  /// Index of today in a daily date series for [clock].
  static int getDay(List<DateTime> time, LocationClock clock) {
    if (time.isEmpty) return 0;

    final now = wallClockNow(clock);

    final exact = time.indexWhere(
      (entry) =>
          entry.year == now.year &&
          entry.month == now.month &&
          entry.day == now.day,
    );
    if (exact >= 0) return exact;

    final fallback = time.indexWhere(
      (entry) =>
          entry.year > now.year ||
          (entry.year == now.year && entry.month > now.month) ||
          (entry.year == now.year &&
              entry.month == now.month &&
              entry.day >= now.day),
    );
    if (fallback >= 0) return fallback;

    return (time.length - 1).clamp(0, time.length - 1);
  }

  /// Resolves the current hourly and daily slot indices for [clock].
  static ({int hour, int day}) currentIndices({
    required List<String> hourly,
    required List<DateTime> daily,
    required LocationClock clock,
  }) => (hour: getTime(hourly, clock), day: getDay(daily, clock));

  /// Whether [hourIndex]/[dayIndex] match [clock]'s current forecast slots.
  static bool isCurrentTimeSlot({
    required List<String> hourly,
    required List<DateTime> daily,
    required LocationClock clock,
    required int hourIndex,
    required int dayIndex,
  }) {
    final current = currentIndices(hourly: hourly, daily: daily, clock: clock);
    return hourIndex == current.hour && dayIndex == current.day;
  }

  /// Current wall clock in the location, aligned with Open-Meteo offsets.
  static DateTime wallClockNow(LocationClock clock) {
    final utc = DateTime.now().toUtc().add(
      Duration(seconds: clock.clockSkewSeconds),
    );
    if (clock.utcOffsetSeconds != null) {
      return utc.add(Duration(seconds: clock.utcOffsetSeconds!));
    }
    if (clock.timezone != null) {
      final tzNow = tz.TZDateTime.from(utc, tz.getLocation(clock.timezone!));
      return DateTime(
        tzNow.year,
        tzNow.month,
        tzNow.day,
        tzNow.hour,
        tzNow.minute,
        tzNow.second,
      );
    }
    return utc.toLocal();
  }

  /// Parses an Open-Meteo daily `YYYY-MM-DD` string as a calendar date.
  static DateTime parseCalendarDate(String value) {
    final parts = value.split('T').first.split('-');
    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  /// Calendar date from an Open-Meteo hourly ISO string (location-local).
  static DateTime parseForecastDate(String iso) {
    final parts = _parseIsoParts(iso);
    return DateTime(parts.year, parts.month, parts.day);
  }

  /// Formats a calendar [date] for the app locale (ignores device timezone).
  static String formatCalendarDate(DateTime date, String languageCode) =>
      LocaleFormatHelper.calendarDate(date, languageCode);

  /// Formats when forecast data was last saved to cache (date + clock time).
  static String formatUpdatedAt(
    DateTime updatedAt,
    Settings settings,
    String languageCode,
  ) {
    final date = DateFormat.yMMMd(languageCode).format(updatedAt);
    final time = formatDateTime(updatedAt, settings, languageCode);
    return '$date, $time';
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

  /// Formats a location wall clock for display.
  static String formatWallClock(
    DateTime wallClock,
    Settings settings,
    String languageCode,
  ) => formatDateTime(
    DateTime(2000, 1, 1, wallClock.hour, wallClock.minute),
    settings,
    languageCode,
  );

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

  /// Extracts wall-clock parts from an Open-Meteo ISO string (location-local).
  static _IsoParts _parseIsoParts(String value) {
    final datePart = value.contains('T') ? value.split('T').first : value;
    final timePart = value.contains('T')
        ? value.split('T').last.split('.').first.split('Z').first
        : '00:00';
    final dateBits = datePart.split('-');
    final timeBits = timePart.split(':');
    return _IsoParts(
      int.parse(dateBits[0]),
      int.parse(dateBits[1]),
      int.parse(dateBits[2]),
      int.parse(timeBits[0]),
    );
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
