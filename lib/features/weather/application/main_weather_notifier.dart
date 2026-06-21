import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/clock_skew_persistence.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/core/services/network_cache_handler.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/async_queue.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/core/utils/location_label.dart';
import 'package:rain/core/utils/show_snack_bar.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/core/services/widget_background_service.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

/// Immutable state for the main weather tab and its cached location.
class MainWeatherState {
  /// Creates state with optional cache, location, and selected time indices.
  MainWeatherState({
    this.isLoading = true,
    MainWeatherCache? mainWeather,
    LocationCache? location,
    this.hourOfDay = 0,
    this.dayOfNow = 0,
  }) : mainWeather = mainWeather ?? MainWeatherCache(),
       location = location ?? LocationCache();

  final bool isLoading;
  final MainWeatherCache mainWeather;
  final LocationCache location;
  final int hourOfDay;
  final int dayOfNow;

  /// Returns the cached city label, or an empty string when unset.
  String get city => location.city ?? '';

  /// City or district label for widgets and notifications.
  String get locationLabel => location.displayLabel;

  /// Returns the cached district label, or an empty string when unset.
  String get district => location.district ?? '';

  /// Returns a copy with selectively replaced forecast and index fields.
  MainWeatherState copyWith({
    bool? isLoading,
    MainWeatherCache? mainWeather,
    LocationCache? location,
    int? hourOfDay,
    int? dayOfNow,
  }) => MainWeatherState(
    isLoading: isLoading ?? this.isLoading,
    mainWeather: mainWeather ?? this.mainWeather,
    location: location ?? this.location,
    hourOfDay: hourOfDay ?? this.hourOfDay,
    dayOfNow: dayOfNow ?? this.dayOfNow,
  );
}

/// Riverpod provider for [MainWeatherNotifier].
final mainWeatherNotifierProvider =
    NotifierProvider<MainWeatherNotifier, MainWeatherState>(
      MainWeatherNotifier.new,
    );

/// Loads, caches, and refreshes the primary weather location and forecast.
class MainWeatherNotifier extends Notifier<MainWeatherState> {
  final _queue = AsyncQueue();
  final itemScrollController = ItemScrollController();

  int? _lastPersistentHourIndex;
  int? _lastPersistentDayIndex;
  bool _followCurrentTime = true;
  bool _channelMigrationRescheduleDone = false;

  /// Timestamp before which cached forecast data is treated as stale.
  DateTime get _cacheExpiryThreshold =>
      AppConstants.weatherCacheExpiryThreshold();

  /// True when [state] already has enough forecast data to render the main screen.
  bool get _hasDisplayableForecast {
    final cache = state.mainWeather;
    return cache.time != null &&
        cache.time!.isNotEmpty &&
        cache.timeDaily != null &&
        cache.timeDaily!.isNotEmpty;
  }

  /// Initializes default state and schedules location resolution.
  @override
  MainWeatherState build() {
    Future.microtask(_init);
    return MainWeatherState();
  }

  /// Cancels notifications when online and the main weather cache is empty, then resolves location.
  Future<void> _init() async {
    if (await ConnectivityService.hasInternet() &&
        await ref.read(weatherLocalDatasourceProvider).isMainWeatherEmpty() &&
        !ref.read(settingsProvider).notifications) {
      await ref.read(notificationServiceProvider).cancelScheduled();
    }
    await setLocation();
  }

  /// Chooses GPS, cached, or remote fetch based on settings, cache age, and connectivity.
  Future<void> setLocation() => _queue.enqueue(_setLocationImpl);

  Future<void> _setLocationImpl() async {
    final settings = ref.read(settingsProvider);
    if (settings.location) {
      await _getCurrentLocationImpl();
      return;
    }

    final cached = await ref.read(weatherRepositoryProvider).readCache();
    if (cached.weather == null || cached.location == null) {
      await _readCacheImpl();
      return;
    }

    final loc = cached.location!;
    final repo = ref.read(weatherRepositoryProvider);
    if (loc.lat == null || loc.lon == null) {
      await _readCacheImpl();
      return;
    }
    if (await repo.isCacheExpired(_cacheExpiryThreshold)) {
      // Stale-while-revalidate: keep showing the last forecast instead of a
      // full-screen loader while the 12h refresh runs (or times out).
      await _readCacheImpl();
      await _getLocationImpl(
        loc.lat!,
        loc.lon!,
        loc.district ?? '',
        loc.city ?? '',
        showLoading: !_hasDisplayableForecast,
      );
    } else {
      await _readCacheImpl();
    }
  }

  /// Fetches weather from GPS when online and location is enabled; otherwise shows a snackbar and loads cache.
  ///
  /// Pass [forceLoading] when switching to GPS so the main tab shows a loader
  /// instead of the previous manual city's forecast.
  Future<void> getCurrentLocation({
    bool showLoading = true,
    bool forceLoading = false,
  }) => _queue.enqueue(
    () => _getCurrentLocationImpl(
      showLoading: showLoading,
      forceLoading: forceLoading,
    ),
  );

