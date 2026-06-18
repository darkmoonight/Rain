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

/// Device UTC epoch; [flutter_local_notifications] validates scheduled times against this clock.
int deviceUtcNowMillis() => DateTime.now().toUtc().millisecondsSinceEpoch;

/// Whether [hour] falls within a notification window that may cross midnight.
///
/// Only whole hours are compared; minutes in [timeStart]/[timeEnd] are ignored.
bool isHourInNotificationWindow(int hour, int startHour, int endHour) {
  if (startHour <= endHour) {
    return hour >= startHour && hour <= endHour;
  }
  return hour >= startHour || hour <= endHour;
}

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

/// Whether [naive] is still in the future at the location (or [referenceNowMillis]).
///
/// Used when building notification slots so past and current hours are skipped
/// using the same UTC-epoch math as [zonedSchedule], not naive device [DateTime].
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

/// Epoch baseline for lead-time bumps (later of location and device clocks).
///
/// [flutter_local_notifications] validates against the device clock; when the
/// location wall clock lags behind, location-only math produced past [TZDateTime]s.
int notificationReferenceNowMillis({
  required int locationNowMillis,
  required int deviceNowMillis,
}) => locationNowMillis > deviceNowMillis ? locationNowMillis : deviceNowMillis;

/// Resolves the alarm epoch for a forecast hour, or null when its start already passed.
///
/// Near-future hours are bumped to [forecastNotificationMinimumLeadMillis] ahead of
/// the later of location and device clocks so the plugin accepts the [TZDateTime].
int? resolveAlarmEpochMillis({
  required int nowMillis,
  required int deviceNowMillis,
  required int slotEpochMillis,
}) {
  final referenceNow = notificationReferenceNowMillis(
    locationNowMillis: nowMillis,
    deviceNowMillis: deviceNowMillis,
  );
  final minimumSchedule = referenceNow + forecastNotificationMinimumLeadMillis;

  if (slotEpochMillis <= nowMillis) return null;
  if (slotEpochMillis < minimumSchedule) {
    return minimumSchedule;
  }
  return slotEpochMillis;
}

/// Last guard before [zonedSchedule]; returns null when the instant is too far in the past.
int? alignScheduleEpochForPlugin({
  required int scheduleEpochMillis,
  required int deviceNowMillis,
}) {
  final minimum = deviceNowMillis + forecastNotificationMinimumLeadMillis;
  if (scheduleEpochMillis >= minimum) return scheduleEpochMillis;
  if (scheduleEpochMillis > deviceNowMillis) return minimum;
  return null;
}

/// IANA timezone for forecast alarms, falling back to [tz.local].
tz.Location notificationTzLocation(String? timezone) {
  if (timezone != null) {
    try {
      return tz.getLocation(timezone);
    } catch (_) {}
  }
  return tz.local;
}
