part of 'main_weather_notifier.dart';

mixin _MainWeatherRefreshOps on _MainWeatherNotifierCore {
  Future<void> deleteAll(bool changeCity) =>
      _enqueue(() => _deleteAllImpl(changeCity));

  Future<void> _deleteAllImpl(bool changeCity) async {
    if (!ref.mounted || _queue.isCancelled) return;
    if (!await ConnectivityService.hasInternet()) return;
    if (!ref.mounted || _queue.isCancelled) return;
    final settings = ref.read(settingsProvider);
    final serviceEnabled = await ref
        .read(locationServiceProvider)
        .isServiceEnabled();
    if (!ref.mounted || _queue.isCancelled) return;
    await ref.read(notificationServiceProvider).cancelAll();
    if (!ref.mounted || _queue.isCancelled) return;
    if (!settings.location) {
      await ref.read(weatherRepositoryProvider).clearMainOnly();
    }
    // Clear location cache when switching city, or when GPS location mode is
    // active and the service is available.
    if (changeCity || (settings.location && serviceEnabled)) {
      await ref.read(weatherRepositoryProvider).clearMainAndLocation();
    }
  }

  /// Pulls fresh forecast data when online, otherwise reloads from cache.
  Future<void> refresh() => _enqueue(_refreshImpl);

  Future<void> _refreshImpl() async {
    await NetworkCacheHandler.fetchOrKeepCache(
      onOffline: () => _emitUserMessage('no_inter'),
      onError: () => _emitUserMessage('error_occurred', isError: true),
      onNetworkFetch: _refreshFromNetwork,
      onUseCache: _readCacheImpl,
    );
  }

  /// Coordinates foreground refresh when the app returns to the foreground.
  ///
  /// Refreshes stale forecast data when needed; otherwise syncs time indices and
  /// runs Android widget/notification side effects once via [HomeWidgetService].
  Future<void> onAppResumed() => _enqueue(_onAppResumedImpl);

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
  Future<void> refreshIfStale() => _enqueue(_refreshIfStaleImpl);

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
      await _getCurrentLocationImpl(showLoading: false, forceLoading: false);
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
        _emitUserMessage('no_location');
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
}
