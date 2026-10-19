import 'package:rain/core/services/forecast_notification_time.dart';
import 'package:rain/core/services/notification_weekdays.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/data/models/db.dart';

class WeatherNotificationSlot {
  const WeatherNotificationSlot({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.scheduleEpochMillis,
  });

  final String title;
  final String body;

  /// Forecast hour in location wall-clock (naive, same as Open-Meteo `time` strings).
  final DateTime time;
  final String icon;

  /// UTC epoch used with [flutter_local_notifications] for this hour.
  final int scheduleEpochMillis;
}

/// Text and icon for the ongoing persistent weather notification.
class PersistentNotificationContent {
  const PersistentNotificationContent({
    required this.title,
    required this.body,
    required this.icon,
  });

  final String title;
  final String body;
  final String icon;
}

typedef ForecastNotificationPlan = ({
  ForecastAlarmContext alarm,
  List<WeatherNotificationSlot> slots,
});

/// Shared [StatusWeather] / [StatusData] formatters for notification text.
({StatusWeather weather, StatusData data}) _notificationFormatters(
  Settings settings,
) => (
  weather: StatusWeather.forTheme(settings.weatherIconTheme),
  data: StatusData(settings: settings),
);

String _weatherNotificationTitle(
  String cityLabel,
  StatusData data,
  double? temperature,
) => '$cityLabel: ${data.getDegree(temperature)}';

String _weatherNotificationIcon({
  required StatusWeather weather,
  required MainWeatherCache cache,
  required int hourIndex,
  required int dayIndex,
}) => weather.getImageNotification(
  cache.weathercode![hourIndex],
  cache.time![hourIndex],
  cache.sunrise![dayIndex],
  cache.sunset![dayIndex],
);

WeatherNotificationSlot _buildNotificationSlot({
  required MainWeatherCache cache,
  required int hourIndex,
  required int dayIndex,
  required DateTime notificationTime,
  required DateTime wallNow,
  required int scheduleEpochMillis,
  required String cityLabel,
  required StatusWeather weather,
  required StatusData data,
}) {
  return WeatherNotificationSlot(
    title: _weatherNotificationTitle(
      cityLabel,
      data,
      cache.temperature2M![hourIndex],
    ),
    body:
        '${weather.getText(cache.weathercode![hourIndex])} · ${data.formatForecastSlotLabel(notificationTime, wallNow)}',
    time: notificationTime,
    icon: _weatherNotificationIcon(
      weather: weather,
      cache: cache,
      hourIndex: hourIndex,
      dayIndex: dayIndex,
    ),
    scheduleEpochMillis: scheduleEpochMillis,
  );
}

/// Builds notification slots from cached hourly forecast data.
///
/// Only forecast hours whose start is still in the future are included — enabling
/// notifications mid-hour does not fire a catch-up alert for that hour.
List<WeatherNotificationSlot> buildWeatherNotificationSlots({
  required MainWeatherCache cache,
  required Settings settings,
  required AppSettingsState appSettings,
  required String cityLabel,
  ForecastAlarmContext? alarmContext,
  DateTime? now,
}) {
  if (!WeatherCacheValidator.hasNotificationSlotData(cache)) return [];

  final alarm =
      alarmContext ?? forecastAlarmContext(cache, settings, wallNow: now);
  final formatters = _notificationFormatters(settings);
  final startHour = TimeIndexHelper.parseTime(appSettings.timeStart).hour;
  final endHour = TimeIndexHelper.parseTime(appSettings.timeEnd).hour;
  final slots = <WeatherNotificationSlot>[];
  final seenScheduleEpochs = <int>{};

  for (var i = 0; i < cache.time!.length; i += appSettings.timeRange) {
    final notificationTime = TimeIndexHelper.parseForecastDateTime(
      cache.time![i],
    );
    if (!isForecastNotificationInFuture(
      notificationTime,
      cache.timezone,
      utcOffsetSeconds: cache.utcOffsetSeconds,
      referenceNowMillis: alarm.nowMillis,
    )) {
      continue;
    }
    final scheduleEpochMillis = forecastAlarmEpoch(notificationTime, cache);
    if (!isHourInNotificationWindow(
      notificationTime.hour,
      startHour,
      endHour,
    )) {
      continue;
    }

    if (!isNotificationWeekdayEnabled(
      notificationTime.weekday,
      settings.notificationWeekdaysMask,
    )) {
      continue;
    }

    final dayIndex = TimeIndexHelper.indexOfCalendarDay(
      cache.timeDaily!,
      TimeIndexHelper.parseForecastDate(cache.time![i]),
    );
    if (dayIndex < 0) continue;
    if (!seenScheduleEpochs.add(scheduleEpochMillis)) continue;

    slots.add(
      _buildNotificationSlot(
        cache: cache,
        hourIndex: i,
        dayIndex: dayIndex,
        notificationTime: notificationTime,
        wallNow: alarm.wallNow,
        scheduleEpochMillis: scheduleEpochMillis,
        cityLabel: cityLabel,
        weather: formatters.weather,
        data: formatters.data,
      ),
    );
  }

  return slots;
}

/// Builds the alarm context and notification slots for the current cache.
ForecastNotificationPlan buildForecastNotificationPlan({
  required MainWeatherCache cache,
  required Settings settings,
  required AppSettingsState appSettings,
  required String cityLabel,
}) {
  final alarm = forecastAlarmContext(cache, settings);
  final slots = buildWeatherNotificationSlots(
    cache: cache,
    settings: settings,
    appSettings: appSettings,
    cityLabel: cityLabel,
    alarmContext: alarm,
  );
  return (alarm: alarm, slots: slots);
}

PersistentNotificationContent? buildPersistentNotificationContent({
  required MainWeatherCache cache,
  required Settings settings,
  required String cityLabel,
}) {
  if (!WeatherCacheValidator.hasPersistentNotificationData(cache)) return null;

  final alarm = forecastAlarmContext(cache, settings);
  final indices = TimeIndexHelper.currentIndices(
    hourly: cache.time!,
    daily: cache.timeDaily!,
    clock: alarm.clock,
  );
  final hourIndex = indices.hour.clamp(0, cache.time!.length - 1);
  final day = indices.day.clamp(0, cache.timeDaily!.length - 1);
  final formatters = _notificationFormatters(settings);

  return PersistentNotificationContent(
    title: _weatherNotificationTitle(
      cityLabel,
      formatters.data,
      cache.temperature2M![hourIndex],
    ),
    body: formatters.weather.getText(cache.weathercode![hourIndex]),
    icon: _weatherNotificationIcon(
      weather: formatters.weather,
      cache: cache,
      hourIndex: hourIndex,
      dayIndex: day,
    ),
  );
}

/// Schedules, reschedules, and cancels local weather notifications.
