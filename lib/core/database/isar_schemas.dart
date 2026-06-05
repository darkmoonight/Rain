import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rain/data/models/db.dart';

const rainIsarSchemas = [
  SettingsSchema,
  MainWeatherCacheSchema,
  LocationCacheSchema,
  WeatherCardSchema,
];

Future<Isar> openRainIsar({String? directory}) async {
  final dir = directory ?? (await getApplicationSupportDirectory()).path;
  return Isar.open(rainIsarSchemas, directory: dir);
}
