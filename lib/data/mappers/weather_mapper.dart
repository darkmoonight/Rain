import 'package:rain/core/weather/location_timezone_helper.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/models/weather_api.dart';

/// Maps Open-Meteo API responses to local Isar cache models.
class WeatherMapper {
  /// Defensive copy so Isar models do not share list identity with freezed API objects.
  static List<T>? _copyList<T>(List<T>? list) => list?.toList(growable: false);

  /// Converts API forecast data into the main weather cache shape.
  static MainWeatherCache toMainWeatherCache(
    WeatherDataApi weatherData, {
    int clockSkewSeconds = 0,
    double? lat,
    double? lon,
  }) {
    final hourly = weatherData.hourly;
    final daily = weatherData.daily;
    return MainWeatherCache(
      time: _copyList(hourly.time),
      temperature2M: _copyList(hourly.temperature2M),
      relativehumidity2M: _copyList(hourly.relativeHumidity2M),
      apparentTemperature: _copyList(hourly.apparentTemperature),
      precipitation: _copyList(hourly.precipitation),
      rain: _copyList(hourly.rain),
      weathercode: _copyList(hourly.weatherCode),
      surfacePressure: _copyList(hourly.surfacePressure),
      visibility: _copyList(hourly.visibility),
      evapotranspiration: _copyList(hourly.evapotranspiration),
      windspeed10M: _copyList(hourly.windSpeed10M),
      winddirection10M: _copyList(hourly.windDirection10M),
      windgusts10M: _copyList(hourly.windGusts10M),
      cloudcover: _copyList(hourly.cloudCover),
      uvIndex: _copyList(hourly.uvIndex),
      dewpoint2M: _copyList(hourly.dewpoint2M),
      precipitationProbability: _copyList(hourly.precipitationProbability),
      shortwaveRadiation: _copyList(hourly.shortwaveRadiation),
      timeDaily: _copyList(daily.time),
      weathercodeDaily: _copyList(daily.weatherCode),
      temperature2MMax: _copyList(daily.temperature2MMax),
      temperature2MMin: _copyList(daily.temperature2MMin),
      apparentTemperatureMax: _copyList(daily.apparentTemperatureMax),
      apparentTemperatureMin: _copyList(daily.apparentTemperatureMin),
      sunrise: _copyList(daily.sunrise),
      sunset: _copyList(daily.sunset),
      precipitationSum: _copyList(daily.precipitationSum),
      precipitationProbabilityMax: _copyList(daily.precipitationProbabilityMax),
      windspeed10MMax: _copyList(daily.windSpeed10MMax),
      windgusts10MMax: _copyList(daily.windGusts10MMax),
      uvIndexMax: _copyList(daily.uvIndexMax),
      rainSum: _copyList(daily.rainSum),
      winddirection10MDominant: _copyList(daily.windDirection10MDominant),
      timezone: LocationTimezoneHelper.resolve(
        cached: weatherData.timezone,
        lat: lat,
        lon: lon,
      ),
      utcOffsetSeconds: weatherData.utcOffsetSeconds,
      clockSkewSeconds: clockSkewSeconds,
      timestamp: DateTime.now(),
    );
  }

