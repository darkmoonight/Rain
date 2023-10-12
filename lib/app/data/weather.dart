import 'package:isar/isar.dart';
part 'weather.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool onboard = false;
  String? theme = 'system';
  bool location = false;
  bool notifications = false;
  bool materialColor = false;
  bool amoledTheme = false;
  String? widgetBackgroundColor;
  String? widgetTextColor;
  String measurements = 'metric';
  String degrees = 'celsius';
  String timeformat = '24';
  String? language;
  int? timeRange;
  String? timeStart;
  String? timeEnd;
}

@collection
class MainWeatherCache {
  Id id = Isar.autoIncrement;
  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2M;
  List<double?>? apparentTemperature;
  List<int?>? relativehumidity2M;
  List<double?>? precipitation;
  List<double?>? rain;
  List<double?>? surfacePressure;
  List<double?>? visibility;
  List<double?>? evapotranspiration;
  List<double?>? windspeed10M;
  List<int?>? winddirection10M;
  List<double?>? windgusts10M;
  List<int?>? cloudcover;
  List<double?>? uvIndex;
  List<DateTime>? timeDaily;
  List<int?>? weathercodeDaily;
  List<double?>? temperature2MMax;
  List<double?>? temperature2MMin;
  List<double?>? apparentTemperatureMax;
  List<double?>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double?>? precipitationSum;
  List<int?>? precipitationProbabilityMax;
  List<double?>? windspeed10MMax;
  List<double?>? windgusts10MMax;
  List<double?>? uvIndexMax;
  List<double?>? rainSum;
  List<int?>? winddirection10MDominant;
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
    this.uvIndexMax,
    this.rainSum,
    this.winddirection10MDominant,
    this.timezone,
    this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'time': time,
        'weathercode': weathercode,
        'temperature2M': temperature2M,
        'apparentTemperature': apparentTemperature,
        'relativehumidity2M': relativehumidity2M,
        'precipitation': precipitation,
        'rain': rain,
        'surfacePressure': surfacePressure,
        'visibility': visibility,
        'evapotranspiration': evapotranspiration,
        'windspeed10M': windspeed10M,
        'winddirection10M': winddirection10M,
        'windgusts10M': windgusts10M,
        'cloudcover': cloudcover,
        'uvIndex': uvIndex,
        'timeDaily': timeDaily,
        'weathercodeDaily': weathercodeDaily,
        'temperature2MMax': temperature2MMax,
        'temperature2MMin': temperature2MMin,
        'apparentTemperatureMax': apparentTemperatureMax,
        'apparentTemperatureMin': apparentTemperatureMin,
        'sunrise': sunrise,
        'sunset': sunset,
        'precipitationSum': precipitationSum,
        'precipitationProbabilityMax': precipitationProbabilityMax,
        'windspeed10MMax': windspeed10MMax,
        'windgusts10MMax': windgusts10MMax,
        'uvIndexMax': uvIndexMax,
        'rainSum': rainSum,
        'winddirection10MDominant': winddirection10MDominant,
        'timezone': timezone,
        'timestamp': timestamp,
      };
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
  List<int>? weathercode;
  List<double>? temperature2M;
  List<double?>? apparentTemperature;
  List<int?>? relativehumidity2M;
  List<double?>? precipitation;
  List<double?>? rain;
  List<double?>? surfacePressure;
  List<double?>? visibility;
  List<double?>? evapotranspiration;
  List<double?>? windspeed10M;
  List<int?>? winddirection10M;
  List<double?>? windgusts10M;
  List<int?>? cloudcover;
  List<double?>? uvIndex;
  List<DateTime>? timeDaily;
  List<int?>? weathercodeDaily;
  List<double?>? temperature2MMax;
  List<double?>? temperature2MMin;
  List<double?>? apparentTemperatureMax;
  List<double?>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double?>? precipitationSum;
  List<int?>? precipitationProbabilityMax;
  List<double?>? windspeed10MMax;
  List<double?>? windgusts10MMax;
  List<double?>? uvIndexMax;
  List<double?>? rainSum;
  List<int?>? winddirection10MDominant;
  double? lat;
  double? lon;
  String? city;
  String? district;
  String? timezone;
  DateTime? timestamp;
  int? index;

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
    this.uvIndexMax,
    this.rainSum,
    this.winddirection10MDominant,
    this.lat,
    this.lon,
    this.city,
    this.district,
    this.timezone,
    this.timestamp,
    this.index,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'time': time,
        'weathercode': weathercode,
        'temperature2M': temperature2M,
        'apparentTemperature': apparentTemperature,
        'relativehumidity2M': relativehumidity2M,
        'precipitation': precipitation,
        'rain': rain,
        'surfacePressure': surfacePressure,
        'visibility': visibility,
        'evapotranspiration': evapotranspiration,
        'windspeed10M': windspeed10M,
        'winddirection10M': winddirection10M,
        'windgusts10M': windgusts10M,
        'cloudcover': cloudcover,
        'uvIndex': uvIndex,
        'timeDaily': timeDaily,
        'weathercodeDaily': weathercodeDaily,
        'temperature2MMax': temperature2MMax,
        'temperature2MMin': temperature2MMin,
        'apparentTemperatureMax': apparentTemperatureMax,
        'apparentTemperatureMin': apparentTemperatureMin,
        'sunrise': sunrise,
        'sunset': sunset,
        'precipitationSum': precipitationSum,
        'precipitationProbabilityMax': precipitationProbabilityMax,
        'windspeed10MMax': windspeed10MMax,
        'windgusts10MMax': windgusts10MMax,
        'uvIndexMax': uvIndexMax,
        'rainSum': rainSum,
        'winddirection10MDominant': winddirection10MDominant,
        'timezone': timezone,
        'timestamp': timestamp,
        'lat': lat,
        'lon': lon,
        'city': city,
        'district': district,
        'index': index,
      };
}
