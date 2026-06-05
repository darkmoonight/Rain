import 'package:isar_community/isar.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/mappers/weather_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';

class CitiesRepository {
  CitiesRepository(this._isar, this._remote);

  final Isar _isar;
  final WeatherRemoteDatasource _remote;

  Future<List<WeatherCard>> getAllSorted() async {
    await repairIndices();
    return _isar.weatherCards.where().sortByIndex().findAll();
  }

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

  Future<List<WeatherCard>> getExpiredSorted(DateTime expiry) async {
    final cards = await getAllSorted();
    return WeatherCardValidator.filterExpired(cards, expiry);
  }

  Future<WeatherCard> fetchCard(
    double lat,
    double lon,
    String city,
    String district,
    String timezone,
  ) => _remote.fetchWeatherCard(lat, lon, city, district, timezone);

  Future<void> addCard(WeatherCard card) async {
    await _isar.writeTxn(() async {
      final cards = await _isar.weatherCards.where().sortByIndex().findAll();
      card.index = cards.length;
      await _isar.weatherCards.put(card);
    });
  }

  Future<void> updateCard(WeatherCard card) async {
    await _isar.writeTxn(() => _isar.weatherCards.put(card));
  }

  Future<void> deleteCard(WeatherCard card) async {
    await _isar.writeTxn(() => _isar.weatherCards.delete(card.id));
  }

  Future<void> applyRemoteUpdate(
    WeatherCard oldCard,
    WeatherCard updated,
  ) async {
    WeatherMapper.copyWeatherCardFields(oldCard, updated);
    await _isar.writeTxn(() => _isar.weatherCards.put(oldCard));
  }

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
