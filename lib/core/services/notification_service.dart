import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/services/asset_cache_service.dart';
import 'package:rain/core/settings/app_settings_state.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/core/weather/status_data.dart';
import 'package:rain/core/weather/status_weather.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/weather_icon_theme.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/i18n/locale_utils.dart';
import 'package:rain/i18n/strings.g.dart';
import 'package:isar_community/isar.dart';
import 'package:timezone/timezone.dart' as tz;

/// Payload for a single scheduled weather notification.
class WeatherNotificationSlot {
  const WeatherNotificationSlot({
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
  });

  final String title;
  final String body;
  final DateTime time;
  final String icon;
}

/// Content for the ongoing current-weather notification.
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

/// Whether [hour] falls within a notification window that may cross midnight.
@visibleForTesting
bool isHourInNotificationWindow(int hour, int startHour, int endHour) {
  if (startHour <= endHour) {
    return hour >= startHour && hour <= endHour;
  }
  return hour >= startHour || hour <= endHour;
}

int _dailyIndexForForecastDate(List<DateTime> timeDaily, DateTime date) {
  return timeDaily.indexWhere(
    (entry) =>
        entry.year == date.year &&
        entry.month == date.month &&
        entry.day == date.day,
  );
}

/// Converts a location-local forecast timestamp to a zoned alarm time.
@visibleForTesting
tz.TZDateTime forecastZonedDateTime(DateTime naive, String? timezone) {
  if (timezone != null) {
    try {
      return tz.TZDateTime(
        tz.getLocation(timezone),
        naive.year,
        naive.month,
        naive.day,
        naive.hour,
        naive.minute,
      );
    } catch (_) {}
  }
  return tz.TZDateTime.from(naive, tz.local);
}

/// Builds notification slots from cached hourly forecast data.
List<WeatherNotificationSlot> buildWeatherNotificationSlots({
  required MainWeatherCache cache,
  required Settings settings,
  required AppSettingsState appSettings,
  required String cityLabel,
  DateTime? now,
}) {
  final clock = LocationClock.fromMainWeather(
    cache,
    settingsClockSkewSeconds: settings.clockSkewSeconds,
  );
  final currentTime = now ?? TimeIndexHelper.wallClockNow(clock);
  final startHour = TimeIndexHelper.parseTime(appSettings.timeStart).hour;
  final endHour = TimeIndexHelper.parseTime(appSettings.timeEnd).hour;
  final statusWeather = StatusWeather.forTheme(settings.weatherIconTheme);
  final statusData = StatusData(settings: settings);
  final slots = <WeatherNotificationSlot>[];

  if (cache.time == null ||
      cache.timeDaily == null ||
      cache.temperature2M == null ||
      cache.weathercode == null ||
      cache.sunrise == null ||
      cache.sunset == null) {
    return slots;
  }

  for (var i = 0; i < cache.time!.length; i += appSettings.timeRange) {
    final notificationTime = DateTime.parse(cache.time![i]);
    if (!notificationTime.isAfter(currentTime)) continue;
    if (!isHourInNotificationWindow(
      notificationTime.hour,
      startHour,
      endHour,
    )) {
      continue;
    }

    final dayIndex = _dailyIndexForForecastDate(
      cache.timeDaily!,
      TimeIndexHelper.parseForecastDate(cache.time![i]),
    );
    if (dayIndex < 0) continue;

    slots.add(
      WeatherNotificationSlot(
        title: '$cityLabel: ${statusData.getDegree(cache.temperature2M![i])}',
        body:
            '${statusWeather.getText(cache.weathercode![i])} · ${statusData.getTimeFormat(cache.time![i])}',
        time: notificationTime,
        icon: statusWeather.getImageNotification(
          cache.weathercode![i],
          cache.time![i],
          cache.sunrise![dayIndex],
          cache.sunset![dayIndex],
        ),
      ),
    );
  }

  return slots;
}

