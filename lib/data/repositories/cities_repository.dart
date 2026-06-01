import 'package:isar_community/isar.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/mappers/weather_mapper.dart';
import 'package:rain/data/models/db.dart';

class CitiesRepository {
  CitiesRepository(this._isar, this._remote);

  final Isar _isar;
  final WeatherRemoteDatasource _remote;

  Future<List<WeatherCard>> getAllSorted() =>
      _isar.weatherCards.where().sortByIndex().findAll();

  Future<List<WeatherCard>> getExpiredSorted(DateTime expiry) => _isar
      .weatherCards
      .filter()
      .timestampLessThan(expiry)
      .sortByIndex()
      .findAll();

  Future<WeatherCard> fetchCard(
    double lat,
    double lon,
    String city,
    String district,
    String timezone,
  ) => _remote.fetchWeatherCard(lat, lon, city, district, timezone);

  Future<void> addCard(WeatherCard card) async {
    await _isar.writeTxn(() => _isar.weatherCards.put(card));
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
    for (var i = 0; i < cards.length; i++) {
      cards[i].index = i;
      await _isar.writeTxn(() => _isar.weatherCards.put(cards[i]));
    }
  }
}
