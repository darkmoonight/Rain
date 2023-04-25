import 'package:isar/isar.dart';

part 'weather.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool onboard = false;
  bool? theme;
  bool location = false;
  bool notifications = false;
  bool materialColor = false;
  String measurements = 'metric';
  String degrees = 'celsius';
  String timeformat = '24';
}

@collection
class MainWeatherCache {
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
  List<double>? windgusts10M;
  List<int>? cloudcover;
  List<double>? uvIndex;
  List<DateTime>? timeDaily;
  List<int>? weathercodeDaily;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  List<double>? apparentTemperatureMax;
  List<double>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double>? precipitationSum;
  List<int>? precipitationProbabilityMax;
  List<double>? windspeed10MMax;
  List<double>? windgusts10MMax;
  String? timezone;
  DateTime? timestamp;

  MainWeatherCache({
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
    this.windgusts10M,
    this.cloudcover,
    this.uvIndex,
    this.timeDaily,
    this.weathercodeDaily,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.precipitationSum,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
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
  List<double>? windgusts10M;
  List<int>? cloudcover;
  List<double>? uvIndex;
  List<DateTime>? timeDaily;
  List<int>? weathercodeDaily;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  List<double>? apparentTemperatureMax;
  List<double>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double>? precipitationSum;
  List<int>? precipitationProbabilityMax;
  List<double>? windspeed10MMax;
  List<double>? windgusts10MMax;
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
    this.windgusts10M,
    this.cloudcover,
    this.uvIndex,
    this.timeDaily,
    this.weathercodeDaily,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.precipitationSum,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
    this.lat,
    this.lon,
    this.city,
    this.district,
    this.timezone,
    this.timestamp,
  });
}
