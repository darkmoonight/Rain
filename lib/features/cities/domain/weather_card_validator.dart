import 'package:rain/data/models/db.dart';

class WeatherCardValidator {
  const WeatherCardValidator._();

  static bool isComplete(WeatherCard card) =>
      card.time != null &&
      card.time!.isNotEmpty &&
      card.timeDaily != null &&
      card.timeDaily!.isNotEmpty &&
      card.sunrise != null &&
      card.sunset != null &&
      card.weathercode != null &&
      card.weathercode!.isNotEmpty &&
      card.temperature2M != null &&
      card.temperature2M!.isNotEmpty &&
      card.city != null &&
      card.timezone != null &&
      card.lat != null &&
      card.lon != null;

  static bool isExpired(WeatherCard card, DateTime expiry) =>
      card.timestamp == null || card.timestamp!.isBefore(expiry);

  static List<WeatherCard> filterComplete(Iterable<WeatherCard> cards) =>
      cards.where(isComplete).toList();

  static List<WeatherCard> filterExpired(
    Iterable<WeatherCard> cards,
    DateTime expiry,
  ) => cards.where((card) => isExpired(card, expiry)).toList();

  static bool matchesSearch(WeatherCard card, String query) {
    if (query.isEmpty) return true;
    final city = card.city?.toLowerCase() ?? '';
    final district = card.district?.toLowerCase() ?? '';
    return city.contains(query) || district.contains(query);
  }

  static WeatherCard? findById(List<WeatherCard> cards, int id) {
    for (final card in cards) {
      if (card.id == id) return card;
    }
    return null;
  }

  /// Returns cards with sequential [index] values when repair is needed.
  static bool needsIndexRepair(List<WeatherCard> cards) =>
      cards.asMap().entries.any((e) => e.value.index != e.key);

  static void applyRepairedIndices(List<WeatherCard> cards) {
    for (var i = 0; i < cards.length; i++) {
      cards[i].index = i;
    }
  }
}
