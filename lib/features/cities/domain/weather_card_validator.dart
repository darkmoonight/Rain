import 'package:rain/domain/entities/saved_place.dart';

/// Validates completeness, expiry, and searchability of saved weather cards.
class WeatherCardValidator {
  const WeatherCardValidator._();

  /// Returns true when [card] has forecast and location fields required for network refresh.
  static bool isComplete(SavedPlace card) => card.isTileReady;

  /// Returns true when [card] has no timestamp or was last updated before [expiry].
  static bool isExpired(SavedPlace card, DateTime expiry) =>
      card.timestamp == null || card.timestamp!.isBefore(expiry);

  /// Keeps only cards that pass [isComplete].
  static List<SavedPlace> filterComplete(Iterable<SavedPlace> cards) =>
      cards.where(isComplete).toList();

  /// Keeps only cards that pass [isExpired].
  static List<SavedPlace> filterExpired(
    Iterable<SavedPlace> cards,
    DateTime expiry,
  ) => cards.where((card) => isExpired(card, expiry)).toList();

  /// Matches [card] against a lowercased city or district [query].
  static bool matchesSearch(SavedPlace card, String query) {
    if (query.isEmpty) return true;
    final city = card.city?.toLowerCase() ?? '';
    final district = card.district?.toLowerCase() ?? '';
    return city.contains(query) || district.contains(query);
  }

  /// Finds a card by [id] in [cards], or returns null.
  static SavedPlace? findById(List<SavedPlace> cards, int id) {
    for (final card in cards) {
      if (card.id == id) return card;
    }
    return null;
  }

  /// Returns true when list indices no longer match each card's stored index.
  static bool needsIndexRepair(List<SavedPlace> cards) =>
      cards.asMap().entries.any((e) => e.value.index != e.key);

  /// Returns a copy of [cards] with each index matching list position.
  static List<SavedPlace> applyRepairedIndices(List<SavedPlace> cards) => [
    for (var i = 0; i < cards.length; i++) cards[i].copyWith(index: i),
  ];
}

