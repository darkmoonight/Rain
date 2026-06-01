import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart' as tz;

class TimeIndexHelper {
  static int getTime(List<String> time, String timezone) {
    final tzLocation = tz.getLocation(timezone);
    final tzNow = tz.TZDateTime.now(tzLocation);
    return time.indexWhere((t) {
      final dateTime = DateTime.parse(t);
      return tzNow.hour == dateTime.hour && tzNow.day == dateTime.day;
    });
  }

  static int getDay(List<DateTime> time, String timezone) {
    final tzLocation = tz.getLocation(timezone);
    final tzNow = tz.TZDateTime.now(tzLocation);
    return time.indexWhere((t) => tzNow.day == t.day);
  }

  static TimeOfDay parseTime(String? timeStr) {
    if (timeStr == null) return const TimeOfDay(hour: 0, minute: 0);
    if (timeStr.contains(' ')) {
      final isPM = timeStr.endsWith('PM');
      final timeParts = timeStr.split(' ')[0].split(':');
      var hour = int.parse(timeParts[0]);
      if (isPM) hour += 12;
      final minute = int.parse(timeParts[1]);
      return TimeOfDay(hour: hour % 24, minute: minute);
    }
    final parts = timeStr.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
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
}
