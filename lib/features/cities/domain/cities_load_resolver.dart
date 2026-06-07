import 'package:rain/data/models/db.dart';

/// Result of resolving saved cities from the database.
class CitiesLoadResult {
  const CitiesLoadResult({required this.cards});

  final List<WeatherCard> cards;
}

/// Decides which card list to show after a successful database read, including empty results.
class CitiesLoadResolver {
  const CitiesLoadResolver._();

  /// Returns cards from the database; an empty DB means no saved cities (not an error).
  static CitiesLoadResult resolve({required List<WeatherCard> fromDb}) =>
      CitiesLoadResult(cards: fromDb);
}
