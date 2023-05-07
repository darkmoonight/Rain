class WeatherDailyApi {
  WeatherDailyApi({
    required this.daily,
  });

  Daily daily;

  factory WeatherDailyApi.fromJson(Map<String, dynamic> json) =>
      WeatherDailyApi(
        daily: Daily.fromJson(json["daily"]),
      );
}

class Daily {
  Daily({
    this.time,
    this.weathercode,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.precipitationSum,
    this.precipitationProbabilityMax,
    this.windspeed10MMax,
    this.windgusts10MMax,
    this.uvIndexMax,
    this.rainSum,
    this.winddirection10MDominant,
  });

  List<DateTime>? time;
  List<int>? weathercode;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  List<double>? apparentTemperatureMax;
  List<double>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double>? precipitationSum;
  List<int>? precipitationProbabilityMax;
  List<double>? windspeed10MMax;
  List<double>? windgusts10MMax;
  List<double>? uvIndexMax;
  List<double>? rainSum;
  List<int>? winddirection10MDominant;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        temperature2MMax:
            List<double>.from(json["temperature_2m_max"].map((x) => x)),
        temperature2MMin:
            List<double>.from(json["temperature_2m_min"].map((x) => x)),
        apparentTemperatureMax:
            List<double>.from(json["apparent_temperature_max"].map((x) => x)),
        apparentTemperatureMin:
            List<double>.from(json["apparent_temperature_min"].map((x) => x)),
        sunrise: List<String>.from(json["sunrise"].map((x) => x)),
        sunset: List<String>.from(json["sunset"].map((x) => x)),
        precipitationSum:
            List<double>.from(json["precipitation_sum"].map((x) => x)),
        precipitationProbabilityMax:
            List<int>.from(json["precipitation_probability_max"].map((x) => x)),
        windspeed10MMax:
            List<double>.from(json["windspeed_10m_max"].map((x) => x)),
        windgusts10MMax:
            List<double>.from(json["windgusts_10m_max"].map((x) => x)),
        uvIndexMax: List<double>.from(json["uv_index_max"].map((x) => x)),
        rainSum: List<double>.from(json["rain_sum"].map((x) => x)),
        winddirection10MDominant:
            List<int>.from(json["winddirection_10m_dominant"].map((x) => x)),
      );
}
