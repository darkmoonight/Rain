import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rain/app/api/card_api.dart';
import 'package:rain/app/api/daily.dart';
import 'package:rain/app/api/hourly.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/main.dart';

class WeatherAPI {
  final Dio dio = Dio()
    ..options.baseUrl = 'https://api.open-meteo.com/v1/forecast?';
  final Dio dioLocation = Dio();

  Future<HourlyCache> getWeatherData(double? lat, double? lon) async {
    String baseUrl =
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m&timezone=auto&forecast_days=3';
    String url;
    settings.measurements == 'imperial' && settings.degrees == 'fahrenheit'
        ? url =
            '$baseUrl&temperature_unit=fahrenheit&windspeed_unit=mph&precipitation_unit=inch'
        : settings.measurements == 'imperial'
            ? url = '$baseUrl&windspeed_unit=mph&precipitation_unit=inch'
            : settings.degrees == 'fahrenheit'
                ? url = '$baseUrl&temperature_unit=fahrenheit'
                : url = baseUrl;
    try {
      Response response = await dio.get(url);
      WeatherHourlyApi weatherData = WeatherHourlyApi.fromJson(response.data);
      return HourlyCache(
        time: weatherData.hourly.time!,
        temperature2M: weatherData.hourly.temperature2M!,
        relativehumidity2M: weatherData.hourly.relativehumidity2M!,
        apparentTemperature: weatherData.hourly.apparentTemperature!,
        precipitation: weatherData.hourly.precipitation!,
        rain: weatherData.hourly.rain!,
        weathercode: weatherData.hourly.weathercode!,
        surfacePressure: weatherData.hourly.surfacePressure!,
        visibility: weatherData.hourly.visibility!,
        evapotranspiration: weatherData.hourly.evapotranspiration!,
        windspeed10M: weatherData.hourly.windspeed10M!,
        winddirection10M: weatherData.hourly.winddirection10M!,
        timezone: weatherData.timezone,
        timestamp: DateTime.now(),
      );
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<DailyCache> getWeather7Data(double? lat, double? lon) async {
    String baseUrl =
        'latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min&timezone=auto';
    String url;
    settings.degrees == 'fahrenheit'
        ? url = '$baseUrl&temperature_unit=fahrenheit'
        : url = baseUrl;
    try {
      Response response = await dio.get(url);
      WeatherDailyApi weatherData = WeatherDailyApi.fromJson(response.data);
      return DailyCache(
        time: weatherData.daily.time!,
        weathercode: weatherData.daily.weathercode!,
        temperature2MMax: weatherData.daily.temperature2MMax!,
        temperature2MMin: weatherData.daily.temperature2MMin!,
        timezone: weatherData.timezone,
        timestamp: DateTime.now(),
      );
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<List<dynamic>> getSuggestions(
      String query, Locale? locale, String apiKey) async {
    final url =
        'https://api.geoapify.com/v1/geocode/search?city=$query&apiKey=$apiKey&lang=${locale?.languageCode}&format=json';
    try {
      Response response = await dioLocation.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        final results = data['results'];
        return results;
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
    String baseUrl =
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,weathercode&timezone=auto&forecast_days=3';
    String url;
    settings.degrees == 'fahrenheit'
        ? url = '$baseUrl&temperature_unit=fahrenheit'
        : url = baseUrl;
    try {
      Response response = await dio.get(url);
      WeatherCardApi weatherData = WeatherCardApi.fromJson(response.data);
      return WeatherCard(
        time: weatherData.weatherCardHourly.time!,
        temperature2M: weatherData.weatherCardHourly.temperature2M!,
        weathercode: weatherData.weatherCardHourly.weathercode!,
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
