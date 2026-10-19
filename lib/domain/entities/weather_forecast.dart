import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast.freezed.dart';

/// Domain forecast for the primary location — no persistence annotations.
@freezed
abstract class WeatherForecast with _$WeatherForecast {
  const WeatherForecast._();

  const factory WeatherForecast({
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
  }) = _WeatherForecast;

  /// Hourly and daily timestamp series are present.
  bool get hasSeriesData =>
      time != null &&
      time!.isNotEmpty &&
      timeDaily != null &&
      timeDaily!.isNotEmpty;

  /// Enough fields to render the main weather detail view.
  bool get hasDisplayableForecast =>
      hasSeriesData &&
      sunrise != null &&
      sunset != null &&
      temperature2M != null &&
      temperature2M!.isNotEmpty &&
      temperature2MMax != null &&
      temperature2MMax!.isNotEmpty &&
      temperature2MMin != null &&
      temperature2MMin!.isNotEmpty &&
      weathercode != null &&
      weathercode!.isNotEmpty;

  /// Daily max/min at [dayIndex], or null when the slot is missing.
  ({double max, double min})? dailyTempRangeAt(int dayIndex) {
    final maxList = temperature2MMax;
    final minList = temperature2MMin;
    if (maxList == null || minList == null) return null;
    if (dayIndex < 0 ||
        dayIndex >= maxList.length ||
        dayIndex >= minList.length) {
      return null;
    }
    final max = maxList[dayIndex];
    final min = minList[dayIndex];
    if (max == null || min == null) return null;
    return (max: max, min: min);
  }
}
