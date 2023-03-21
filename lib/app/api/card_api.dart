class WeatherCardApi {
  WeatherCardApi({
    required this.weatherCardHourly,
  });

  WeatherCardHourly weatherCardHourly;

  factory WeatherCardApi.fromJson(Map<String, dynamic> json) => WeatherCardApi(
        weatherCardHourly: WeatherCardHourly.fromJson(json["hourly"]),
      );
}

class WeatherCardHourly {
  WeatherCardHourly({
    this.time,
    this.temperature2M,
    this.weathercode,
  });

  List<String>? time;
  List<double>? temperature2M;
  List<int>? weathercode;

  factory WeatherCardHourly.fromJson(Map<String, dynamic> json) =>
      WeatherCardHourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M:
            List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
      );
}
