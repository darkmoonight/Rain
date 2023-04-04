class WeatherDailyApi {
  WeatherDailyApi({
    required this.daily,
    required this.timezone,
  });

  Daily daily;
  String timezone;

  factory WeatherDailyApi.fromJson(Map<String, dynamic> json) =>
      WeatherDailyApi(
        daily: Daily.fromJson(json["daily"]),
        timezone: json["timezone"],
      );
}

class Daily {
  Daily({
    this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.sunrise,
    this.sunset,
  });

  List<DateTime>? time;
  List<int>? weathercode;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  List<String>? sunrise;
  List<String>? sunset;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        temperature2MMax: List<double>.from(
            json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2MMin: List<double>.from(
            json["temperature_2m_min"].map((x) => x?.toDouble())),
        sunrise: List<String>.from(json["sunrise"].map((x) => x)),
        sunset: List<String>.from(json["sunset"].map((x) => x)),
      );
}
