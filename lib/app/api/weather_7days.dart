import 'dart:convert';

Weather7DaysApi weather7DaysFromJson(String str) =>
    Weather7DaysApi.fromJson(json.decode(str));

class Weather7DaysApi {
  Weather7DaysApi({
    required this.daily,
  });

  Daily daily;

  factory Weather7DaysApi.fromJson(Map<String, dynamic> json) =>
      Weather7DaysApi(
        daily: Daily.fromJson(json["daily"]),
      );
}

class Daily {
  Daily({
    this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
  });

  List<DateTime>? time;
  List<int>? weathercode;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        temperature2MMax: List<double>.from(
            json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2MMin: List<double>.from(
            json["temperature_2m_min"].map((x) => x?.toDouble())),
      );
}
