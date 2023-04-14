class WeatherHourlyApi {
  WeatherHourlyApi({
    required this.hourly,
    required this.timezone,
  });

  Hourly hourly;
  String timezone;

  factory WeatherHourlyApi.fromJson(Map<String, dynamic> json) =>
      WeatherHourlyApi(
        hourly: Hourly.fromJson(json["hourly"]),
        timezone: json["timezone"],
      );
}

class Hourly {
  Hourly({
    this.time,
    this.temperature2M,
    this.relativehumidity2M,
    this.apparentTemperature,
    this.precipitation,
    this.rain,
    this.weathercode,
    this.surfacePressure,
    this.visibility,
    this.evapotranspiration,
    this.windspeed10M,
    this.winddirection10M,
    this.cloudcover,
    this.uvIndex,
  });

  List<String>? time;
  List<double>? temperature2M;
  List<int>? relativehumidity2M;
  List<double>? apparentTemperature;
  List<double>? precipitation;
  List<double>? rain;
  List<int>? weathercode;
  List<double>? surfacePressure;
  List<double>? visibility;
  List<double>? evapotranspiration;
  List<double>? windspeed10M;
  List<int>? winddirection10M;
  List<int>? cloudcover;
  List<double>? uvIndex;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M: List<double>.from(json["temperature_2m"].map((x) => x)),
        relativehumidity2M:
            List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        apparentTemperature:
            List<double>.from(json["apparent_temperature"].map((x) => x)),
        precipitation: List<double>.from(json["precipitation"].map((x) => x)),
        rain: List<double>.from(json["rain"].map((x) => x)),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        surfacePressure:
            List<double>.from(json["surface_pressure"].map((x) => x)),
        visibility: List<double>.from(json["visibility"].map((x) => x)),
        evapotranspiration:
            List<double>.from(json["evapotranspiration"].map((x) => x)),
        windspeed10M: List<double>.from(json["windspeed_10m"].map((x) => x)),
        winddirection10M:
            List<int>.from(json["winddirection_10m"].map((x) => x)),
        cloudcover: List<int>.from(json["cloudcover"].map((x) => x)),
        uvIndex: List<double>.from(json["uv_index"].map((x) => x)),
      );
}
