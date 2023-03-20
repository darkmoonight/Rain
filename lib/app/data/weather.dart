import 'package:isar/isar.dart';

part 'weather.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool onboard = false;
  bool? theme;
  bool location = false;
}

@collection
class HourlyCache {
  Id id = Isar.autoIncrement;
  List<String>? time;
  List<double>? temperature2M;
  List<int>? relativehumidity2M;
  List<double>? apparentTemperature;
  List<double>? precipitation;
  List<double>? rain;
  List<int>? weathercode;
  List<double>? surfacePressure;
  List<double>? visibility;
  List<double>? evapotranspiration;
  List<double>? windspeed10M;
  List<int>? winddirection10M;
  DateTime? timestamp;

  HourlyCache({
    this.time,
    this.temperature2M,
    this.relativehumidity2M,
    this.apparentTemperature,
    this.precipitation,
    this.rain,
    this.weathercode,
    this.surfacePressure,
    this.visibility,
    this.evapotranspiration,
    this.windspeed10M,
    this.winddirection10M,
    this.timestamp,
  });
}

@collection
class DailyCache {
  Id id = Isar.autoIncrement;
  List<DateTime>? time;
  List<int>? weathercode;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  DateTime? timestamp;

  DailyCache({
    this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.timestamp,
  });
}

@collection
class LocationCache {
  Id id = Isar.autoIncrement;
  double? lat;
  double? lon;
  String? city;
  String? administrativeArea;

  LocationCache({
    this.lat,
    this.lon,
    this.city,
    this.administrativeArea,
  });
}

@collection
class WeatherCard {
  Id id = Isar.autoIncrement;
  List<String>? time;
  List<double>? temperature2M;
  List<int>? weathercode;
  double? lat;
  double? lon;
  String? city;
  String? administrativeArea;

  WeatherCard({
    this.time,
    this.temperature2M,
    this.weathercode,
    this.lat,
    this.lon,
    this.city,
    this.administrativeArea,
  });
}
