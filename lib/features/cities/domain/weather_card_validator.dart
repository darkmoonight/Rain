import 'package:rain/data/models/db.dart';

/// Validates completeness, expiry, and searchability of saved weather cards.
class WeatherCardValidator {
  const WeatherCardValidator._();

  /// Returns true when [card] has all fields required for display.
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

  /// Returns true when [card] was last updated before [expiry].
  static bool isExpired(WeatherCard card, DateTime expiry) =>
      card.timestamp == null || card.timestamp!.isBefore(expiry);

  /// Keeps only cards that pass [isComplete].
  static List<WeatherCard> filterComplete(Iterable<WeatherCard> cards) =>
      cards.where(isComplete).toList();

  /// Keeps only cards that pass [isExpired].
  static List<WeatherCard> filterExpired(
    Iterable<WeatherCard> cards,
    DateTime expiry,
  ) => cards.where((card) => isExpired(card, expiry)).toList();

  /// Matches [card] against a lowercased city or district [query].
  static bool matchesSearch(WeatherCard card, String query) {
    if (query.isEmpty) return true;
    final city = card.city?.toLowerCase() ?? '';
    final district = card.district?.toLowerCase() ?? '';
    return city.contains(query) || district.contains(query);
  }

  /// Finds a card by [id] in [cards], or returns null.
  static WeatherCard? findById(List<WeatherCard> cards, int id) {
    for (final card in cards) {
      if (card.id == id) return card;
    }
    return null;
  }

  /// Returns true when list indices no longer match each card's stored index.
  static bool needsIndexRepair(List<WeatherCard> cards) =>
      cards.asMap().entries.any((e) => e.value.index != e.key);

  /// Rewrites each card's index to match its position in [cards].
  static void applyRepairedIndices(List<WeatherCard> cards) {
    for (var i = 0; i < cards.length; i++) {
      cards[i].index = i;
    }
  }
}
