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

final citiesNotifierProvider = NotifierProvider<CitiesNotifier, CitiesState>(
  CitiesNotifier.new,
);

class CitiesNotifier extends Notifier<CitiesState> {
  final _queue = AsyncQueue();

  static const _refreshConcurrency = 3;

  DateTime get _cacheExpiryThreshold =>
      DateTime.now().subtract(AppConstants.cacheExpiry);

  CitiesRepository get _repo => ref.read(citiesRepositoryProvider);

  @override
  CitiesState build() => const CitiesState(isLoading: true);

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

  Future<bool> _requireInternet() async {
    if (await ConnectivityService.hasInternet()) return true;
    showSnackBar('no_inter'.tr);
    return false;
  }

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

  Future<void> refresh({bool all = true}) =>
      _queue.enqueue(() => _refreshImpl(all: all));

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

  Future<bool> _updateSingleCard(WeatherCard oldCard) async {
    try {
      await _fetchAndApplyRemote(oldCard);
      return true;
    } catch (error, stackTrace) {
      debugLogError('CitiesNotifier._updateSingleCard', error, stackTrace);
      return false;
    }
  }

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

  Future<void> updateCard(WeatherCard card) => _queue.enqueue(
    () => _runOnlineAction('updateCard', () => _fetchAndApplyRemote(card)),
  );

  Future<void> deleteCard(WeatherCard card) => _queue.enqueue(() async {
    await _repo.deleteCard(card);
    await _loadImpl();
  });

  Future<void> reorder(int oldIndex, int newIndex) => _queue.enqueue(() async {
    await _repo.reorder(oldIndex, newIndex);
    await _loadImpl();
  });
}
