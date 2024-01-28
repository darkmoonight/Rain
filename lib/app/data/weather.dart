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
  bool roundDegree = false;
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
  List<double?>? dewpoint2M;
  List<int?>? precipitationProbability;
  List<double?>? shortwaveRadiation;
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
    this.dewpoint2M,
    this.precipitationProbability,
    this.shortwaveRadiation,
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
        'dewpoint2M': dewpoint2M,
        'precipitationProbability': precipitationProbability,
        'shortwaveRadiation': shortwaveRadiation,
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
  List<double?>? dewpoint2M;
  List<int?>? precipitationProbability;
  List<double?>? shortwaveRadiation;
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
    this.dewpoint2M,
    this.precipitationProbability,
    this.shortwaveRadiation,
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
        'dewpoint2M': dewpoint2M,
        'precipitationProbability': precipitationProbability,
        'shortwaveRadiation': shortwaveRadiation,
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

  factory WeatherCard.fromJson(Map<String, dynamic> json) {
    return WeatherCard(
      time: List<String>.from(json['time'] ?? []),
      weathercode: List<int>.from(json['weathercode'] ?? []),
      temperature2M: List<double>.from(json['temperature2M'] ?? []),
      apparentTemperature:
          List<double?>.from(json['apparentTemperature'] ?? []),
      relativehumidity2M: List<int?>.from(json['relativehumidity2M'] ?? []),
      precipitation: List<double>.from(json['precipitation'] ?? []),
      rain: List<double?>.from(json['rain'] ?? []),
      surfacePressure: List<double?>.from(json['surfacePressure'] ?? []),
      visibility: List<double?>.from(json['visibility'] ?? []),
      evapotranspiration: List<double?>.from(json['evapotranspiration'] ?? []),
      windspeed10M: List<double?>.from(json['windspeed10M'] ?? []),
      winddirection10M: List<int?>.from(json['winddirection10M'] ?? []),
      windgusts10M: List<double?>.from(json['windgusts10M'] ?? []),
      cloudcover: List<int?>.from(json['cloudcover'] ?? []),
      uvIndex: List<double?>.from(json['uvIndex'] ?? []),
      dewpoint2M: List<double?>.from(json['dewpoint2M'] ?? []),
      precipitationProbability:
          List<int?>.from(json['precipitationProbability'] ?? []),
      shortwaveRadiation: List<double?>.from(json['shortwaveRadiation'] ?? []),
      timeDaily: List<DateTime>.from(json['timeDaily'] ?? []),
      weathercodeDaily: List<int?>.from(json['weathercodeDaily'] ?? []),
      temperature2MMax: List<double?>.from(json['temperature2MMax'] ?? []),
      temperature2MMin: List<double?>.from(json['temperature2MMin'] ?? []),
      apparentTemperatureMax:
          List<double?>.from(json['apparentTemperatureMax'] ?? []),
      apparentTemperatureMin:
          List<double?>.from(json['apparentTemperatureMin'] ?? []),
      windspeed10MMax: List<double?>.from(json['windspeed10MMax'] ?? []),
      windgusts10MMax: List<double?>.from(json['windgusts10MMax'] ?? []),
      uvIndexMax: List<double?>.from(json['uvIndexMax'] ?? []),
      rainSum: List<double?>.from(json['rainSum'] ?? []),
      winddirection10MDominant:
          List<int?>.from(json['winddirection10MDominant'] ?? []),
      precipitationSum: List<double?>.from(json['precipitationSum'] ?? []),
      precipitationProbabilityMax:
          List<int?>.from(json['precipitationProbabilityMax'] ?? []),
      sunrise: List<String>.from(json['sunrise'] ?? []),
      sunset: List<String>.from(json['sunset'] ?? []),
      lat: json['lat'],
      lon: json['lon'],
      city: json['city'],
      district: json['district'],
      timezone: json['timezone'],
      timestamp: json['timestamp'],
      index: json['index'],
    );
  }
}
