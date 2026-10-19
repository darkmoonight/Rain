import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/clock_skew_persistence.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/core/services/network_cache_handler.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/core/utils/async_queue.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/core/weather/location_timezone_helper.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/core/services/widget_background_service.dart';
import 'package:rain/features/weather/application/weather_side_effects.dart';
import 'package:rain/features/weather/application/main_weather_state.dart';
import 'package:rain/domain/entities/entities.dart';
export 'package:rain/features/weather/application/main_weather_state.dart';
part 'main_weather_location.dart';
part 'main_weather_refresh.dart';

/// Riverpod provider for [MainWeatherNotifier].
final mainWeatherNotifierProvider =
    NotifierProvider<MainWeatherNotifier, MainWeatherState>(
      MainWeatherNotifier.new,
    );

/// Shared queue, state helpers, and cache accessors for main-weather mixins.
abstract class _MainWeatherNotifierCore extends Notifier<MainWeatherState> {
  final _queue = AsyncQueue();

  WeatherSideEffects get _sideEffects => WeatherSideEffects(ref);

  int? _lastPersistentHourIndex;
  int? _lastPersistentDayIndex;
  bool _followCurrentTime = true;
  bool _channelMigrationRescheduleDone = false;
  bool _shouldScrollToCurrentHour = false;

  /// Consumed by the main weather screen after a successful cache load.
  bool takeScrollToCurrentHourRequest() {
    final requested = _shouldScrollToCurrentHour;
    _shouldScrollToCurrentHour = false;
    return requested;
  }

  /// Timestamp before which cached forecast data is treated as stale.
  DateTime get _cacheExpiryThreshold =>
      AppConstants.weatherCacheExpiryThreshold();

  /// True when [state] already has enough forecast data to render the main screen.
  bool get _hasDisplayableForecast => state.mainWeather.hasSeriesData;

  /// Updates [state] only while this notifier is still mounted.
  void _setState(MainWeatherState next) {
    if (!ref.mounted) return;
    state = next;
  }

  /// Queues a snackbar message for the main weather screen to display.
  void _emitUserMessage(String key, {bool isError = false}) {
    if (!ref.mounted) return;
    state = state.copyWith(
      userMessage: MainWeatherUserMessage(key, isError: isError),
      userMessageId: state.userMessageId + 1,
    );
  }

  /// Clears a consumed user message after the UI shows it.
  void clearUserMessage() {
    if (!ref.mounted || state.userMessage == null) return;
    state = state.copyWith(clearUserMessage: true);
  }

  /// Runs [action] on the queue; ignores [AsyncQueueCancelled] after dispose.
  Future<void> _enqueue(Future<void> Function() action) async {
    try {
      await _queue.enqueue(action);
    } on AsyncQueueCancelled {
      // Provider disposed; skip.
    }
  }

  // Cross-mixin hooks implemented by [_MainWeatherLocationOps].
  Future<void> setLocation();
  Future<void> _getCurrentLocationImpl({
    required bool showLoading,
    required bool forceLoading,
  });
  Future<void> _getLocationImpl(
    double lat,
    double lon,
    String district,
    String city, {
    required bool showLoading,
  });
  Future<void> _fetchFromGps();
  Future<void> _fetchAndSave(
    double lat,
    double lon,
    String district,
    String city,
  );

  /// Initializes default state and schedules location resolution.
  @override
  MainWeatherState build() {
    ref.onDispose(_queue.cancel);
    Future.microtask(_init);
    return MainWeatherState();
  }

  /// Cancels notifications when online and the main weather cache is empty, then resolves location.
  Future<void> _init() async {
    if (!ref.mounted || _queue.isCancelled) return;
    if (await ConnectivityService.hasInternet() &&
        await ref.read(weatherLocalDatasourceProvider).isMainWeatherEmpty() &&
        !ref.read(settingsProvider).notifications) {
      if (!ref.mounted || _queue.isCancelled) return;
      await ref.read(notificationServiceProvider).cancelScheduled();
    }
    if (!ref.mounted || _queue.isCancelled) return;
    await setLocation();
  }

  LocationClock _mainClock(WeatherForecast cache) =>
      LocationClock.fromMainWeather(
        cache,
        settingsClockSkewSeconds: ref.read(settingsProvider).clockSkewSeconds,
      );

  /// Loads cached forecast into state, refreshes widgets/notifications, and may re-fetch when cache values look like Fahrenheit.
  ///
  /// Pass [rescheduleNotifications] after a network fetch so pending alarms pick up
  /// new forecast text; routine loads top up missing slots only.
  Future<void> readCache({bool rescheduleNotifications = false}) => _enqueue(
    () => _readCacheImpl(rescheduleNotifications: rescheduleNotifications),
  );

