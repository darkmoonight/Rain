import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
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
      DateTime.now().subtract(AppConstants.cacheExpiry);

  CitiesRepository get _repo => ref.read(citiesRepositoryProvider);

  @override
  CitiesState build() => const CitiesState(isLoading: true);

  // --- Loading ---

  /// Reads cards from the database and updates state, preserving prior cards on error.
  Future<void> _loadImpl() async {
    final previousCards = state.cards;
    try {
      final result = CitiesLoadResolver.resolve(
        fromDb: await _repo.getAllSorted(),
        previous: previousCards,
      );
      state = state.copyWith(
        cards: result.cards,
        isLoading: false,
        loadError: result.loadError,
      );
    } catch (error, stackTrace) {
      debugLogError('CitiesNotifier._loadImpl', error, stackTrace);
      state = state.copyWith(isLoading: false, loadError: true);
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
    final timezone = latitude != null && longitude != null
        ? tzmap.latLngToTimezoneString(latitude, longitude)
        : target.timezone;

    if (lat == null ||
        lon == null ||
        cityName == null ||
        districtName == null ||
        timezone == null) {
      throw StateError('WeatherCard ${target.id} is missing location metadata');
    }

    final updated = await _repo.fetchCard(
      lat,
      lon,
      cityName,
      districtName,
      timezone,
    );

    if (latitude != null && longitude != null) {
      target
        ..lat = latitude
        ..lon = longitude
        ..city = city
        ..district = district
        ..timezone = timezone;
    }

    await _repo.applyRemoteUpdate(target, updated);
  }

  // --- Refresh ---

  /// Queues a network refresh for expired cards, or all cards when [all] is true.
  Future<void> refresh({bool all = true}) =>
      _queue.enqueue(() => _refreshImpl(all: all));

  /// Refreshes expired or all cards from the network, falling back to cache.
  Future<void> _refreshImpl({required bool all}) async {
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

  // --- Public API ---

  /// Fetches and saves a new city card at the given coordinates.
  Future<void> addCard(
    double latitude,
    double longitude,
    String city,
    String district,
  ) => _queue.enqueue(
    () => _runOnlineAction('addCard', () async {
      final tz = tzmap.latLngToTimezoneString(latitude, longitude);
      final card = await _repo.fetchCard(
        latitude,
        longitude,
        city,
        district,
        tz,
      );
      await _repo.addCard(card);
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
  Future<void> deleteCard(WeatherCard card) => _queue.enqueue(() async {
    await _repo.deleteCard(card);
    await _loadImpl();
  });

  /// Persists a new card order after drag-and-drop reordering.
  Future<void> reorder(int oldIndex, int newIndex) => _queue.enqueue(() async {
    await _repo.reorder(oldIndex, newIndex);
    await _loadImpl();
  });
}