  /// Converts API forecast data into a city weather card with location fields.
  static WeatherCard toWeatherCard(
    WeatherDataApi weatherData,
    double lat,
    double lon,
    String city,
    String district, {
    int clockSkewSeconds = 0,
  }) {
    final hourly = weatherData.hourly;
    final daily = weatherData.daily;
    return WeatherCard(
      time: _copyList(hourly.time),
      temperature2M: _copyList(hourly.temperature2M),
      relativehumidity2M: _copyList(hourly.relativeHumidity2M),
      apparentTemperature: _copyList(hourly.apparentTemperature),
      precipitation: _copyList(hourly.precipitation),
      rain: _copyList(hourly.rain),
      weathercode: _copyList(hourly.weatherCode),
      surfacePressure: _copyList(hourly.surfacePressure),
      visibility: _copyList(hourly.visibility),
      evapotranspiration: _copyList(hourly.evapotranspiration),
      windspeed10M: _copyList(hourly.windSpeed10M),
      winddirection10M: _copyList(hourly.windDirection10M),
      windgusts10M: _copyList(hourly.windGusts10M),
      cloudcover: _copyList(hourly.cloudCover),
      uvIndex: _copyList(hourly.uvIndex),
      dewpoint2M: _copyList(hourly.dewpoint2M),
      precipitationProbability: _copyList(hourly.precipitationProbability),
      shortwaveRadiation: _copyList(hourly.shortwaveRadiation),
      timeDaily: _copyList(daily.time),
      weathercodeDaily: _copyList(daily.weatherCode),
      temperature2MMax: _copyList(daily.temperature2MMax),
      temperature2MMin: _copyList(daily.temperature2MMin),
      apparentTemperatureMax: _copyList(daily.apparentTemperatureMax),
      apparentTemperatureMin: _copyList(daily.apparentTemperatureMin),
      sunrise: _copyList(daily.sunrise),
      sunset: _copyList(daily.sunset),
      precipitationSum: _copyList(daily.precipitationSum),
      precipitationProbabilityMax: _copyList(daily.precipitationProbabilityMax),
      windspeed10MMax: _copyList(daily.windSpeed10MMax),
      windgusts10MMax: _copyList(daily.windGusts10MMax),
      uvIndexMax: _copyList(daily.uvIndexMax),
      rainSum: _copyList(daily.rainSum),
      winddirection10MDominant: _copyList(daily.windDirection10MDominant),
      lat: lat,
      lon: lon,
      city: city,
      district: district,
      timezone: LocationTimezoneHelper.resolve(
        cached: weatherData.timezone,
        lat: lat,
        lon: lon,
      ),
      utcOffsetSeconds: weatherData.utcOffsetSeconds,
      clockSkewSeconds: clockSkewSeconds,
      timestamp: DateTime.now(),
    );
  }

  /// Copies forecast fields from [updated] onto [oldCard] and refreshes timestamp.
  static void copyWeatherCardFields(WeatherCard oldCard, WeatherCard updated) {
    oldCard
      ..time = _copyList(updated.time)
      ..weathercode = _copyList(updated.weathercode)
      ..temperature2M = _copyList(updated.temperature2M)
      ..apparentTemperature = _copyList(updated.apparentTemperature)
      ..relativehumidity2M = _copyList(updated.relativehumidity2M)
      ..precipitation = _copyList(updated.precipitation)
      ..rain = _copyList(updated.rain)
      ..surfacePressure = _copyList(updated.surfacePressure)
      ..visibility = _copyList(updated.visibility)
      ..evapotranspiration = _copyList(updated.evapotranspiration)
      ..windspeed10M = _copyList(updated.windspeed10M)
      ..winddirection10M = _copyList(updated.winddirection10M)
      ..windgusts10M = _copyList(updated.windgusts10M)
      ..cloudcover = _copyList(updated.cloudcover)
      ..uvIndex = _copyList(updated.uvIndex)
      ..dewpoint2M = _copyList(updated.dewpoint2M)
      ..precipitationProbability = _copyList(updated.precipitationProbability)
      ..shortwaveRadiation = _copyList(updated.shortwaveRadiation)
      ..europeanAqi = _copyList(updated.europeanAqi)
      ..usAqi = _copyList(updated.usAqi)
      ..pm25 = _copyList(updated.pm25)
      ..pm10 = _copyList(updated.pm10)
      ..ozone = _copyList(updated.ozone)
      ..co = _copyList(updated.co)
      ..no2 = _copyList(updated.no2)
      ..so2 = _copyList(updated.so2)
      ..timeDaily = _copyList(updated.timeDaily)
      ..weathercodeDaily = _copyList(updated.weathercodeDaily)
      ..temperature2MMax = _copyList(updated.temperature2MMax)
      ..temperature2MMin = _copyList(updated.temperature2MMin)
      ..apparentTemperatureMax = _copyList(updated.apparentTemperatureMax)
      ..apparentTemperatureMin = _copyList(updated.apparentTemperatureMin)
      ..sunrise = _copyList(updated.sunrise)
      ..sunset = _copyList(updated.sunset)
      ..precipitationSum = _copyList(updated.precipitationSum)
      ..precipitationProbabilityMax = _copyList(
        updated.precipitationProbabilityMax,
      )
      ..windspeed10MMax = _copyList(updated.windspeed10MMax)
      ..windgusts10MMax = _copyList(updated.windgusts10MMax)
      ..uvIndexMax = _copyList(updated.uvIndexMax)
      ..rainSum = _copyList(updated.rainSum)
      ..winddirection10MDominant = _copyList(updated.winddirection10MDominant)
      ..timezone = updated.timezone
      ..utcOffsetSeconds = updated.utcOffsetSeconds
      ..clockSkewSeconds = updated.clockSkewSeconds
      ..timestamp = DateTime.now();
  }
}
