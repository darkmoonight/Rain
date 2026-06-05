import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/services/connectivity_service.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/core/utils/show_snack_bar.dart';
import 'package:rain/core/weather/time_index_helper.dart';
import 'package:rain/data/models/db.dart';

class CitiesState {
  const CitiesState({this.cards = const [], this.isLoading = false});

  final List<WeatherCard> cards;
  final bool isLoading;

  CitiesState copyWith({List<WeatherCard>? cards, bool? isLoading}) =>
      CitiesState(
        cards: cards ?? this.cards,
        isLoading: isLoading ?? this.isLoading,
      );
}

final citiesNotifierProvider = NotifierProvider<CitiesNotifier, CitiesState>(
  CitiesNotifier.new,
);

class CitiesNotifier extends Notifier<CitiesState> {
  late final DateTime _cacheExpiry;

  @override
  CitiesState build() {
    _cacheExpiry = DateTime.now().subtract(AppConstants.cacheExpiry);
    Future.microtask(_load);
    return const CitiesState(isLoading: true);
  }

  Future<void> _load() async {
    final cards = await ref.read(citiesRepositoryProvider).getAllSorted();
    state = CitiesState(cards: cards, isLoading: false);
  }

  Future<void> refresh({bool all = true}) async {
    final repo = ref.read(citiesRepositoryProvider);
    final toUpdate = all
        ? await repo.getAllSorted()
        : await repo.getExpiredSorted(_cacheExpiry);
    if (!await ConnectivityService.hasInternet()) {
      await _load();
      return;
    }
    if (toUpdate.isEmpty) {
      await _load();
      return;
    }
    var hadFailure = false;
    for (final oldCard in toUpdate) {
      try {
        final updated = await repo.fetchCard(
          oldCard.lat!,
          oldCard.lon!,
          oldCard.city!,
          oldCard.district!,
          oldCard.timezone!,
        );
        await repo.applyRemoteUpdate(oldCard, updated);
      } catch (_) {
        hadFailure = true;
      }
    }
    await _load();
    if (hadFailure && all) {
      showSnackBar('error_occurred'.tr, isError: true);
    }
  }

  Future<void> addCard(
    double latitude,
    double longitude,
    String city,
    String district,
  ) async {
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
      return;
    }
    final tz = tzmap.latLngToTimezoneString(latitude, longitude);
    try {
      final card = await ref
          .read(citiesRepositoryProvider)
          .fetchCard(latitude, longitude, city, district, tz);
      await ref.read(citiesRepositoryProvider).addCard(card);
      await _load();
    } catch (_) {
      showSnackBar('error_occurred'.tr, isError: true);
    }
  }

  Future<void> updateCardLocation(
    WeatherCard card,
    double latitude,
    double longitude,
    String city,
    String district,
  ) async {
    if (!await ConnectivityService.hasInternet()) {
      showSnackBar('no_inter'.tr);
      return;
    }
    final tz = tzmap.latLngToTimezoneString(latitude, longitude);
    try {
      final updated = await ref
          .read(citiesRepositoryProvider)
          .fetchCard(latitude, longitude, city, district, tz);
      card.lat = latitude;
      card.lon = longitude;
      card.city = city;
      card.district = district;
      card.timezone = tz;
      await ref.read(citiesRepositoryProvider).applyRemoteUpdate(card, updated);
      await _load();
    } catch (_) {
      showSnackBar('error_occurred'.tr, isError: true);
    }
  }

  Future<void> updateCard(WeatherCard card) async {
    if (!await ConnectivityService.hasInternet()) return;
    try {
      final updated = await ref
          .read(citiesRepositoryProvider)
          .fetchCard(
            card.lat!,
            card.lon!,
            card.city!,
            card.district!,
            card.timezone!,
          );
      await ref.read(citiesRepositoryProvider).applyRemoteUpdate(card, updated);
      await _load();
    } catch (_) {
      showSnackBar('error_occurred'.tr, isError: true);
    }
  }

  Future<void> deleteCard(WeatherCard card) async {
    await ref.read(citiesRepositoryProvider).deleteCard(card);
    await _load();
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    await ref.read(citiesRepositoryProvider).reorder(oldIndex, newIndex);
    await _load();
  }

  int getTime(List<String> time, String timezone) =>
      TimeIndexHelper.getTime(time, timezone);

  int getDay(List<DateTime> time, String timezone) =>
      TimeIndexHelper.getDay(time, timezone);
}
