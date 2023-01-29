import 'package:isar/isar.dart';

part 'weather.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool onboard = false;
  bool? theme;
}

@collection
class WeatherDay {
  Id id;
  String time;
  double temperature2M;
  int relativehumidity2M;
  double apparentTemperature;
  double precipitation;
  int rain;
  int weathercode;
  double surfacePressure;
  int visibility;
  double evapotranspiration;
  double windspeed10M;
  int winddirection10M;

  WeatherDay({
    this.id = Isar.autoIncrement,
    required this.time,
    required this.temperature2M,
    required this.relativehumidity2M,
    required this.apparentTemperature,
    required this.precipitation,
    required this.rain,
    required this.weathercode,
    required this.surfacePressure,
    required this.visibility,
    required this.evapotranspiration,
    required this.windspeed10M,
    required this.winddirection10M,
  });
}

@collection
class Weather7Day {
  Id id;
  DateTime time;
  int weathercode;
  double temperature2MMax;
  double temperature2MMin;

  Weather7Day({
    this.id = Isar.autoIncrement,
    required this.time,
    required this.weathercode,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });
}