  Future<void> _readCacheImpl({bool rescheduleNotifications = false}) async {
    if (!ref.mounted || _queue.isCancelled) return;
    final cached = await ref.read(weatherRepositoryProvider).readCache();
    if (!ref.mounted || _queue.isCancelled) return;
    if (cached.weather == null || cached.location == null) {
      _setState(state.copyWith(isLoading: false));
      return;
    }

    var weather = cached.weather!;
    final location = cached.location!;
    final repairedTimezone = LocationTimezoneHelper.resolve(
      cached: weather.timezone,
      lat: location.lat,
      lon: location.lon,
    );
    if (weather.timezone != repairedTimezone) {
      weather = weather.copyWith(timezone: repairedTimezone);
      await ref.read(weatherRepositoryProvider).writeCache(weather, location);
      if (!ref.mounted || _queue.isCancelled) return;
    }

    if (WeatherCacheValidator.isLikelyFahrenheit(weather) &&
        await ConnectivityService.hasInternet()) {
      if (!ref.mounted || _queue.isCancelled) return;
      if (location.lat != null && location.lon != null) {
        try {
          await _fetchAndSave(
            location.lat!,
            location.lon!,
            location.district ?? '',
            location.city ?? '',
          );
          return;
        } catch (_) {
          // Keep showing the legacy cache when the migration fetch fails.
        }
      }
    }

    if (!ref.mounted || _queue.isCancelled) return;
    final clock = _mainClock(weather);
    final indices = TimeIndexHelper.currentIndices(
      hourly: weather.time!,
      daily: weather.timeDaily!,
      clock: clock,
    );
    if (Platform.isAndroid) {
      unawaited(ensureWidgetBackgroundTaskScheduled());
    }
    _followCurrentTime = true;
    _shouldScrollToCurrentHour = true;
    _setState(
      state.copyWith(
        isLoading: false,
        mainWeather: weather,
        location: location,
        hourOfDay: indices.hour,
        dayOfNow: indices.day,
      ),
    );
    if (!ref.mounted) return;
    syncBootstrapLocationCache(ref, location);
    // Widget and notification sync can load many assets; keep off the UI thread.
    unawaited(_sideEffects.updateHomeWidgets());
    final settings = ref.read(settingsProvider);
    if (settings.notifications) {
      final bootstrap = ref.read(bootstrapProvider);
      final migrateReschedule =
          bootstrap.rescheduleForecastNotifications &&
          !_channelMigrationRescheduleDone;
      if (migrateReschedule) _channelMigrationRescheduleDone = true;

      unawaited(
        _syncForecastNotifications(
          cache: weather,
          cityLabel: location.displayLabel,
          reschedulePending: rescheduleNotifications || migrateReschedule,
        ),
      );
    }
    if (Platform.isAndroid) {
      unawaited(refreshPersistentNotification(force: true));
    }
  }

  /// Updates the ongoing notification when the hourly slot changes or [force] is set.
  Future<void> refreshPersistentNotification({bool force = false}) async {
    if (!Platform.isAndroid) return;

    final settings = ref.read(settingsProvider);
    if (!settings.persistentNotification) {
      _lastPersistentHourIndex = null;
      _lastPersistentDayIndex = null;
      return;
    }

    final cache = state.mainWeather;
    final time = cache.time;
    final timeDaily = cache.timeDaily;
    if (time == null ||
        time.isEmpty ||
        timeDaily == null ||
        timeDaily.isEmpty ||
        cache.timezone == null) {
      return;
    }

    final clock = _mainClock(cache);
    final hour = TimeIndexHelper.getTime(time, clock);
    final day = TimeIndexHelper.getDay(timeDaily, clock);
    if (!force &&
        hour == _lastPersistentHourIndex &&
        day == _lastPersistentDayIndex) {
      return;
    }

    _lastPersistentHourIndex = hour;
    _lastPersistentDayIndex = day;

    await _sideEffects.updatePersistentNotification(
      cache: cache,
      cityLabel: state.locationLabel,
      enabled: true,
    );
  }

  Future<void> rebuildNotificationContentFromCache() async {
    if (!Platform.isAndroid) return;
    await rescheduleNotificationsIfEnabled();
    await refreshPersistentNotification(force: true);
  }

