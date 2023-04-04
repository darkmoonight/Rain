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
        'latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto';
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
        sunrise: weatherData.daily.sunrise,
        sunset: weatherData.daily.sunset,
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

  Future<Iterable<Result>> getSuggestions(
      String query, Locale? locale, String apiKey) async {
    final url =
        'https://api.geoapify.com/v1/geocode/search?city=$query&apiKey=$apiKey&lang=${locale?.languageCode}&format=json';
    try {
      Response response = await dioLocation.get(url);
      if (response.statusCode == 200) {
        CityApi cityData = CityApi.fromJson(response.data);
        return cityData.results.map(
          (e) => Result(
            country: e.country,
            state: e.state,
            city: e.city,
            lon: e.lon,
            lat: e.lat,
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
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m&timezone=auto&forecast_days=3';
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
        'latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset&timezone=auto';
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
        time: weatherDataHourly.hourly.time!,
        temperature2M: weatherDataHourly.hourly.temperature2M!,
        relativehumidity2M: weatherDataHourly.hourly.relativehumidity2M!,
        apparentTemperature: weatherDataHourly.hourly.apparentTemperature!,
        precipitation: weatherDataHourly.hourly.precipitation!,
        rain: weatherDataHourly.hourly.rain!,
        weathercode: weatherDataHourly.hourly.weathercode!,
        surfacePressure: weatherDataHourly.hourly.surfacePressure!,
        visibility: weatherDataHourly.hourly.visibility!,
        evapotranspiration: weatherDataHourly.hourly.evapotranspiration!,
        windspeed10M: weatherDataHourly.hourly.windspeed10M!,
        winddirection10M: weatherDataHourly.hourly.winddirection10M!,
        timeDaily: weatherDataDaily.daily.time!,
        weathercodeDaily: weatherDataDaily.daily.weathercode!,
        temperature2MMax: weatherDataDaily.daily.temperature2MMax!,
        temperature2MMin: weatherDataDaily.daily.temperature2MMin!,
        sunrise: weatherDataDaily.daily.sunrise,
        sunset: weatherDataDaily.daily.sunset,
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
