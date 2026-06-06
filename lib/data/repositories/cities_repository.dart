import 'package:isar_community/isar.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/mappers/weather_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';

/// Manages saved city weather cards in Isar and refreshes them from the remote API.
class CitiesRepository {
  CitiesRepository(this._isar, this._remote);

  final Isar _isar;
  final WeatherRemoteDatasource _remote;

  // --- Read ---

  /// Returns all weather cards sorted by display index, repairing gaps first.
  Future<List<WeatherCard>> getAllSorted() async {
    await repairIndices();
    return _isar.weatherCards.where().sortByIndex().findAll();
  }

  /// Reassigns sequential indices when stored card order has gaps or duplicates.
  Future<void> repairIndices() async {
    final cards = await _isar.weatherCards.where().findAll();
    if (cards.isEmpty) return;
    cards.sort((a, b) => (a.index ?? 1 << 30).compareTo(b.index ?? 1 << 30));
    if (!WeatherCardValidator.needsIndexRepair(cards)) return;
    WeatherCardValidator.applyRepairedIndices(cards);
    await _isar.writeTxn(() async {
      for (final card in cards) {
        await _isar.weatherCards.put(card);
      }
    });
  }

  /// Returns sorted cards whose cached forecast is older than [expiry].
  Future<List<WeatherCard>> getExpiredSorted(DateTime expiry) async {
    final cards = await getAllSorted();
    return WeatherCardValidator.filterExpired(cards, expiry);
  }

  // --- Remote fetch ---

  /// Fetches fresh forecast data for a city and returns it as a weather card.
  Future<WeatherCard> fetchCard(
    double lat,
    double lon,
    String city,
    String district,
    String timezone,
  ) => _remote.fetchWeatherCard(lat, lon, city, district, timezone);

  // --- Write ---

  /// Appends a new weather card at the end of the saved list.
  Future<void> addCard(WeatherCard card) async {
    await _isar.writeTxn(() async {
      final cards = await _isar.weatherCards.where().sortByIndex().findAll();
      card.index = cards.length;
      await _isar.weatherCards.put(card);
    });
  }

  /// Persists changes to an existing weather card.
  Future<void> updateCard(WeatherCard card) async {
    await _isar.writeTxn(() => _isar.weatherCards.put(card));
  }

  /// Removes a weather card from local storage.
  Future<void> deleteCard(WeatherCard card) async {
    await _isar.writeTxn(() => _isar.weatherCards.delete(card.id));
  }

  /// Copies refreshed forecast fields onto [oldCard] and saves it in place.
  Future<void> applyRemoteUpdate(
    WeatherCard oldCard,
    WeatherCard updated,
  ) async {
    WeatherMapper.copyWeatherCardFields(oldCard, updated);
    await _isar.writeTxn(() => _isar.weatherCards.put(oldCard));
  }

  // --- Reorder ---

  /// Moves a card from [oldIndex] to [newIndex] and rewrites display indices.
  Future<void> reorder(int oldIndex, int newIndex) async {
    final cards = await getAllSorted();
    if (newIndex > oldIndex) newIndex -= 1;
    final element = cards.removeAt(oldIndex);
    cards.insert(newIndex, element);
    WeatherCardValidator.applyRepairedIndices(cards);
    await _isar.writeTxn(() async {
      for (final card in cards) {
        await _isar.weatherCards.put(card);
      }
    });
  }
}
