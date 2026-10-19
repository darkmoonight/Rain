import 'package:isar_community/isar.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/domain/entities/saved_place.dart';
import 'package:rain/domain/repositories/cities_repository.dart';
import 'package:rain/features/cities/domain/weather_card_validator.dart';

/// Isar + remote implementation of [CitiesRepository].
class IsarCitiesRepository implements CitiesRepository {
  IsarCitiesRepository(this._isar, this._remote);

  final Isar _isar;
  final WeatherRemoteDatasource _remote;

  @override
  Future<List<SavedPlace>> getAllSorted() async {
    await repairIndices();
    final cards = await _isar.weatherCards.where().sortByIndex().findAll();
    return cards.map(DomainMapper.cardToDomain).toList();
  }

  @override
  Future<void> repairIndices() async {
    final cards = await _isar.weatherCards.where().findAll();
    if (cards.isEmpty) return;
    cards.sort((a, b) => (a.index ?? 1 << 30).compareTo(b.index ?? 1 << 30));
    final places = cards.map(DomainMapper.cardToDomain).toList();
    if (!WeatherCardValidator.needsIndexRepair(places)) return;
    final repaired = WeatherCardValidator.applyRepairedIndices(places);
    await _isar.writeTxn(() async {
      for (var i = 0; i < cards.length; i++) {
        cards[i].index = repaired[i].index;
        await _isar.weatherCards.put(cards[i]);
      }
    });
  }

  @override
  Future<List<SavedPlace>> getExpiredSorted(DateTime expiry) async {
    final cards = await getAllSorted();
    return WeatherCardValidator.filterExpired(cards, expiry);
  }

  @override
  Future<SavedPlace> fetchCard(
    double lat,
    double lon,
    String city,
    String district,
  ) async {
    final card = await _remote.fetchWeatherCard(lat, lon, city, district);
    return DomainMapper.cardToDomain(card);
  }

  @override
  Future<SavedPlace> addCard(SavedPlace place) async {
    late SavedPlace saved;
    await _isar.writeTxn(() async {
      final cards = await _isar.weatherCards.where().sortByIndex().findAll();
      final card = DomainMapper.cardToIsar(place.copyWith(index: cards.length));
      await _isar.weatherCards.put(card);
      saved = DomainMapper.cardToDomain(card);
    });
    return saved;
  }

  @override
  Future<SavedPlace> updateCard(SavedPlace place) async {
    final existing = place.id == null
        ? null
        : await _isar.weatherCards.get(place.id!);
    final card = DomainMapper.cardToIsar(place, existing: existing);
    await _isar.writeTxn(() => _isar.weatherCards.put(card));
    return DomainMapper.cardToDomain(card);
  }

  @override
  Future<void> deleteCard(SavedPlace place) async {
    final id = place.id;
    if (id == null) return;
    await _isar.writeTxn(() => _isar.weatherCards.delete(id));
  }

  @override
  Future<SavedPlace> applyRemoteUpdate(
    SavedPlace oldPlace,
    SavedPlace updated,
  ) async {
    final merged = DomainMapper.mergeSavedPlaceForecast(oldPlace, updated);
    return updateCard(merged);
  }

  @override
  Future<void> reorder(int oldIndex, int newIndex) async {
    final places = await getAllSorted();
    if (newIndex > oldIndex) newIndex -= 1;
    final element = places.removeAt(oldIndex);
    places.insert(newIndex, element);
    final repaired = WeatherCardValidator.applyRepairedIndices(places);
    await _isar.writeTxn(() async {
      for (final place in repaired) {
        final existing = place.id == null
            ? null
            : await _isar.weatherCards.get(place.id!);
        final card = DomainMapper.cardToIsar(place, existing: existing);
        await _isar.weatherCards.put(card);
      }
    });
  }
}