/// Builds title/body/icon for the ongoing current-weather notification.
PersistentNotificationContent? buildPersistentNotificationContent({
  required MainWeatherCache cache,
  required Settings settings,
  required String cityLabel,
}) {
  if (cache.time == null ||
      cache.timeDaily == null ||
      cache.temperature2M == null ||
      cache.weathercode == null ||
      cache.sunrise == null ||
      cache.sunset == null ||
      cache.timezone == null) {
    return null;
  }

  final clock = LocationClock.fromMainWeather(
    cache,
    settingsClockSkewSeconds: settings.clockSkewSeconds,
  );
  final hour = TimeIndexHelper.getTime(cache.time!, clock);
  final day = TimeIndexHelper.getDay(
    cache.timeDaily!,
    clock,
  ).clamp(0, cache.timeDaily!.length - 1);
  final hourIndex = hour.clamp(0, cache.time!.length - 1);
  final statusWeather = StatusWeather.forTheme(settings.weatherIconTheme);
  final statusData = StatusData(settings: settings);

  return PersistentNotificationContent(
    title:
        '$cityLabel: ${statusData.getDegree(cache.temperature2M![hourIndex])}',
    body: statusWeather.getText(cache.weathercode![hourIndex]),
    icon: statusWeather.getImageNotification(
      cache.weathercode![hourIndex],
      cache.time![hourIndex],
      cache.sunrise![day],
      cache.sunset![day],
    ),
  );
}

/// Schedules local weather notifications from cached hourly forecast data.
class NotificationService {
  NotificationService(this._assets);

  final AssetCacheService _assets;
  static const forecastChannelId = 'Rain';
  static const forecastChannelName = 'DARK NIGHT';
  static const persistentChannelId = 'RainPersistent';
  static const persistentChannelName = 'Rain Current';

  static const _channelId = forecastChannelId;
  static const _channelName = forecastChannelName;
  static const _persistentChannelId = persistentChannelId;
  static const _persistentChannelName = persistentChannelName;

  /// Android [Notification.FLAG_NO_CLEAR] — not removed by "Clear all".
  static final Int32List _persistentNotificationFlags = Int32List.fromList([
    32,
  ]);

  /// Fixed id for the ongoing current-weather notification.
  static const persistentNotificationId = 1;

  // --- Scheduling ---

  /// Schedules future notifications whose hour falls within the user's start/end hours.
  Future<void> scheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    final slots = buildWeatherNotificationSlots(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );

    final iconRoot = WeatherIconTheme.assetRoot(settings.weatherIconTheme);

