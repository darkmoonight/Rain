import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/navigation/app_router.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/core/services/network_cache_handler.dart';
import 'package:rain/core/settings/app_settings_notifier.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/show_snack_bar.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/core/weather/weather_cache_validator.dart';
import 'package:rain/data/models/db.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:workmanager/workmanager.dart';

/// Immutable state for the main weather tab and its cached location.
class MainWeatherState {
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

  String get city => location.city ?? '';
  String get district => location.district ?? '';

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
  final itemScrollController = ItemScrollController();

  DateTime get _cacheExpiryThreshold =>
      DateTime.now().subtract(AppConstants.cacheExpiry);

  @override
  MainWeatherState build() {
    Future.microtask(_init);
    return MainWeatherState();
  }

  // --- Initialization ---

  /// Clears stale notifications when needed, then resolves the active location.
  Future<void> _init() async {
    if (await ConnectivityService.hasInternet() &&
        await ref.read(weatherLocalDatasourceProvider).isMainWeatherEmpty()) {
      await ref.read(notificationServiceProvider).cancelAll();
    }
    await setLocation();
  }

  /// Chooses GPS, cached, or remote fetch based on settings and cache age.
  Future<void> setLocation() async {
    final settings = ref.read(settingsProvider);
    if (settings.location) {
      await getCurrentLocation();
      return;
    }

    final cached = await ref.read(weatherRepositoryProvider).readCache();
    if (cached.weather == null || cached.location == null) {
      await readCache();
      return;
    }

    final loc = cached.location!;
    final repo = ref.read(weatherRepositoryProvider);
    if (await repo.isCacheExpired(_cacheExpiryThreshold)) {
      await getLocation(loc.lat!, loc.lon!, loc.district!, loc.city!);
    } else {
      await readCache();
    }
  }

  // --- Location fetch ---

  /// Fetches weather from the device GPS when online.
  Future<void> getCurrentLocation() async {
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
      await readCache();
      return;
    }
    final locationService = ref.read(locationServiceProvider);
    if (!await locationService.isServiceEnabled()) {
      showSnackBar('no_location'.tr);
      await readCache();
      return;
    }
    state = state.copyWith(isLoading: true);
    await NetworkCacheHandler.fetchOrKeepCache(
      onNetworkFetch: _fetchFromGps,
      onUseCache: readCache,
      onError: () => showSnackBar('error_occurred'.tr, isError: true),
    );
  }

  /// Fetches weather for explicit coordinates when online.
  Future<void> getLocation(
    double latitude,
    double longitude,
    String district,
    String locality,
  ) async {
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
      await readCache();
      return;
    }
    state = state.copyWith(isLoading: true);
    await NetworkCacheHandler.fetchOrKeepCache(
      onNetworkFetch: () =>
          _fetchAndSave(latitude, longitude, district, locality),
      onUseCache: readCache,
      onError: () => showSnackBar('error_occurred'.tr, isError: true),
    );
  }

  /// Resolves the current GPS position and persists its forecast.
  Future<void> _fetchFromGps() async {
    final place = await ref.read(locationServiceProvider).getCurrentPlace();
    if (place == null) {
      showSnackBar('location_not_found'.tr);
      await readCache();
      return;
    }
    await _fetchAndSave(place.lat, place.lon, place.district, place.city);
  }

  /// Fetches remote data, writes cache, and reloads local state.
  Future<void> _fetchAndSave(
    double lat,
    double lon,
    String district,
    String city,
  ) async {
    final weather = await ref
        .read(weatherRepositoryProvider)
        .fetchWeather(lat, lon);
    final location = LocationCache(
      lat: lat,
      lon: lon,
      city: city,
      district: district,
    );
    await ref.read(weatherRepositoryProvider).writeCache(weather, location);
    syncBootstrapLocationCache(ref, location);
    refreshAppRouterFromRef(ref);
    await readCache();
  }

  // --- Cache ---

  /// Loads cached forecast into state and schedules widgets/notifications.
  Future<void> readCache() async {
    final cached = await ref.read(weatherRepositoryProvider).readCache();
    if (cached.weather == null || cached.location == null) {
      state = state.copyWith(isLoading: false);
      return;
    }

    if (WeatherCacheValidator.isLikelyFahrenheit(cached.weather!) &&
        await ConnectivityService.hasInternet()) {
      final loc = cached.location!;
      if (loc.lat != null && loc.lon != null) {
        await _fetchAndSave(
          loc.lat!,
          loc.lon!,
          loc.district ?? '',
          loc.city ?? '',
        );
        return;
      }
    }

    final hour = TimeIndexHelper.getTime(
      cached.weather!.time!,
      cached.weather!.timezone!,
    );
    final day = TimeIndexHelper.getDay(
      cached.weather!.timeDaily!,
      cached.weather!.timezone!,
    );
    if (Platform.isAndroid) {
      Workmanager().registerPeriodicTask(
        'widgetUpdate',
        'widgetBackgroundUpdate',
        frequency: const Duration(minutes: 15),
        existingWorkPolicy: ExistingPeriodicWorkPolicy.update,
      );
    }
    state = state.copyWith(
      isLoading: false,
      mainWeather: cached.weather!,
      location: cached.location!,
      hourOfDay: hour,
      dayOfNow: day,
    );
    syncBootstrapLocationCache(ref, cached.location!);
    if (Platform.isAndroid) {
      await ref
          .read(homeWidgetServiceProvider)
          .updateFromIsar(ref.read(isarProvider));
    }
    final settings = ref.read(settingsProvider);
    if (settings.notifications) {
      await ref
          .read(notificationServiceProvider)
          .rescheduleForWeather(
            cache: cached.weather!,
            settings: settings,
            appSettings: ref.read(appSettingsProvider),
            cityLabel: cached.location!.city ?? '',
          );
    }
    Future.delayed(AppConstants.scrollToCurrentHourDelay, scrollToCurrentHour);
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
    state = state.copyWith(hourOfDay: hour, dayOfNow: day);
  }

  /// Clears cached weather and/or location when changing city or settings.
  Future<void> deleteAll(bool changeCity) async {
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

  // --- Refresh ---

  /// Pulls fresh forecast data when online, otherwise reloads from cache.
  Future<void> refresh() async {
    await NetworkCacheHandler.fetchOrKeepCache(
      onOffline: () => showSnackBar('no_inter'.tr),
      onError: () => showSnackBar('error_occurred'.tr, isError: true),
      onNetworkFetch: _refreshFromNetwork,
      onUseCache: readCache,
    );
  }

  /// Refreshes from GPS or the last known coordinates, then reloads cache.
  Future<void> _refreshFromNetwork() async {
    if (ref.read(settingsProvider).location) {
      final locationService = ref.read(locationServiceProvider);
      if (!await locationService.isServiceEnabled()) {
        showSnackBar('no_location'.tr);
        await readCache();
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
    await readCache();
  }
}
