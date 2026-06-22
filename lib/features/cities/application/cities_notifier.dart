import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/settings/clock_skew_persistence.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/core/services/network_cache_handler.dart';
import 'package:rain/core/utils/async_queue.dart';
import 'package:rain/core/utils/debug_log.dart';
import 'package:rain/core/utils/parallel_runner.dart';
import 'package:rain/features/cities/domain/cities_load_resolver.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/show_snack_bar.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/repositories/cities_repository.dart';

/// Immutable state for the saved-cities list and its load/refresh flags.
class CitiesState {
  const CitiesState({
    this.cards = const [],
    this.isLoading = false,
    this.isRefreshing = false,
    this.loadError = false,
  });

  final List<WeatherCard> cards;
  final bool isLoading;
  final bool isRefreshing;
  final bool loadError;

  /// Returns a copy with selectively replaced cards, loading flags, and error state.
  CitiesState copyWith({
    List<WeatherCard>? cards,
    bool? isLoading,
    bool? isRefreshing,
    bool? loadError,
  }) => CitiesState(
    cards: cards ?? this.cards,
    isLoading: isLoading ?? this.isLoading,
    isRefreshing: isRefreshing ?? this.isRefreshing,
    loadError: loadError ?? this.loadError,
  );

  /// Returns the card with [id], or null when it is not in [cards].
  WeatherCard? cardById(int id) => WeatherCardValidator.findById(cards, id);
}

/// Riverpod provider for [CitiesNotifier].
final citiesNotifierProvider = NotifierProvider<CitiesNotifier, CitiesState>(
  CitiesNotifier.new,
);

/// Loads, refreshes, and mutates the user's saved weather cards.
class CitiesNotifier extends Notifier<CitiesState> {
  final _queue = AsyncQueue();

  static const _refreshConcurrency = 3;

  DateTime get _cacheExpiryThreshold =>
      AppConstants.weatherCacheExpiryThreshold();

  /// Provides access to the cities repository from Riverpod.
  CitiesRepository get _repo => ref.read(citiesRepositoryProvider);

  /// True when [state] already has at least one card that can be rendered.
  bool get _hasDisplayableCards =>
      WeatherCardValidator.filterComplete(state.cards).isNotEmpty;

  /// Initializes loading state and schedules a cache read before [HomeScreen] refresh.
  @override
  CitiesState build() {
    Future.microtask(loadFromCache);
    return const CitiesState(isLoading: true);
  }

  /// Loads saved cards from local storage into [state].
  Future<void> loadFromCache() => _queue.enqueue(_loadImpl);

  /// Reads cards from the database; DB errors set [loadError] only when cards remain in state.
  Future<void> _loadImpl() async {
    try {
      final result = CitiesLoadResolver.resolve(
        fromDb: await _repo.getAllSorted(),
      );
      state = state.copyWith(
        cards: result.cards,
        isLoading: false,
        loadError: false,
      );
    } catch (error, stackTrace) {
      debugLogError('CitiesNotifier._loadImpl', error, stackTrace);
      state = state.copyWith(
        isLoading: false,
        loadError: state.cards.isNotEmpty,
      );
    }
  }

  /// Returns false and shows a snackbar when the device is offline.
  Future<bool> _requireInternet() async {
    if (await ConnectivityService.hasInternet()) return true;
    showSnackBar('no_inter'.tr);
    return false;
  }

  /// Runs an online-only action and reloads cards afterward.
  Future<void> _runOnlineAction(
    String context,
    Future<void> Function() action,
  ) async {
    if (!await _requireInternet()) return;
    try {
      await action();
      await _loadImpl();
    } catch (error, stackTrace) {
      debugLogError('CitiesNotifier.$context', error, stackTrace);
      showSnackBar('error_occurred'.tr, isError: true);
    }
  }

  /// Fetches fresh forecast data for [target] and persists the update.
  Future<void> _fetchAndApplyRemote(
    WeatherCard target, {
    double? latitude,
    double? longitude,
    String? city,
    String? district,
  }) async {
    final lat = latitude ?? target.lat;
    final lon = longitude ?? target.lon;
    final cityName = city ?? target.city;
    final districtName = district ?? target.district;

    if (lat == null ||
        lon == null ||
        cityName == null ||
        districtName == null) {
      throw StateError('WeatherCard ${target.id} is missing location metadata');
    }

    final updated = await _repo.fetchCard(lat, lon, cityName, districtName);

    if (latitude != null && longitude != null) {
      target
        ..lat = latitude
        ..lon = longitude
        ..city = city
        ..district = district;
    }

    await _repo.applyRemoteUpdate(target, updated);
    await persistClockSkew(ref, updated.clockSkewSeconds ?? 0);
  }

  /// Queues a network refresh for expired cards, or all cards when [all] is true.
  Future<void> refresh({bool all = true}) =>
      _queue.enqueue(() => _refreshImpl(all: all));

