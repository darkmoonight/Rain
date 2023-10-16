import 'package:freezed_annotation/freezed_annotation.dart';

//ignore_for_file: invalid_annotation_target

part 'weather.freezed.dart';
part 'weather.g.dart';

class WeatherDataApi {
  Hourly hourly;
  Daily daily;
  String timezone;

  WeatherDataApi({
    required this.hourly,
    required this.daily,
    required this.timezone,
  });

  factory WeatherDataApi.fromJson(Map<String, dynamic> json) => WeatherDataApi(
        hourly: Hourly.fromJson(json['hourly']),
        daily: Daily.fromJson(json['daily']),
        timezone: json['timezone'],
      );

  @override
  toString() {
    return 'WeatherDataApi{hourly: $hourly, daily: $daily, timezone: $timezone}';
  }
}

@freezed
class Hourly with _$Hourly {
  const factory Hourly({
    List<String>? time,
    @JsonKey(name: 'weathercode') List<int>? weatherCode,
    List<double>? temperature2M,
    List<double?>? apparentTemperature,
    List<double?>? precipitation,
    List<double?>? rain,
    @JsonKey(name: 'relativehumidity2M') List<int?>? relativeHumidity2M,
    List<double?>? surfacePressure,
    List<double?>? visibility,
    List<double?>? evapotranspiration,
    @JsonKey(name: 'windspeed10M') List<double?>? windSpeed10M,
    @JsonKey(name: 'winddirection10M') List<int?>? windDirection10M,
    @JsonKey(name: 'windgusts10M') List<double?>? windGusts10M,
    @JsonKey(name: 'cloudcover') List<int?>? cloudCover,
    List<double?>? uvIndex,
    @JsonKey(name: 'dewpoint2M') List<double?>? dewpoint2M,
    List<int?>? precipitationProbability,
    List<double?>? shortwaveRadiation,
  }) = _Hourly;

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}

class Daily {
  List<DateTime>? time;
  List<int?>? weathercode;
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

  Daily({
    this.time,
    this.weathercode,
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
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json['time'].map((x) => DateTime.parse(x))),
        weathercode: List<int?>.from(json['weathercode'].map((x) => x)),
        temperature2MMax: List<double?>.from(json['temperature_2m_max'].map((x) => x)),
        temperature2MMin: List<double?>.from(json['temperature_2m_min'].map((x) => x)),
        apparentTemperatureMax: List<double?>.from(json['apparent_temperature_max'].map((x) => x)),
        apparentTemperatureMin: List<double?>.from(json['apparent_temperature_min'].map((x) => x)),
        sunrise: List<String>.from(json['sunrise'].map((x) => x)),
        sunset: List<String>.from(json['sunset'].map((x) => x)),
        precipitationSum: List<double?>.from(json['precipitation_sum'].map((x) => x)),
        precipitationProbabilityMax: List<int?>.from(json['precipitation_probability_max'].map((x) => x)),
        windspeed10MMax: List<double?>.from(json['windspeed_10m_max'].map((x) => x)),
        windgusts10MMax: List<double?>.from(json['windgusts_10m_max'].map((x) => x)),
        uvIndexMax: List<double?>.from(json['uv_index_max'].map((x) => x)),
        rainSum: List<double?>.from(json['rain_sum'].map((x) => x)),
        winddirection10MDominant: List<int?>.from(json['winddirection_10m_dominant'].map((x) => x)),
      );
}
