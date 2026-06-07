import 'package:rain/data/models/db.dart';
import 'package:rain/data/repositories/cities_repository.dart';

/// Test double that can simulate [getAllSorted] failures.
class ThrowingCitiesRepository extends CitiesRepository {
  ThrowingCitiesRepository(super.isar, super.remote);

  bool throwOnGetAllSorted = false;

  @override
  Future<List<WeatherCard>> getAllSorted() async {
    if (throwOnGetAllSorted) {
      throw StateError('simulated db read failure');
    }
    return super.getAllSorted();
  }
}
