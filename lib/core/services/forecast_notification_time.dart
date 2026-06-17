import 'package:flutter/foundation.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:timezone/timezone.dart' as tz;

/// Wall-clock context shared when filtering and scheduling forecast alarms.
typedef ForecastAlarmContext = ({
  LocationClock clock,
  DateTime wallNow,
  int nowMillis,
});

/// Minimum lead time before a forecast alarm (avoids plugin "must be in the future" races).
const forecastNotificationMinimumLeadMillis = 60000;

/// Whether [hour] falls within a notification window that may cross midnight.
///
/// Only whole hours are compared; minutes in [timeStart]/[timeEnd] are ignored.
bool isHourInNotificationWindow(int hour, int startHour, int endHour) {
  if (startHour <= endHour) {
    return hour >= startHour && hour <= endHour;
  }
  return hour >= startHour || hour <= endHour;
}

/// Whether [a] and [b] share the same forecast wall-clock hour.
bool isSameForecastClockHour(DateTime a, DateTime b) =>
    a.year == b.year &&
    a.month == b.month &&
    a.day == b.day &&
    a.hour == b.hour;

/// UTC epoch for when the Open-Meteo hourly timestamp occurs at the location.
///
/// Hourly `time` strings follow [utcOffsetSeconds] from the API response; that
/// offset is preferred over IANA [timezone] so alarm instants match the forecast.
int forecastScheduleEpochMillis(
  DateTime naive,
  String? timezone, {
  int? utcOffsetSeconds,
}) {
  if (utcOffsetSeconds != null) {
    return DateTime.utc(
          naive.year,
          naive.month,
          naive.day,
          naive.hour,
          naive.minute,
        ).millisecondsSinceEpoch -
        (utcOffsetSeconds * 1000);
  }
  if (timezone != null) {
    try {
      final location = tz.getLocation(timezone);
      return tz.TZDateTime(
        location,
        naive.year,
        naive.month,
        naive.day,
        naive.hour,
        naive.minute,
      ).millisecondsSinceEpoch;
    } catch (_) {}
  }
  return tz.TZDateTime.from(naive, tz.local).millisecondsSinceEpoch;
}

/// Location wall-clock "now" as a UTC epoch (same basis as [forecastScheduleEpochMillis]).
int notificationNowEpochMillis({
  required LocationClock clock,
  required String? timezone,
  required int? utcOffsetSeconds,
  DateTime? wallNow,
}) {
  final wall = wallNow ?? TimeIndexHelper.wallClockNow(clock);
  return forecastScheduleEpochMillis(
    wall,
    timezone,
    utcOffsetSeconds: utcOffsetSeconds,
  );
}

/// Whether [naive] is still in the future for [flutter_local_notifications].
@visibleForTesting
bool isForecastNotificationInFuture(
  DateTime naive,
  String? timezone, {
  int? utcOffsetSeconds,
  int? referenceNowMillis,
  LocationClock? clock,
}) {
  final scheduleMillis = forecastScheduleEpochMillis(
    naive,
    timezone,
    utcOffsetSeconds: utcOffsetSeconds,
  );
  final nowMillis =
      referenceNowMillis ??
      notificationNowEpochMillis(
        clock:
            clock ??
            LocationClock(
              timezone: timezone,
              utcOffsetSeconds: utcOffsetSeconds,
            ),
        timezone: timezone,
        utcOffsetSeconds: utcOffsetSeconds,
      );
  return scheduleMillis > nowMillis;
}

/// Builds [ForecastAlarmContext] for [cache] using the location wall clock.
ForecastAlarmContext forecastAlarmContext(
  MainWeatherCache cache,
  Settings settings, {
  DateTime? wallNow,
}) {
  final clock = LocationClock.fromMainWeather(
    cache,
    settingsClockSkewSeconds: settings.clockSkewSeconds,
  );
  final wall = wallNow ?? TimeIndexHelper.wallClockNow(clock);
  return (
    clock: clock,
    wallNow: wall,
    nowMillis: notificationNowEpochMillis(
      clock: clock,
      timezone: cache.timezone,
      utcOffsetSeconds: cache.utcOffsetSeconds,
      wallNow: wall,
    ),
  );
}

/// Epoch for a forecast hour in [cache]'s timezone metadata.
int forecastAlarmEpoch(DateTime naive, MainWeatherCache cache) =>
    forecastScheduleEpochMillis(
      naive,
      cache.timezone,
      utcOffsetSeconds: cache.utcOffsetSeconds,
    );

/// Resolves the alarm epoch for [slotTime], or null when the slot should be skipped.
///
/// Past hours are dropped except the active hour (once per reschedule). Future
/// hours are bumped to [forecastNotificationMinimumLeadMillis] ahead of [nowMillis].
int? resolveAlarmEpochMillis({
  required DateTime slotTime,
  required DateTime wallNow,
  required int nowMillis,
  required int realNowMillis,
  required int slotEpochMillis,
  required bool currentHourAlreadyScheduled,
}) {
  if (slotEpochMillis <= nowMillis) {
    if (!isSameForecastClockHour(slotTime, wallNow) ||
        currentHourAlreadyScheduled) {
      return null;
    }
    return (nowMillis > realNowMillis ? nowMillis : realNowMillis) +
        forecastNotificationMinimumLeadMillis;
  }
  if (slotEpochMillis < nowMillis + forecastNotificationMinimumLeadMillis) {
    return nowMillis + forecastNotificationMinimumLeadMillis;
  }
  return slotEpochMillis;
}

/// True when [scheduleEpochMillis] is strictly after the device clock.
bool isAlarmEpochInFuture(int scheduleEpochMillis) =>
    scheduleEpochMillis > DateTime.now().toUtc().millisecondsSinceEpoch;
