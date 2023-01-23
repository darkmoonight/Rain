import 'package:dio/dio.dart';

class WeatherAPI {
  final Dio dio = Dio();
  final baseUrl = 'https://api.open-meteo.com/v1/forecast?';
}
