import 'package:rain/domain/entities/saved_place.dart';

/// Port for saved-city card persistence and remote refresh.
abstract class CitiesRepository {
  /// Returns all weather cards sorted by display index.
  Future<List<SavedPlace>> getAllSorted();

  /// Reassigns sequential indices when stored order has gaps or duplicates.
  Future<void> repairIndices();

  /// Returns sorted cards whose cached forecast is older than [expiry].
  Future<List<SavedPlace>> getExpiredSorted(DateTime expiry);

  /// Fetches fresh forecast data for a city.
  Future<SavedPlace> fetchCard(
    double lat,
    double lon,
    String city,
    String district,
  );

  /// Appends a new weather card at the end of the saved list.
  Future<SavedPlace> addCard(SavedPlace place);

  /// Persists changes to an existing weather card.
  Future<SavedPlace> updateCard(SavedPlace place);

  /// Removes a weather card from local storage.
  Future<void> deleteCard(SavedPlace place);

  /// Merges refreshed forecast fields onto [oldPlace] and saves.
  Future<SavedPlace> applyRemoteUpdate(SavedPlace oldPlace, SavedPlace updated);

  /// Moves a card from [oldIndex] to [newIndex] and rewrites display indices.
  Future<void> reorder(int oldIndex, int newIndex);
}