    for (final slot in slots) {
      await _showScheduled(
        notificationIdFor(slot),
        slot.title,
        slot.body,
        slot.time,
        slot.icon,
        assetRoot: iconRoot,
        timezone: cache.timezone,
      );
    }
  }

  /// Stable positive notification id for [slot].
  @visibleForTesting
  static int notificationIdFor(WeatherNotificationSlot slot) {
    return Object.hash(
          slot.title,
          slot.body,
          slot.time.millisecondsSinceEpoch,
        ) &
        0x7fffffff;
  }

  /// When notifications are enabled, cancels pending ones and reschedules from the latest cache.
  Future<void> rescheduleForWeather({
    required MainWeatherCache cache,
    required Settings settings,
    required AppSettingsState appSettings,
    required String cityLabel,
  }) async {
    if (!settings.notifications) return;
    await cancelScheduled();
    await scheduleForWeather(
      cache: cache,
      settings: settings,
      appSettings: appSettings,
      cityLabel: cityLabel,
    );
  }

  /// Shows or updates the ongoing current-weather notification when enabled.
  Future<void> updatePersistentNotification({
    required MainWeatherCache cache,
    required Settings settings,
    required String cityLabel,
  }) async {
    if (!settings.persistentNotification) return;

    final content = buildPersistentNotificationContent(
      cache: cache,
      settings: settings,
      cityLabel: cityLabel,
    );
    if (content == null) return;

    try {
      final imagePath = await _assets.getLocalImagePath(
        content.icon,
        assetRoot: WeatherIconTheme.assetRoot(settings.weatherIconTheme),
      );
      await flutterLocalNotificationsPlugin.show(
        id: persistentNotificationId,
        title: content.title,
        body: content.body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _persistentChannelId,
            _persistentChannelName,
            channelDescription: 'Current weather in the status bar',
            icon: 'ic_notification',
            priority: Priority.low,
            importance: Importance.low,
            category: AndroidNotificationCategory.service,
            ongoing: true,
            autoCancel: false,
            onlyAlertOnce: true,
            playSound: false,
            enableVibration: false,
            additionalFlags: _persistentNotificationFlags,
            largeIcon: FilePathAndroidBitmap(imagePath),
          ),
        ),
        payload: imagePath,
      );
    } catch (e, stackTrace) {
      debugLogError(
        'NotificationService.updatePersistentNotification',
        e,
        stackTrace,
      );
    }
  }

  /// Removes the ongoing current-weather notification.
  Future<void> cancelPersistentNotification() =>
      flutterLocalNotificationsPlugin.cancel(id: persistentNotificationId);

  /// Cancels scheduled forecast notifications, keeping the persistent one.
  Future<void> cancelScheduled() async {
    final pending = await flutterLocalNotificationsPlugin
        .pendingNotificationRequests();
    for (final notification in pending) {
      if (notification.id == persistentNotificationId) continue;
      await flutterLocalNotificationsPlugin.cancel(id: notification.id);
    }
  }

  /// Removes all pending and displayed notifications.
  Future<void> cancelAll() => flutterLocalNotificationsPlugin.cancelAll();

  // --- Platform ---

  /// Shows a single zoned notification with a cached weather icon.
  /// Slot planning is tested via [buildWeatherNotificationSlots]; failures here are logged, not swallowed.
  Future<void> _showScheduled(
    int id,
    String title,
    String body,
    DateTime date,
    String icon, {
    required String assetRoot,
    String? timezone,
  }) async {
    try {
      final canScheduleExact =
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >()
              ?.canScheduleExactNotifications() ??
          true;
      final imagePath = await _assets.getLocalImagePath(
        icon,
        assetRoot: assetRoot,
      );
      final details = NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          icon: 'ic_notification',
          priority: Priority.high,
          importance: Importance.max,
          playSound: false,
          enableVibration: false,
          largeIcon: FilePathAndroidBitmap(imagePath),
        ),
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id: id,
        title: title,
        body: body,
        scheduledDate: forecastZonedDateTime(date, timezone),
        notificationDetails: details,
        androidScheduleMode: canScheduleExact
            ? AndroidScheduleMode.exactAllowWhileIdle
            : AndroidScheduleMode.inexactAllowWhileIdle,
        payload: imagePath,
      );
    } catch (e, stackTrace) {
      debugLogError('NotificationService._showScheduled', e, stackTrace);
    }
  }
}

/// Reschedules forecast notifications from Isar (background isolate safe).
Future<void> rescheduleNotificationsFromIsar(Isar isar) async {
  final settings = await isar.settings.where().findFirst() ?? Settings();
  if (!settings.notifications) return;

  final cache = await isar.mainWeatherCaches.where().findFirst();
  if (cache == null) return;

  final location = await isar.locationCaches.where().findFirst();
  final cityLabel = location?.city ?? location?.district ?? '';

  final appSettings = AppSettingsState(
    timeRange:
        settings.timeRange ?? AppConstants.defaultNotificationIntervalHours,
    timeStart: settings.timeStart ?? AppConstants.defaultNotificationTimeStart,
    timeEnd: settings.timeEnd ?? AppConstants.defaultNotificationTimeEnd,
    locale: appLocaleFromLanguageCode(settings.language).flutterLocale,
  );

  await NotificationService(AssetCacheService()).rescheduleForWeather(
    cache: cache,
    settings: settings,
    appSettings: appSettings,
    cityLabel: cityLabel,
  );
}

/// Updates the persistent notification from an Isar instance (background isolate safe).
Future<void> updatePersistentNotificationFromIsar(Isar isar) async {
  final settings = await isar.settings.where().findFirst() ?? Settings();
  if (!settings.persistentNotification) return;

  final cache = await isar.mainWeatherCaches.where().findFirst();
  if (cache == null) return;

  final location = await isar.locationCaches.where().findFirst();
  final cityLabel = location?.city ?? location?.district ?? '';

  await NotificationService(AssetCacheService()).updatePersistentNotification(
    cache: cache,
    settings: settings,
    cityLabel: cityLabel,
  );
}
