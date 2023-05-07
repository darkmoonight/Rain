import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rain/app/api/city.dart';
import 'package:rain/app/api/daily.dart';
import 'package:rain/app/api/hourly.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/main.dart';

class WeatherAPI {
  final Dio dio = Dio()
    ..options.baseUrl = 'https://api.open-meteo.com/v1/forecast?';
  final Dio dioLocation = Dio();

  Future<MainWeatherCache> getWeatherData(double? lat, double? lon) async {
    String baseUrlHourly =
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index&timezone=auto&forecast_days=7';
    String urlHourly;
    settings.measurements == 'imperial' && settings.degrees == 'fahrenheit'
        ? urlHourly =
            '$baseUrlHourly&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch'
        : settings.measurements == 'imperial'
            ? urlHourly =
                '$baseUrlHourly&windspeed_unit=mph&precipitation_unit=inch'
            : settings.degrees == 'fahrenheit'
                ? urlHourly = '$baseUrlHourly&temperature_unit=fahrenheit'
                : urlHourly = baseUrlHourly;

    String baseUrlDaily =
        'latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant&forecast_days=10&timezone=auto';
    String urlDaily;
    settings.degrees == 'fahrenheit'
        ? urlDaily = '$baseUrlDaily&temperature_unit=fahrenheit'
        : urlDaily = baseUrlDaily;
    try {
      Response responseHourly = await dio.get(urlHourly);
      Response responseDaily = await dio.get(urlDaily);
      WeatherHourlyApi weatherDataHourly =
          WeatherHourlyApi.fromJson(responseHourly.data);
      WeatherDailyApi weatherDataDaily =
          WeatherDailyApi.fromJson(responseDaily.data);
      return MainWeatherCache(
        time: weatherDataHourly.hourly.time,
        temperature2M: weatherDataHourly.hourly.temperature2M,
        relativehumidity2M: weatherDataHourly.hourly.relativehumidity2M,
        apparentTemperature: weatherDataHourly.hourly.apparentTemperature,
        precipitation: weatherDataHourly.hourly.precipitation,
        rain: weatherDataHourly.hourly.rain,
        weathercode: weatherDataHourly.hourly.weathercode,
        surfacePressure: weatherDataHourly.hourly.surfacePressure,
        visibility: weatherDataHourly.hourly.visibility,
        evapotranspiration: weatherDataHourly.hourly.evapotranspiration,
        windspeed10M: weatherDataHourly.hourly.windspeed10M,
        winddirection10M: weatherDataHourly.hourly.winddirection10M,
        windgusts10M: weatherDataHourly.hourly.windgusts10M,
        cloudcover: weatherDataHourly.hourly.cloudcover,
        uvIndex: weatherDataHourly.hourly.uvIndex,
        timeDaily: weatherDataDaily.daily.time,
        weathercodeDaily: weatherDataDaily.daily.weathercode,
        temperature2MMax: weatherDataDaily.daily.temperature2MMax,
        temperature2MMin: weatherDataDaily.daily.temperature2MMin,
        apparentTemperatureMax: weatherDataDaily.daily.apparentTemperatureMax,
        apparentTemperatureMin: weatherDataDaily.daily.apparentTemperatureMin,
        sunrise: weatherDataDaily.daily.sunrise,
        sunset: weatherDataDaily.daily.sunset,
        precipitationSum: weatherDataDaily.daily.precipitationSum,
        precipitationProbabilityMax:
            weatherDataDaily.daily.precipitationProbabilityMax,
        windspeed10MMax: weatherDataDaily.daily.windspeed10MMax,
        windgusts10MMax: weatherDataDaily.daily.windgusts10MMax,
        uvIndexMax: weatherDataDaily.daily.uvIndexMax,
        rainSum: weatherDataDaily.daily.rainSum,
        winddirection10MDominant:
            weatherDataDaily.daily.winddirection10MDominant,
        timezone: weatherDataHourly.timezone,
        timestamp: DateTime.now(),
      );
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<Iterable<Result>> getSuggestions(String query, Locale? locale) async {
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
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<WeatherCard> getWeatherCard(double? lat, double? lon, String city,
      String district, String timezone) async {
    String baseUrlHourly =
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m,windgusts_10m,cloudcover,uv_index&timezone=auto&forecast_days=7';
    String urlHourly;
    settings.measurements == 'imperial' && settings.degrees == 'fahrenheit'
        ? urlHourly =
            '$baseUrlHourly&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch'
        : settings.measurements == 'imperial'
            ? urlHourly =
                '$baseUrlHourly&windspeed_unit=mph&precipitation_unit=inch'
            : settings.degrees == 'fahrenheit'
                ? urlHourly = '$baseUrlHourly&temperature_unit=fahrenheit'
                : urlHourly = baseUrlHourly;

    String baseUrlDaily =
        'latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,precipitation_sum,precipitation_probability_max,windspeed_10m_max,windgusts_10m_max,uv_index_max,rain_sum,winddirection_10m_dominant&forecast_days=10&timezone=auto';
    String urlDaily;
    settings.degrees == 'fahrenheit'
        ? urlDaily = '$baseUrlDaily&temperature_unit=fahrenheit'
        : urlDaily = baseUrlDaily;
    try {
      Response responseHourly = await dio.get(urlHourly);
      Response responseDaily = await dio.get(urlDaily);
      WeatherHourlyApi weatherDataHourly =
          WeatherHourlyApi.fromJson(responseHourly.data);
      WeatherDailyApi weatherDataDaily =
          WeatherDailyApi.fromJson(responseDaily.data);
      return WeatherCard(
        time: weatherDataHourly.hourly.time,
        temperature2M: weatherDataHourly.hourly.temperature2M,
        relativehumidity2M: weatherDataHourly.hourly.relativehumidity2M,
        apparentTemperature: weatherDataHourly.hourly.apparentTemperature,
        precipitation: weatherDataHourly.hourly.precipitation,
        rain: weatherDataHourly.hourly.rain,
        weathercode: weatherDataHourly.hourly.weathercode,
        surfacePressure: weatherDataHourly.hourly.surfacePressure,
        visibility: weatherDataHourly.hourly.visibility,
        evapotranspiration: weatherDataHourly.hourly.evapotranspiration,
        windspeed10M: weatherDataHourly.hourly.windspeed10M,
        winddirection10M: weatherDataHourly.hourly.winddirection10M,
        windgusts10M: weatherDataHourly.hourly.windgusts10M,
        cloudcover: weatherDataHourly.hourly.cloudcover,
        uvIndex: weatherDataHourly.hourly.uvIndex,
        timeDaily: weatherDataDaily.daily.time,
        weathercodeDaily: weatherDataDaily.daily.weathercode,
        temperature2MMax: weatherDataDaily.daily.temperature2MMax,
        temperature2MMin: weatherDataDaily.daily.temperature2MMin,
        apparentTemperatureMax: weatherDataDaily.daily.apparentTemperatureMax,
        apparentTemperatureMin: weatherDataDaily.daily.apparentTemperatureMin,
        sunrise: weatherDataDaily.daily.sunrise,
        sunset: weatherDataDaily.daily.sunset,
        precipitationSum: weatherDataDaily.daily.precipitationSum,
        precipitationProbabilityMax:
            weatherDataDaily.daily.precipitationProbabilityMax,
        windspeed10MMax: weatherDataDaily.daily.windspeed10MMax,
        windgusts10MMax: weatherDataDaily.daily.windgusts10MMax,
        uvIndexMax: weatherDataDaily.daily.uvIndexMax,
        rainSum: weatherDataDaily.daily.rainSum,
        winddirection10MDominant:
            weatherDataDaily.daily.winddirection10MDominant,
        lat: lat,
        lon: lon,
        city: city,
        district: district,
        timezone: timezone,
        timestamp: DateTime.now(),
      );
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