  Future<void> rescheduleNotificationsIfEnabled() async {
    if (!Platform.isAndroid) return;

    final inMemory = state.mainWeather;
    final hasInMemoryCache = inMemory.time != null && inMemory.time!.isNotEmpty;
    final cached = hasInMemoryCache
        ? (weather: inMemory, location: state.location)
        : await ref.read(weatherRepositoryProvider).readCache();

    await _syncForecastNotifications(
      cache: cached.weather,
      cityLabel: cached.location?.displayLabel,
      reschedulePending: true,
    );
  }

  /// Schedules or replans forecast alarms from cache.
  ///
  /// [reschedulePending] is false on routine [readCache] (top-up missing slots);
  /// true when notification settings change ([rescheduleForWeather]).
  Future<void> _syncForecastNotifications({
    WeatherForecast? cache,
    String? cityLabel,
    bool reschedulePending = false,
  }) async {
    final settings = ref.read(settingsProvider);
    await _sideEffects.syncForecastNotifications(
      cache: cache ?? state.mainWeather,
      cityLabel: cityLabel ?? state.locationLabel,
      notificationsEnabled: settings.notifications,
      reschedulePending: reschedulePending,
    );
  }

  Future<void> replenishForecastNotificationsIfEnabled() async {
    if (!Platform.isAndroid) return;

    final inMemory = state.mainWeather;
    final hasInMemoryCache = inMemory.time != null && inMemory.time!.isNotEmpty;
    final cached = hasInMemoryCache
        ? (weather: inMemory, location: state.location)
        : await ref.read(weatherRepositoryProvider).readCache();

    await _syncForecastNotifications(
      cache: cached.weather,
      cityLabel: cached.location?.displayLabel,
      reschedulePending: false,
    );
  }

  /// Updates the selected hourly and daily indices for the detail view.
  void setHourAndDay(int hour, int day) {
    _followCurrentTime = _isCurrentTimeSlot(hour, day);
    _setState(state.copyWith(hourOfDay: hour, dayOfNow: day));
  }

  /// Realigns hour/day indices to the city's current local time.
  void syncCurrentTimeIndices() {
    if (!_followCurrentTime || !ref.mounted) return;

    final cache = state.mainWeather;
    final time = cache.time;
    final timeDaily = cache.timeDaily;
    if (time == null ||
        time.isEmpty ||
        timeDaily == null ||
        timeDaily.isEmpty ||
        cache.timezone == null) {
      return;
    }

    final clock = _mainClock(cache);
    final indices = TimeIndexHelper.currentIndices(
      hourly: time,
      daily: timeDaily,
      clock: clock,
    );
    if (indices.hour == state.hourOfDay && indices.day == state.dayOfNow) {
      return;
    }
    _setState(state.copyWith(hourOfDay: indices.hour, dayOfNow: indices.day));
    unawaited(refreshPersistentNotification());
  }

  /// Refreshes widgets and notifications after resume without blocking the UI.
  ///
  /// Uses the already-open Isar instance and skips [runWidgetBackgroundRefresh]
  /// (notification plugin re-init, optional network fetch) which caused ANRs
  /// when awaited on the main isolate during [onAppResumed].
  Future<void> _syncForegroundSideEffects() async {
    if (!ref.mounted || _queue.isCancelled) return;
    try {
      await _sideEffects.updateHomeWidgets();
      if (!ref.mounted || _queue.isCancelled) return;
      await refreshPersistentNotification(force: true);
      if (!ref.mounted || _queue.isCancelled) return;
      if (ref.read(settingsProvider).notifications) {
        await replenishForecastNotificationsIfEnabled();
      }
    } catch (e, st) {
      debugLogError('MainWeatherNotifier._syncForegroundSideEffects', e, st);
    }
  }

  /// Whether [hour]/[day] match the city's current local forecast slot.
  bool _isCurrentTimeSlot(int hour, int day) {
    final cache = state.mainWeather;
    final time = cache.time;
    final timeDaily = cache.timeDaily;
    if (time == null ||
        time.isEmpty ||
        timeDaily == null ||
        timeDaily.isEmpty ||
        cache.timezone == null) {
      return false;
    }

    return TimeIndexHelper.isCurrentTimeSlot(
      hourly: time,
      daily: timeDaily,
      clock: _mainClock(cache),
      hourIndex: hour,
      dayIndex: day,
    );
  }
}

/// Loads, caches, and refreshes the primary weather location and forecast.
///
/// Uses stale-while-revalidate: when cached forecast data is displayable,
/// [MainWeatherState.isLoading] stays false during refresh so the main tab
/// does not fall back to shimmer. The cities tab performs the equivalent UI
/// check in [PlaceList] because its list can be empty independently.
class MainWeatherNotifier extends _MainWeatherNotifierCore
    with _MainWeatherLocationOps, _MainWeatherRefreshOps {}
