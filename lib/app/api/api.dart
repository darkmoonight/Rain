import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rain/app/api/weather_day.dart';

import 'weather_7days.dart';

class WeatherAPI {
  final Dio dio = Dio()
    ..options.baseUrl = 'https://api.open-meteo.com/v1/forecast?'
    ..options.connectTimeout = 60 * 1000
    ..options.receiveTimeout = 60 * 1000;

  Future<Hourly> getWeatherData(String lat, String lon) async {
    var url =
        'latitude=$lat&longitude=$lon&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,rain,weathercode,surface_pressure,visibility,evapotranspiration,windspeed_10m,winddirection_10m&timezone=auto';
    try {
      Response response = await dio.get(url);
      WeatherDayApi weatherData = WeatherDayApi.fromJson(response.data);
      return weatherData.hourly;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<Daily> getWeather7Data(String lat, String lon) async {
    var url =
        'latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min&timezone=auto';
    try {
      Response response = await dio.get(url);
      Weather7DaysApi weatherData = Weather7DaysApi.fromJson(response.data);
      return weatherData.daily;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
