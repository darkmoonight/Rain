import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_api.freezed.dart';
part 'air_quality_api.g.dart';

/// Root air quality payload from the Open-Meteo Air Quality API.
@freezed
abstract class AirQualityDataApi with _$AirQualityDataApi {
  const factory AirQualityDataApi({
    required AirQualityHourly hourly,
  }) = _AirQualityDataApi;

  factory AirQualityDataApi.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDataApiFromJson(json);
}

/// Hourly air quality variables returned by Open-Meteo.
@freezed
abstract class AirQualityHourly with _$AirQualityHourly {
  const factory AirQualityHourly({
    List<String>? time,
    @JsonKey(name: 'european_aqi') List<double?>? europeanAqi,
    @JsonKey(name: 'us_aqi') List<double?>? usAqi,
    @JsonKey(name: 'pm2_5') List<double?>? pm25,
    @JsonKey(name: 'pm10') List<double?>? pm10,
    List<double?>? ozone,
    @JsonKey(name: 'carbon_monoxide') List<double?>? co,
    @JsonKey(name: 'nitrogen_dioxide') List<double?>? no2,
    @JsonKey(name: 'sulphur_dioxide') List<double?>? so2,
  }) = _AirQualityHourly;

  factory AirQualityHourly.fromJson(Map<String, dynamic> json) =>
      _$AirQualityHourlyFromJson(json);
}