  Future<void> _getCurrentLocationImpl({
    bool showLoading = true,
    bool forceLoading = false,
  }) async {
    if (showLoading && (!_hasDisplayableForecast || forceLoading)) {
      state = state.copyWith(isLoading: true);
    }
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
      await _readCacheImpl();
      return;
    }
    final locationService = ref.read(locationServiceProvider);
    if (!await locationService.isServiceEnabled()) {
      showSnackBar('no_location'.tr);
      await _readCacheImpl();
      return;
    }
    try {
      await NetworkCacheHandler.fetchOrKeepCache(
        onNetworkFetch: _fetchFromGps,
        onUseCache: _readCacheImpl,
        onError: () => showSnackBar('error_occurred'.tr, isError: true),
      );
    } finally {
      if (state.isLoading) {
        await _readCacheImpl();
      }
    }
  }

  /// Fetches weather for coordinates when online; otherwise shows a snackbar and loads cache.
  Future<void> getLocation(
    double latitude,
    double longitude,
    String district,
    String locality, {
    bool showLoading = true,
  }) => _queue.enqueue(
    () => _getLocationImpl(
      latitude,
      longitude,
      district,
      locality,
      showLoading: showLoading,
    ),
  );

  Future<void> _getLocationImpl(
    double latitude,
    double longitude,
    String district,
    String locality, {
    bool showLoading = true,
  }) async {
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
      await _readCacheImpl();
      return;
    }
    if (showLoading && !_hasDisplayableForecast) {
      state = state.copyWith(isLoading: true);
    }
    try {
      await NetworkCacheHandler.fetchOrKeepCache(
        onNetworkFetch: () =>
            _fetchAndSave(latitude, longitude, district, locality),
        onUseCache: _readCacheImpl,
        onError: () => showSnackBar('error_occurred'.tr, isError: true),
      );
    } finally {
      if (state.isLoading) {
        await _readCacheImpl();
      }
    }
  }

  /// Resolves the current GPS position and persists its forecast.
  Future<void> _fetchFromGps() async {
    final place = await ref
        .read(locationServiceProvider)
        .getCurrentPlace(resolveLabels: _reverseGeocodeLabels);
    if (place == null) {
      showSnackBar('location_not_found'.tr);
      await _readCacheImpl();
      return;
    }
    await _fetchAndSave(place.lat, place.lon, place.district, place.city);
  }

  Future<({String city, String district})?> _reverseGeocodeLabels(
    double lat,
    double lon,
  ) async {
    final languageCode = ref.read(localeProvider).languageCode;
    return ref
        .read(weatherRemoteDatasourceProvider)
        .reverseGeocode(lat, lon, languageCode: languageCode);
  }

  /// Fetches remote data, writes cache, and reloads local state.
  Future<void> _fetchAndSave(
    double lat,
    double lon,
    String district,
    String city,
  ) async {
    final resolvedLabels = await _resolveMissingLabels(
      lat,
      lon,
      city,
      district,
    );
    final weather = await ref
        .read(weatherRepositoryProvider)
        .fetchWeather(lat, lon);
    final location = LocationCache(
      lat: lat,
      lon: lon,
      city: resolvedLabels.city,
      district: resolvedLabels.district,
    );
    await ref.read(weatherRepositoryProvider).writeCache(weather, location);
    await persistClockSkew(ref, weather.clockSkewSeconds ?? 0);
    syncBootstrapLocationCache(ref, location);
    refreshAppRouterFromRef(ref);
    await _readCacheImpl(rescheduleNotifications: true);
  }

  /// Fills missing city or district labels via reverse geocoding when needed.
  Future<({String city, String district})> _resolveMissingLabels(
    double lat,
    double lon,
    String city,
    String district,
  ) async {
    if (hasNonEmptyLocationText(city) || hasNonEmptyLocationText(district)) {
      return (city: city, district: district);
    }

    final labels = await _reverseGeocodeLabels(lat, lon);
    if (labels == null) {
      return (city: city, district: district);
    }

    return (
      city: hasNonEmptyLocationText(labels.city) ? labels.city : city,
      district: hasNonEmptyLocationText(labels.district)
          ? labels.district
          : district,
    );
  }

  LocationClock _mainClock(MainWeatherCache cache) =>
      LocationClock.fromMainWeather(
        cache,
        settingsClockSkewSeconds: ref.read(settingsProvider).clockSkewSeconds,
      );

  /// Loads cached forecast into state, refreshes widgets/notifications, and may re-fetch when cache values look like Fahrenheit.
  ///
  /// Pass [rescheduleNotifications] after a network fetch so pending alarms pick up
  /// new forecast text; routine loads top up missing slots only.
  Future<void> readCache({bool rescheduleNotifications = false}) =>
      _queue.enqueue(
        () => _readCacheImpl(rescheduleNotifications: rescheduleNotifications),
      );

  Future<void> _readCacheImpl({bool rescheduleNotifications = false}) async {
    final cached = await ref.read(weatherRepositoryProvider).readCache();
    if (cached.weather == null || cached.location == null) {
      state = state.copyWith(isLoading: false);
      return;
    }

    if (WeatherCacheValidator.isLikelyFahrenheit(cached.weather!) &&
        await ConnectivityService.hasInternet()) {
      final loc = cached.location!;
      if (loc.lat != null && loc.lon != null) {
        try {
          await _fetchAndSave(
            loc.lat!,
            loc.lon!,
            loc.district ?? '',
            loc.city ?? '',
          );
          return;
        } catch (_) {
          // Keep showing the legacy cache when the migration fetch fails.
        }
      }
    }

    final clock = _mainClock(cached.weather!);
    final indices = TimeIndexHelper.currentIndices(
      hourly: cached.weather!.time!,
      daily: cached.weather!.timeDaily!,
      clock: clock,
    );
    if (Platform.isAndroid) {
      unawaited(ensureWidgetBackgroundTaskScheduled());
    }
    _followCurrentTime = true;
    state = state.copyWith(
      isLoading: false,
      mainWeather: cached.weather!,
      location: cached.location!,
      hourOfDay: indices.hour,
      dayOfNow: indices.day,
    );
    syncBootstrapLocationCache(ref, cached.location!);
    // Widget and notification sync can load many assets; keep off the UI thread.
    if (Platform.isAndroid) {
      unawaited(
        ref
            .read(homeWidgetServiceProvider)
            .updateFromIsar(ref.read(isarProvider)),
      );
    }
    final settings = ref.read(settingsProvider);
    if (settings.notifications) {
      final bootstrap = ref.read(bootstrapProvider);
      final migrateReschedule =
          bootstrap.rescheduleForecastNotifications &&
          !_channelMigrationRescheduleDone;
      if (migrateReschedule) _channelMigrationRescheduleDone = true;

      unawaited(
        _syncForecastNotifications(
          cache: cached.weather!,
          cityLabel: cached.location!.displayLabel,
          reschedulePending: rescheduleNotifications || migrateReschedule,
        ),
      );
    }
    if (Platform.isAndroid) {
      unawaited(refreshPersistentNotification(force: true));
    }
    Future.delayed(AppConstants.scrollToCurrentHourDelay, scrollToCurrentHour);
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

    await ref
        .read(notificationServiceProvider)
        .updatePersistentNotification(
          cache: cache,
          settings: settings,
          cityLabel: state.locationLabel,
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
    MainWeatherCache? cache,
    String? cityLabel,
    bool reschedulePending = false,
  }) async {
    final settings = ref.read(settingsProvider);
    if (!settings.notifications) return;

    final resolvedCache = cache ?? state.mainWeather;
    if (resolvedCache.time == null || resolvedCache.time!.isEmpty) return;

    final service = ref.read(notificationServiceProvider);
    final appSettings = ref.read(appSettingsProvider);
    final label = cityLabel ?? state.locationLabel;

    if (reschedulePending) {
      await service.rescheduleForWeather(
        cache: resolvedCache,
        settings: settings,
        appSettings: appSettings,
        cityLabel: label,
      );
    } else {
      await service.ensureForecastNotificationsScheduled(
        cache: resolvedCache,
        settings: settings,
        appSettings: appSettings,
        cityLabel: label,
      );
    }
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

  /// Scrolls the hourly list to the current hour, retrying until attached.
  void scrollToCurrentHour({int retryCount = 0}) {
    if (itemScrollController.isAttached) {
      itemScrollController.scrollTo(
        index: state.hourOfDay,
        duration: AppConstants.scrollDuration,
        curve: Curves.easeInOutCubic,
      );
    } else if (retryCount < AppConstants.maxScrollRetries) {
      Future.delayed(
        AppConstants.scrollToRetryDelay,
        () => scrollToCurrentHour(retryCount: retryCount + 1),
      );
    }
  }

  /// Updates the selected hourly and daily indices for the detail view.
  void setHourAndDay(int hour, int day) {
    _followCurrentTime = _isCurrentTimeSlot(hour, day);
    state = state.copyWith(hourOfDay: hour, dayOfNow: day);
  }

  /// Realigns hour/day indices to the city's current local time.
  void syncCurrentTimeIndices() {
    if (!_followCurrentTime) return;

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
    state = state.copyWith(hourOfDay: indices.hour, dayOfNow: indices.day);
    unawaited(refreshPersistentNotification());
  }

  /// Refreshes widgets and notifications after resume without blocking the UI.
  ///
  /// Uses the already-open Isar instance and skips [runWidgetBackgroundRefresh]
  /// (notification plugin re-init, optional network fetch) which caused ANRs
  /// when awaited on the main isolate during [onAppResumed].
  Future<void> _syncForegroundSideEffects() async {
    try {
      if (Platform.isAndroid) {
        await ref
            .read(homeWidgetServiceProvider)
            .updateFromIsar(ref.read(isarProvider));
      }
      await refreshPersistentNotification(force: true);
      if (ref.read(settingsProvider).notifications) {
        await replenishForecastNotificationsIfEnabled();
      }
    } catch (e, st) {
      debugLogError('MainWeatherNotifier._syncForegroundSideEffects', e, st);
    }
  }

  /// Cancels notifications and clears main and/or location cache when online before a location change.
  Future<void> deleteAll(bool changeCity) =>
      _queue.enqueue(() => _deleteAllImpl(changeCity));

  Future<void> _deleteAllImpl(bool changeCity) async {
    if (!await ConnectivityService.hasInternet()) return;
    final settings = ref.read(settingsProvider);
    final serviceEnabled = await ref
        .read(locationServiceProvider)
        .isServiceEnabled();
    await ref.read(notificationServiceProvider).cancelAll();
    if (!settings.location) {
      await ref.read(weatherRepositoryProvider).clearMainOnly();
    }
    if (settings.location && serviceEnabled || changeCity) {
      await ref.read(weatherRepositoryProvider).clearMainAndLocation();
    }
  }

  /// Pulls fresh forecast data when online, otherwise reloads from cache.
  Future<void> refresh() => _queue.enqueue(_refreshImpl);

  Future<void> _refreshImpl() async {
    await NetworkCacheHandler.fetchOrKeepCache(
      onOffline: () => showSnackBar('no_inter'.tr),
      onError: () => showSnackBar('error_occurred'.tr, isError: true),
      onNetworkFetch: _refreshFromNetwork,
      onUseCache: _readCacheImpl,
    );
  }

  /// Coordinates foreground refresh when the app returns to the foreground.
  ///
  /// Refreshes stale forecast data when needed; otherwise syncs time indices and
  /// runs Android widget/notification side effects once via [HomeWidgetService].
  Future<void> onAppResumed() => _queue.enqueue(_onAppResumedImpl);

  Future<void> _onAppResumedImpl() async {
    final repo = ref.read(weatherRepositoryProvider);
    final cached = await repo.readCache();
    if (cached.weather == null || cached.location == null) return;

    if (await repo.isCacheExpired(_cacheExpiryThreshold)) {
      await _refreshIfStaleImpl();
      return;
    }

    syncCurrentTimeIndices();
    // Yield to the event loop so resume touch events are handled first.
    unawaited(Future<void>.delayed(Duration.zero, _syncForegroundSideEffects));
  }

  /// Refreshes the main forecast when the 12h cache window has passed.
  ///
  /// Called on app resume so a cold start or long background stay does not leave
  /// the weather tab stuck on the loading skeleton.
  Future<void> refreshIfStale() => _queue.enqueue(_refreshIfStaleImpl);

  Future<void> _refreshIfStaleImpl() async {
    final repo = ref.read(weatherRepositoryProvider);
    final cached = await repo.readCache();
    if (cached.weather == null || cached.location == null) return;

    if (!await repo.isCacheExpired(_cacheExpiryThreshold)) {
      syncCurrentTimeIndices();
      return;
    }

    final loc = cached.location!;
    if (loc.lat == null || loc.lon == null) {
      syncCurrentTimeIndices();
      return;
    }

    if (!_hasDisplayableForecast) {
      await _readCacheImpl();
    }

    if (ref.read(settingsProvider).location) {
      await _getCurrentLocationImpl(showLoading: false);
      return;
    }

    await _getLocationImpl(
      loc.lat!,
      loc.lon!,
      loc.district ?? '',
      loc.city ?? '',
      showLoading: false,
    );
  }

  /// Refreshes from GPS or the last known coordinates, then reloads cache.
  Future<void> _refreshFromNetwork() async {
    if (ref.read(settingsProvider).location) {
      final locationService = ref.read(locationServiceProvider);
      if (!await locationService.isServiceEnabled()) {
        showSnackBar('no_location'.tr);
        await _readCacheImpl();
        return;
      }
      await _fetchFromGps();
      return;
    }
    final cached = await ref.read(weatherRepositoryProvider).readCache();
    final loc = cached.location;
    if (loc?.lat != null && loc?.lon != null) {
      await _fetchAndSave(
        loc!.lat!,
        loc.lon!,
        loc.district ?? '',
        loc.city ?? '',
      );
      return;
    }
    await _readCacheImpl();
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
