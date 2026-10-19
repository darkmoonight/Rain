part of 'main_weather_notifier.dart';

mixin _MainWeatherLocationOps on _MainWeatherNotifierCore {
  /// Chooses GPS, cached, or remote fetch based on settings, cache age, and connectivity.
  @override
  Future<void> setLocation() => _enqueue(_setLocationImpl);

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
  }) => _enqueue(
    () => _getCurrentLocationImpl(
      showLoading: showLoading,
      forceLoading: forceLoading,
    ),
  );

  @override
  Future<void> _getCurrentLocationImpl({
    bool showLoading = true,
    bool forceLoading = false,
  }) async {
    if (!ref.mounted || _queue.isCancelled) return;
    if (showLoading && (!_hasDisplayableForecast || forceLoading)) {
      _setState(state.copyWith(isLoading: true));
    }
    if (!await ConnectivityService.hasInternet()) {
      if (ref.mounted) _emitUserMessage('no_inter');
      await _readCacheImpl();
      return;
    }
    if (!ref.mounted || _queue.isCancelled) return;
    final locationService = ref.read(locationServiceProvider);
    if (!await locationService.isServiceEnabled()) {
      if (ref.mounted) _emitUserMessage('no_location');
      await _readCacheImpl();
      return;
    }
    if (!ref.mounted || _queue.isCancelled) return;
    try {
      await NetworkCacheHandler.fetchOrKeepCache(
        onNetworkFetch: _fetchFromGps,
        onUseCache: _readCacheImpl,
        onError: () {
          if (ref.mounted) _emitUserMessage('error_occurred', isError: true);
        },
      );
    } finally {
      if (ref.mounted && state.isLoading) {
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
  }) => _enqueue(
    () => _getLocationImpl(
      latitude,
      longitude,
      district,
      locality,
      showLoading: showLoading,
    ),
  );

  @override
  Future<void> _getLocationImpl(
    double latitude,
    double longitude,
    String district,
    String locality, {
    bool showLoading = true,
  }) async {
    if (!ref.mounted || _queue.isCancelled) return;
    if (!await ConnectivityService.hasInternet()) {
      if (ref.mounted) _emitUserMessage('no_inter');
      await _readCacheImpl();
      return;
    }
    if (!ref.mounted || _queue.isCancelled) return;
    if (showLoading && !_hasDisplayableForecast) {
      _setState(state.copyWith(isLoading: true));
    }
    try {
      await NetworkCacheHandler.fetchOrKeepCache(
        onNetworkFetch: () =>
            _fetchAndSave(latitude, longitude, district, locality),
        onUseCache: _readCacheImpl,
        onError: () {
          if (ref.mounted) _emitUserMessage('error_occurred', isError: true);
        },
      );
    } finally {
      if (ref.mounted && state.isLoading) {
        await _readCacheImpl();
      }
    }
  }

  /// Resolves the current GPS position and persists its forecast.
  @override
  Future<void> _fetchFromGps() async {
    if (!ref.mounted || _queue.isCancelled) return;
    final place = await ref
        .read(locationServiceProvider)
        .getCurrentPlace(resolveLabels: _reverseGeocodeLabels);
    if (!ref.mounted || _queue.isCancelled) return;
    if (place == null) {
      _emitUserMessage('location_not_found');
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
        .read(weatherRepositoryProvider)
        .reverseGeocode(lat, lon, languageCode: languageCode);
  }

  /// Fetches remote data, writes cache, and reloads local state.
  @override
  Future<void> _fetchAndSave(
    double lat,
    double lon,
    String district,
    String city,
  ) async {
    if (!ref.mounted || _queue.isCancelled) return;
    final resolvedLabels = await _resolveMissingLabels(
      lat,
      lon,
      city,
      district,
    );
    if (!ref.mounted || _queue.isCancelled) return;
    var weather = await ref
        .read(weatherRepositoryProvider)
        .fetchWeather(lat, lon);
    if (!ref.mounted || _queue.isCancelled) return;
    weather = weather.copyWith(
      timezone: LocationTimezoneHelper.resolve(
        cached: weather.timezone,
        lat: lat,
        lon: lon,
      ),
    );
    final location = GeoPlace(
      lat: lat,
      lon: lon,
      city: resolvedLabels.city,
      district: resolvedLabels.district,
    );
    await ref.read(weatherRepositoryProvider).writeCache(weather, location);
    if (!ref.mounted || _queue.isCancelled) return;
    await persistClockSkew(ref, weather.clockSkewSeconds ?? 0);
    if (!ref.mounted || _queue.isCancelled) return;
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

}
