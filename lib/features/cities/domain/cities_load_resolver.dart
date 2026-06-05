import 'package:rain/data/models/db.dart';

class CitiesLoadResult {
  const CitiesLoadResult({required this.cards, required this.loadError});

  final List<WeatherCard> cards;
  final bool loadError;
}

class CitiesLoadResolver {
  const CitiesLoadResolver._();

  /// Keeps [previous] cards when the database unexpectedly returns empty
  /// (e.g. transient read failure or corruption) instead of wiping the UI.
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
