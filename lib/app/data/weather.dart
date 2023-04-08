import 'package:isar/isar.dart';

part 'weather.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool onboard = false;
  bool? theme;
  bool location = false;
  bool notifications = false;
  String measurements = 'metric';
  String degrees = 'celsius';
  String timeformat = '24';
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
  String? timezone;
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
    this.timezone,
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
  List<String>? sunrise;
  List<String>? sunset;
  String? timezone;
  DateTime? timestamp;

  DailyCache({
    this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.sunrise,
    this.sunset,
    this.timezone,
    this.timestamp,
  });
}

@collection
class LocationCache {
  Id id = Isar.autoIncrement;
  double? lat;
  double? lon;
  String? city;
  String? district;

  LocationCache({
    this.lat,
    this.lon,
    this.city,
    this.district,
  });
}

@collection
class WeatherCard {
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
  List<DateTime>? timeDaily;
  List<int>? weathercodeDaily;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  List<String>? sunrise;
  List<String>? sunset;
  double? lat;
  double? lon;
  String? city;
  String? district;
  String? timezone;
  DateTime? timestamp;

  WeatherCard({
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
    this.timeDaily,
    this.weathercodeDaily,
    this.temperature2MMax,
    this.temperature2MMin,
    this.sunrise,
    this.sunset,
    this.lat,
    this.lon,
    this.city,
    this.district,
    this.timezone,
    this.timestamp,
  });
}
