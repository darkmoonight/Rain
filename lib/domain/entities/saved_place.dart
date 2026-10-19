import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rain/domain/entities/geo_place.dart';
import 'package:rain/domain/entities/weather_forecast.dart';

part 'saved_place.freezed.dart';

/// Domain saved-city card — no persistence annotations.
///
/// [id] is the Isar primary key when loaded from storage; null for new cards.
@freezed
abstract class SavedPlace with _$SavedPlace {
  const SavedPlace._();

  const factory SavedPlace({
    List<String>? time,
    List<int>? weathercode,
    List<double>? temperature2M,
    List<double?>? apparentTemperature,
    List<int?>? relativehumidity2M,
    List<double?>? precipitation,
    List<double?>? rain,
    List<double?>? surfacePressure,
    List<double?>? visibility,
    List<double?>? evapotranspiration,
    List<double?>? windspeed10M,
    List<int?>? winddirection10M,
    List<double?>? windgusts10M,
    List<int?>? cloudcover,
    List<double?>? uvIndex,
    List<double?>? dewpoint2M,
    List<int?>? precipitationProbability,
    List<double?>? shortwaveRadiation,
    List<double?>? europeanAqi,
    List<double?>? usAqi,
    List<double?>? pm25,
    List<double?>? pm10,
    List<double?>? ozone,
    List<double?>? co,
    List<double?>? no2,
    List<double?>? so2,
    List<DateTime>? timeDaily,
    List<int?>? weathercodeDaily,
    List<double?>? temperature2MMax,
    List<double?>? temperature2MMin,
    List<double?>? apparentTemperatureMax,
    List<double?>? apparentTemperatureMin,
    List<String>? sunrise,
    List<String>? sunset,
    List<double?>? precipitationSum,
    List<int?>? precipitationProbabilityMax,
    List<double?>? windspeed10MMax,
    List<double?>? windgusts10MMax,
    List<double?>? uvIndexMax,
    List<double?>? rainSum,
    List<int?>? winddirection10MDominant,
    String? timezone,
    int? utcOffsetSeconds,
    int? clockSkewSeconds,
    DateTime? timestamp,
    double? lat,
    double? lon,
    String? city,
    String? district,
    int? index,
    int? id,
  }) = _SavedPlace;

  /// Builds a saved place from a primary [WeatherForecast] and location labels.
  factory SavedPlace.fromForecast(
    WeatherForecast forecast, {
    double? lat,
    double? lon,
    String? city,
    String? district,
  }) => SavedPlace(
    time: forecast.time,
    weathercode: forecast.weathercode,
    temperature2M: forecast.temperature2M,
    apparentTemperature: forecast.apparentTemperature,
    relativehumidity2M: forecast.relativehumidity2M,
    precipitation: forecast.precipitation,
    rain: forecast.rain,
    surfacePressure: forecast.surfacePressure,
    visibility: forecast.visibility,
    evapotranspiration: forecast.evapotranspiration,
    windspeed10M: forecast.windspeed10M,
    winddirection10M: forecast.winddirection10M,
    windgusts10M: forecast.windgusts10M,
    cloudcover: forecast.cloudcover,
    uvIndex: forecast.uvIndex,
    dewpoint2M: forecast.dewpoint2M,
    precipitationProbability: forecast.precipitationProbability,
    shortwaveRadiation: forecast.shortwaveRadiation,
    europeanAqi: forecast.europeanAqi,
    usAqi: forecast.usAqi,
    pm25: forecast.pm25,
    pm10: forecast.pm10,
    ozone: forecast.ozone,
    co: forecast.co,
    no2: forecast.no2,
    so2: forecast.so2,
    timeDaily: forecast.timeDaily,
    weathercodeDaily: forecast.weathercodeDaily,
    temperature2MMax: forecast.temperature2MMax,
    temperature2MMin: forecast.temperature2MMin,
    apparentTemperatureMax: forecast.apparentTemperatureMax,
    apparentTemperatureMin: forecast.apparentTemperatureMin,
    sunrise: forecast.sunrise,
    sunset: forecast.sunset,
    precipitationSum: forecast.precipitationSum,
    precipitationProbabilityMax: forecast.precipitationProbabilityMax,
    windspeed10MMax: forecast.windspeed10MMax,
    windgusts10MMax: forecast.windgusts10MMax,
    uvIndexMax: forecast.uvIndexMax,
    rainSum: forecast.rainSum,
    winddirection10MDominant: forecast.winddirection10MDominant,
    timezone: forecast.timezone,
    utcOffsetSeconds: forecast.utcOffsetSeconds,
    clockSkewSeconds: forecast.clockSkewSeconds,
    timestamp: forecast.timestamp,
    lat: lat,
    lon: lon,
    city: city,
    district: district,
  );

  /// Builds a saved place from a primary forecast and location.
  factory SavedPlace.fromForecastAndPlace(
    WeatherForecast forecast,
    GeoPlace location,
  ) => SavedPlace.fromForecast(
    forecast,
    lat: location.lat,
    lon: location.lon,
    city: location.city,
    district: location.district,
  );

  /// City label for tiles, falling back to district.
  String get displayLabel {
    final c = city?.trim();
    if (c != null && c.isNotEmpty) return c;
    return district?.trim() ?? '';
  }

  /// Enough forecast + location fields for city list tiles and detail.
  bool get isTileReady =>
      time != null &&
      time!.isNotEmpty &&
      timeDaily != null &&
      timeDaily!.isNotEmpty &&
      sunrise != null &&
      sunset != null &&
      weathercode != null &&
      weathercode!.isNotEmpty &&
      temperature2M != null &&
      temperature2M!.isNotEmpty &&
      city != null &&
      timezone != null &&
      lat != null &&
      lon != null;
}