  /// Refreshes only expired cards when the 12h cache window has passed.
  ///
  /// Used on app start and resume so saved cities keep showing cached forecasts
  /// while a background refresh runs (or times out).
  Future<void> refreshIfStale() => _queue.enqueue(_refreshIfStaleImpl);

  Future<void> _refreshIfStaleImpl() async {
    if (!_hasDisplayableCards) {
      await _loadImpl();
    }

    final toUpdate = WeatherCardValidator.filterComplete(
      await _repo.getExpiredSorted(_cacheExpiryThreshold),
    );
    if (toUpdate.isEmpty) return;

    state = state.copyWith(isRefreshing: true, loadError: false);
    try {
      await NetworkCacheHandler.fetchOrKeepCache(
        onNetworkFetch: () => _fetchRemoteUpdates(all: false),
        onUseCache: _loadImpl,
      );
    } finally {
      state = state.copyWith(isRefreshing: false);
    }
  }

  /// Refreshes expired or all cards from the network, falling back to cache.
  Future<void> _refreshImpl({required bool all}) async {
    // Stale-while-revalidate: keep showing cached cards while the 12h refresh
    // runs (or times out) instead of the full-list shimmer.
    if (!_hasDisplayableCards) {
      await _loadImpl();
    }

    state = state.copyWith(isRefreshing: true, loadError: false);
    try {
      await NetworkCacheHandler.fetchOrKeepCache(
        onNetworkFetch: () => _fetchRemoteUpdates(all: all),
        onUseCache: _loadImpl,
        onError: () {
          if (all) showSnackBar('error_occurred'.tr, isError: true);
        },
      );
    } finally {
      state = state.copyWith(isRefreshing: false);
    }
  }

  /// Fetches remote updates for complete cards in parallel, then reloads.
  Future<void> _fetchRemoteUpdates({required bool all}) async {
    final toUpdate = WeatherCardValidator.filterComplete(
      all
          ? await _repo.getAllSorted()
          : await _repo.getExpiredSorted(_cacheExpiryThreshold),
    );

    if (toUpdate.isEmpty) {
      await _loadImpl();
      return;
    }

    final results = await ParallelRunner.mapLimited(
      items: toUpdate,
      concurrency: _refreshConcurrency,
      run: (oldCard) => _updateSingleCard(oldCard),
    );

    await _loadImpl();

    if (results.contains(false) && all) {
      showSnackBar('error_occurred'.tr, isError: true);
    }
  }

  /// Updates a single card from the network; returns false on failure.
  Future<bool> _updateSingleCard(WeatherCard oldCard) async {
    try {
      await _fetchAndApplyRemote(oldCard);
      return true;
    } catch (error, stackTrace) {
      debugLogError('CitiesNotifier._updateSingleCard', error, stackTrace);
      return false;
    }
  }

  /// Fetches and saves a new city card at the given coordinates.
  Future<void> addCard(
    double latitude,
    double longitude,
    String city,
    String district,
  ) => _queue.enqueue(
    () => _runOnlineAction('addCard', () async {
      final card = await _repo.fetchCard(latitude, longitude, city, district);
      await _repo.addCard(card);
      await persistClockSkew(ref, card.clockSkewSeconds ?? 0);
    }),
  );

  /// Re-fetches forecast data after the card's location label or coordinates change.
  Future<void> updateCardLocation(
    WeatherCard card,
    double latitude,
    double longitude,
    String city,
    String district,
  ) => _queue.enqueue(
    () => _runOnlineAction(
      'updateCardLocation',
      () => _fetchAndApplyRemote(
        card,
        latitude: latitude,
        longitude: longitude,
        city: city,
        district: district,
      ),
    ),
  );

  /// Re-fetches and persists fresh forecast data for an existing card.
  Future<void> updateCard(WeatherCard card) => _queue.enqueue(
    () => _runOnlineAction('updateCard', () => _fetchAndApplyRemote(card)),
  );

  /// Removes [card] from storage and reloads the list.
  Future<void> deleteCard(WeatherCard card) {
    final previousCards = state.cards;
    state = state.copyWith(
      cards: state.cards.where((c) => c.id != card.id).toList(),
      loadError: false,
    );
    return _queue.enqueue(() async {
      try {
        await _repo.deleteCard(card);
        await _loadImpl();
      } catch (error, stackTrace) {
        debugLogError('CitiesNotifier.deleteCard', error, stackTrace);
        state = state.copyWith(cards: previousCards, loadError: false);
        rethrow;
      }
    });
  }

  /// Persists a new card order after drag-and-drop reordering.
  Future<void> reorder(int oldIndex, int newIndex) => _queue.enqueue(() async {
    await _repo.reorder(oldIndex, newIndex);
    await _loadImpl();
  });
}
