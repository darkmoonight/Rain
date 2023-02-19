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
  Id id = Isar.autoIncrement;
  List<String> time;
  List<double> temperature2M;
  List<int> relativehumidity2M;
  List<double> apparentTemperature;
  List<double> precipitation;
  List<double> rain;
  List<int> weathercode;
  List<double> surfacePressure;
  List<double> visibility;
  List<double> evapotranspiration;
  List<double> windspeed10M;
  List<int> winddirection10M;

  WeatherDay({
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
  Id id = Isar.autoIncrement;
  List<DateTime> time;
  List<int> weathercode;
  List<double> temperature2MMax;
  List<double> temperature2MMin;

  Weather7Day({
    required this.time,
    required this.weathercode,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });
}

@collection
class Location {
  Id id = Isar.autoIncrement;
  String lat;
  String lon;
  String city;
  String country;

  Location({
    required this.lat,
    required this.lon,
    required this.city,
    required this.country,
  });
}
