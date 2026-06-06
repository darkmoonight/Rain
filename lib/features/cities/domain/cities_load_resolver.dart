import 'package:rain/data/models/db.dart';

/// Result of resolving saved cities from the database against prior state.
class CitiesLoadResult {
  const CitiesLoadResult({required this.cards, required this.loadError});

  final List<WeatherCard> cards;
  final bool loadError;
}

/// Decides which card list to show when the database read succeeds or fails.
class CitiesLoadResolver {
  const CitiesLoadResolver._();

  /// Prefers fresh DB data; falls back to [previous] cards with an error flag.
  static CitiesLoadResult resolve({
    required List<WeatherCard> fromDb,
    required List<WeatherCard> previous,
  }) {
    if (fromDb.isNotEmpty) {
      return CitiesLoadResult(cards: fromDb, loadError: false);
    }
    if (previous.isNotEmpty) {
      return CitiesLoadResult(cards: previous, loadError: true);
    }
    return const CitiesLoadResult(cards: [], loadError: false);
  }
}
