import 'package:rain/data/models/db.dart';
import 'package:rain/data/models/weather_api.dart';

/// Maps Open-Meteo API responses to local Isar cache models.
class WeatherMapper {
  /// Converts API forecast data into the main weather cache shape.
  static MainWeatherCache toMainWeatherCache(WeatherDataApi weatherData) =>
      MainWeatherCache(
        time: weatherData.hourly.time,
        temperature2M: weatherData.hourly.temperature2M,
        relativehumidity2M: weatherData.hourly.relativeHumidity2M,
        apparentTemperature: weatherData.hourly.apparentTemperature,
        precipitation: weatherData.hourly.precipitation,
        rain: weatherData.hourly.rain,
        weathercode: weatherData.hourly.weatherCode,
        surfacePressure: weatherData.hourly.surfacePressure,
        visibility: weatherData.hourly.visibility,
        evapotranspiration: weatherData.hourly.evapotranspiration,
        windspeed10M: weatherData.hourly.windSpeed10M,
        winddirection10M: weatherData.hourly.windDirection10M,
        windgusts10M: weatherData.hourly.windGusts10M,
        cloudcover: weatherData.hourly.cloudCover,
        uvIndex: weatherData.hourly.uvIndex,
        dewpoint2M: weatherData.hourly.dewpoint2M,
        precipitationProbability: weatherData.hourly.precipitationProbability,
        shortwaveRadiation: weatherData.hourly.shortwaveRadiation,
        timeDaily: weatherData.daily.time,
        weathercodeDaily: weatherData.daily.weatherCode,
        temperature2MMax: weatherData.daily.temperature2MMax,
        temperature2MMin: weatherData.daily.temperature2MMin,
        apparentTemperatureMax: weatherData.daily.apparentTemperatureMax,
        apparentTemperatureMin: weatherData.daily.apparentTemperatureMin,
        sunrise: weatherData.daily.sunrise,
        sunset: weatherData.daily.sunset,
        precipitationSum: weatherData.daily.precipitationSum,
        precipitationProbabilityMax:
            weatherData.daily.precipitationProbabilityMax,
        windspeed10MMax: weatherData.daily.windSpeed10MMax,
        windgusts10MMax: weatherData.daily.windGusts10MMax,
        uvIndexMax: weatherData.daily.uvIndexMax,
        rainSum: weatherData.daily.rainSum,
        winddirection10MDominant: weatherData.daily.windDirection10MDominant,
        timezone: weatherData.timezone,
        timestamp: DateTime.now(),
      );

  /// Converts API forecast data into a city weather card with location fields.
  static WeatherCard toWeatherCard(
    WeatherDataApi weatherData,
    double lat,
    double lon,
    String city,
    String district,
    String timezone,
  ) => WeatherCard(
    time: weatherData.hourly.time,
    temperature2M: weatherData.hourly.temperature2M,
    relativehumidity2M: weatherData.hourly.relativeHumidity2M,
    apparentTemperature: weatherData.hourly.apparentTemperature,
    precipitation: weatherData.hourly.precipitation,
    rain: weatherData.hourly.rain,
    weathercode: weatherData.hourly.weatherCode,
    surfacePressure: weatherData.hourly.surfacePressure,
    visibility: weatherData.hourly.visibility,
    evapotranspiration: weatherData.hourly.evapotranspiration,
    windspeed10M: weatherData.hourly.windSpeed10M,
    winddirection10M: weatherData.hourly.windDirection10M,
    windgusts10M: weatherData.hourly.windGusts10M,
    cloudcover: weatherData.hourly.cloudCover,
    uvIndex: weatherData.hourly.uvIndex,
    dewpoint2M: weatherData.hourly.dewpoint2M,
    precipitationProbability: weatherData.hourly.precipitationProbability,
    shortwaveRadiation: weatherData.hourly.shortwaveRadiation,
    timeDaily: weatherData.daily.time,
    weathercodeDaily: weatherData.daily.weatherCode,
    temperature2MMax: weatherData.daily.temperature2MMax,
    temperature2MMin: weatherData.daily.temperature2MMin,
    apparentTemperatureMax: weatherData.daily.apparentTemperatureMax,
    apparentTemperatureMin: weatherData.daily.apparentTemperatureMin,
    sunrise: weatherData.daily.sunrise,
    sunset: weatherData.daily.sunset,
    precipitationSum: weatherData.daily.precipitationSum,
    precipitationProbabilityMax: weatherData.daily.precipitationProbabilityMax,
    windspeed10MMax: weatherData.daily.windSpeed10MMax,
    windgusts10MMax: weatherData.daily.windGusts10MMax,
    uvIndexMax: weatherData.daily.uvIndexMax,
    rainSum: weatherData.daily.rainSum,
    winddirection10MDominant: weatherData.daily.windDirection10MDominant,
    lat: lat,
    lon: lon,
    city: city,
    district: district,
    timezone: timezone,
    timestamp: DateTime.now(),
  );

  /// Copies forecast fields from [updated] onto [oldCard] and refreshes timestamp.
  static void copyWeatherCardFields(WeatherCard oldCard, WeatherCard updated) {
    oldCard
      ..time = updated.time
      ..weathercode = updated.weathercode
      ..temperature2M = updated.temperature2M
      ..apparentTemperature = updated.apparentTemperature
      ..relativehumidity2M = updated.relativehumidity2M
      ..precipitation = updated.precipitation
      ..rain = updated.rain
      ..surfacePressure = updated.surfacePressure
      ..visibility = updated.visibility
      ..evapotranspiration = updated.evapotranspiration
      ..windspeed10M = updated.windspeed10M
      ..winddirection10M = updated.winddirection10M
      ..windgusts10M = updated.windgusts10M
      ..cloudcover = updated.cloudcover
      ..uvIndex = updated.uvIndex
      ..dewpoint2M = updated.dewpoint2M
      ..precipitationProbability = updated.precipitationProbability
      ..shortwaveRadiation = updated.shortwaveRadiation
      ..timeDaily = updated.timeDaily
      ..weathercodeDaily = updated.weathercodeDaily
      ..temperature2MMax = updated.temperature2MMax
      ..temperature2MMin = updated.temperature2MMin
      ..apparentTemperatureMax = updated.apparentTemperatureMax
      ..apparentTemperatureMin = updated.apparentTemperatureMin
      ..sunrise = updated.sunrise
      ..sunset = updated.sunset
      ..precipitationSum = updated.precipitationSum
      ..precipitationProbabilityMax = updated.precipitationProbabilityMax
      ..windspeed10MMax = updated.windspeed10MMax
      ..windgusts10MMax = updated.windgusts10MMax
      ..uvIndexMax = updated.uvIndexMax
      ..rainSum = updated.rainSum
      ..winddirection10MDominant = updated.winddirection10MDominant
      ..timestamp = DateTime.now();
  }
}
