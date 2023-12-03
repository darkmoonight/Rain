import 'package:freezed_annotation/freezed_annotation.dart';

//ignore_for_file: invalid_annotation_target

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherDataApi with _$WeatherDataApi {
  const factory WeatherDataApi({
    required Hourly hourly,
    required Daily daily,
    required String timezone,
  }) = _WeatherDataApi;

  factory WeatherDataApi.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataApiFromJson(json);
}

@freezed
class Hourly with _$Hourly {
  const factory Hourly({
    List<String>? time,
    @JsonKey(name: 'weathercode') List<int>? weatherCode,
    @JsonKey(name: 'temperature_2m') List<double>? temperature2M,
    @JsonKey(name: 'apparent_temperature') List<double?>? apparentTemperature,
    List<double?>? precipitation,
    List<double?>? rain,
    @JsonKey(name: 'relativehumidity_2m') List<int?>? relativeHumidity2M,
    @JsonKey(name: 'surface_pressure') List<double?>? surfacePressure,
    List<double?>? visibility,
    List<double?>? evapotranspiration,
    @JsonKey(name: 'windspeed_10m') List<double?>? windSpeed10M,
    @JsonKey(name: 'winddirection_10m') List<int?>? windDirection10M,
    @JsonKey(name: 'windgusts_10m') List<double?>? windGusts10M,
    @JsonKey(name: 'cloudcover') List<int?>? cloudCover,
    @JsonKey(name: 'uv_index') List<double?>? uvIndex,
    @JsonKey(name: 'dewpoint_2m') List<double?>? dewpoint2M,
    @JsonKey(name: 'precipitation_probability')
    List<int?>? precipitationProbability,
    @JsonKey(name: 'shortwave_radiation') List<double?>? shortwaveRadiation,
  }) = _Hourly;

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}

List<DateTime> _dateTimeFromJson(List<dynamic>? json) =>
    json?.map((x) => DateTime.parse(x)).toList() ?? [];

@freezed
class Daily with _$Daily {
  const factory Daily({
    @JsonKey(fromJson: _dateTimeFromJson) List<DateTime>? time,
    @JsonKey(name: 'weathercode') List<int?>? weatherCode,
    @JsonKey(name: 'temperature_2m_max') List<double?>? temperature2MMax,
    @JsonKey(name: 'temperature_2m_min') List<double?>? temperature2MMin,
    @JsonKey(name: 'apparent_temperature_max')
    List<double?>? apparentTemperatureMax,
    @JsonKey(name: 'apparent_temperature_min')
    List<double?>? apparentTemperatureMin,
    @JsonKey(name: 'precipitation_sum') List<double?>? precipitationSum,
    List<String>? sunrise,
    List<String>? sunset,
    @JsonKey(name: 'precipitation_probability_max')
    List<int?>? precipitationProbabilityMax,
    @JsonKey(name: 'windspeed_10m_max') List<double?>? windSpeed10MMax,
    @JsonKey(name: 'windgusts_10m_max') List<double?>? windGusts10MMax,
    @JsonKey(name: 'uv_index_max') List<double?>? uvIndexMax,
    @JsonKey(name: 'rain_sum') List<double?>? rainSum,
    @JsonKey(name: 'winddirection_10m_dominant')
    List<int?>? windDirection10MDominant,
  }) = _Daily;

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);
}
