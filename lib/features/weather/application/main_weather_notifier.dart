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
import 'package:rain/data/models/db.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:workmanager/workmanager.dart';

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

final mainWeatherNotifierProvider =
    NotifierProvider<MainWeatherNotifier, MainWeatherState>(
      MainWeatherNotifier.new,
    );

class MainWeatherNotifier extends Notifier<MainWeatherState> {
  final itemScrollController = ItemScrollController();
  late final DateTime _cacheExpiry;

  @override
  MainWeatherState build() {
    _cacheExpiry = DateTime.now().subtract(AppConstants.cacheExpiry);
    Future.microtask(_init);
    return MainWeatherState();
  }

  Future<void> _init() async {
    await deleteCache();
    await setLocation();
  }

  Future<void> deleteCache() async {
    if (!await ConnectivityService.hasInternet()) return;
    if (await ref.read(weatherLocalDatasourceProvider).isMainWeatherEmpty()) {
      await ref.read(notificationServiceProvider).cancelAll();
    }
  }

  Future<void> setLocation() async {
    final settings = ref.read(settingsProvider);
    if (settings.location) {
      await getCurrentLocation();
    } else {
      final location = await ref.read(weatherRepositoryProvider).readCache();
      if (location.location != null) {
        final loc = location.location!;
        await getLocation(loc.lat!, loc.lon!, loc.district!, loc.city!);
      } else {
        await readCache();
      }
    }
  }

  Future<void> getCurrentLocation() async {
    final locationService = ref.read(locationServiceProvider);
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
      await readCache();
      return;
    }
    if (!await locationService.isServiceEnabled()) {
      showSnackBar('no_location'.tr);
      await readCache();
      return;
    }
    await _loadCachedOrFetchFromNetwork(
      onNetworkFetch: () async {
        final place = await locationService.getCurrentPlace();
        if (place == null) {
          showSnackBar('location_not_found'.tr);
          await readCache();
          return;
        }
        await _fetchAndSave(place.lat, place.lon, place.district, place.city);
      },
    );
  }

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
    await _loadCachedOrFetchFromNetwork(
      onNetworkFetch: () =>
          _fetchAndSave(latitude, longitude, district, locality),
    );
  }

  Future<bool> _needsNetworkRefresh() async {
    final repo = ref.read(weatherRepositoryProvider);
    if (!await repo.hasCachedWeather()) return true;
    return repo.isCacheExpired(_cacheExpiry);
  }

  Future<void> _loadCachedOrFetchFromNetwork({
    required Future<void> Function() onNetworkFetch,
  }) async {
    if (!await _needsNetworkRefresh()) {
      await readCache();
      return;
    }
    await NetworkCacheHandler.fetchOrKeepCache(
      onNetworkFetch: onNetworkFetch,
      onUseCache: readCache,
      onError: () => showSnackBar('error_occurred'.tr, isError: true),
    );
  }

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
    await _scheduleNotifications(weather, city);
    await ref.read(weatherRepositoryProvider).writeCache(weather, location);
    syncBootstrapLocationCache(ref, location);
    refreshAppRouterFromRef(ref);
    if (Platform.isAndroid) {
      await Future.delayed(const Duration(milliseconds: 100));
      await ref
          .read(homeWidgetServiceProvider)
          .updateFromIsar(ref.read(isarProvider));
    }
    await readCache();
  }

  Future<void> readCache() async {
    final cached = await ref.read(weatherRepositoryProvider).readCache();
    if (cached.weather == null || cached.location == null) {
      state = state.copyWith(isLoading: false);
      return;
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
          .scheduleIfEmpty(
            cache: cached.weather!,
            settings: settings,
            appSettings: ref.read(appSettingsProvider),
            cityLabel: cached.location!.city ?? '',
          );
    }
    Future.delayed(AppConstants.scrollToCurrentHourDelay, scrollToCurrentHour);
  }

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

  void setHourAndDay(int hour, int day) {
    state = state.copyWith(hourOfDay: hour, dayOfNow: day);
  }

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

  Future<void> refresh() async {
    await NetworkCacheHandler.fetchOrKeepCache(
      onOffline: () => showSnackBar('no_inter'.tr),
      onError: () => showSnackBar('error_occurred'.tr, isError: true),
      onNetworkFetch: _refreshFromNetwork,
      onUseCache: readCache,
    );
  }

  Future<void> _refreshFromNetwork() async {
    final settings = ref.read(settingsProvider);
    if (settings.location) {
      final locationService = ref.read(locationServiceProvider);
      if (!await locationService.isServiceEnabled()) {
        showSnackBar('no_location'.tr);
        await readCache();
        return;
      }
      final place = await locationService.getCurrentPlace();
      if (place == null) {
        showSnackBar('location_not_found'.tr);
        await readCache();
        return;
      }
      await _fetchAndSave(place.lat, place.lon, place.district, place.city);
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

  Future<void> _scheduleNotifications(
    MainWeatherCache weather,
    String city,
  ) async {
    await ref
        .read(notificationServiceProvider)
        .scheduleIfEmpty(
          cache: weather,
          settings: ref.read(settingsProvider),
          appSettings: ref.read(appSettingsProvider),
          cityLabel: city,
        );
  }

  Future<Map<String, dynamic>> getCurrentLocationSearch() async {
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
    }
    if (!await ref.read(locationServiceProvider).isServiceEnabled()) {
      showSnackBar('no_location'.tr);
    }
    final place = await ref.read(locationServiceProvider).getCurrentPlace();
    if (place == null) return {};
    return {
      'lat': place.lat,
      'lon': place.lon,
      'city': place.district,
      'district': place.city,
    };
  }

  TimeOfDay parseTime(String? timeStr) => TimeIndexHelper.parseTime(timeStr);

  String timeTo24h(TimeOfDay time) => TimeIndexHelper.timeTo24h(time);

  String formatTime(String? timeStr) => TimeIndexHelper.formatTime(
    timeStr,
    ref.read(settingsProvider),
    ref.read(localeProvider).languageCode,
  );
}
