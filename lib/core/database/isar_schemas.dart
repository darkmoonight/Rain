import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/data/models/db.dart';

/// Isar collection schemas used by the Rain local database.
const rainIsarSchemas = [
  SettingsSchema,
  MainWeatherCacheSchema,
  LocationCacheSchema,
  WeatherCardSchema,
];

/// Opens the Rain Isar database, optionally in a custom directory.
Future<Isar> openRainIsar({String? directory}) async {
  final dir = directory ?? (await getApplicationSupportDirectory()).path;
  return Isar.open(rainIsarSchemas, directory: dir);
}
