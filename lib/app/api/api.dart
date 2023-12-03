import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/api/weather.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/main.dart';

class WeatherAPI {
  final Dio dio = Dio()
    ..options.baseUrl = 'https://api.open-meteo.com/v1/forecast?';
  final Dio dioLocation = Dio();

  Future<MainWeatherCache> getWeatherData(double? lat, double? lon) async {
    String url =
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index,dewpoint_2m,precipitation_probability,shortwave_radiation&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant&forecast_days=12&timezone=auto';
    String urlWeather;
    settings.measurements == 'imperial' && settings.degrees == 'fahrenheit'
        ? urlWeather =
            '$url&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch'
        : settings.measurements == 'imperial'
            ? urlWeather = '$url&windspeed_unit=mph&precipitation_unit=inch'
            : settings.degrees == 'fahrenheit'
                ? urlWeather = '$url&temperature_unit=fahrenheit'
                : urlWeather = url;
    try {
      Response response = await dio.get(urlWeather);
      WeatherDataApi weatherData = WeatherDataApi.fromJson(response.data);
      return MainWeatherCache(
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
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<WeatherCard> getWeatherCard(double? lat, double? lon, String city,
      String district, String timezone) async {
    String url =
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index,dewpoint_2m,precipitation_probability,shortwave_radiation&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant&forecast_days=12&timezone=auto';
    String urlWeather;
    settings.measurements == 'imperial' && settings.degrees == 'fahrenheit'
        ? urlWeather =
            '$url&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch'
        : settings.measurements == 'imperial'
            ? urlWeather = '$url&windspeed_unit=mph&precipitation_unit=inch'
            : settings.degrees == 'fahrenheit'
                ? urlWeather = '$url&temperature_unit=fahrenheit'
                : urlWeather = url;
    try {
      Response response = await dio.get(urlWeather);
      WeatherDataApi weatherData = WeatherDataApi.fromJson(response.data);
      return WeatherCard(
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
        lat: lat,
        lon: lon,
        city: city,
        district: district,
        timezone: timezone,
        timestamp: DateTime.now(),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<Iterable<Result>> getCity(String query, Locale? locale) async {
    final url =
        'https://geocoding-api.open-meteo.com/v1/search?name=$query&count=5&language=${locale?.languageCode}&format=json';
    try {
      Response response = await dioLocation.get(url);
      if (response.statusCode == 200) {
        CityApi cityData = CityApi.fromJson(response.data);
        return cityData.results.map(
          (e) => Result(
            admin1: e.admin1,
            name: e.name,
            latitude: e.latitude,
            longitude: e.longitude,
          ),
        );
      } else {
        throw Exception('Failed to load suggestions');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
