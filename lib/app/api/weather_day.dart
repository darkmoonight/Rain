import 'dart:convert';

WeatherDay weatherDayFromJson(String str) =>
    WeatherDay.fromJson(json.decode(str));

String weatherDayToJson(WeatherDay data) => json.encode(data.toJson());

class WeatherDay {
  WeatherDay({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
  });

  double latitude;
  double longitude;
  double generationtimeMs;
  int utcOffsetSeconds;
  String timezone;
  String timezoneAbbreviation;
  int elevation;
  HourlyUnits hourlyUnits;
  Hourly hourly;

  factory WeatherDay.fromJson(Map<String, dynamic> json) => WeatherDay(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        hourlyUnits: HourlyUnits.fromJson(json["hourly_units"]),
        hourly: Hourly.fromJson(json["hourly"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "hourly_units": hourlyUnits.toJson(),
        "hourly": hourly.toJson(),
      };
}

class Hourly {
  Hourly({
    required this.time,
    required this.temperature2M,
    required this.relativehumidity2M,
    required this.apparentTemperature,
    required this.precipitation,
    required this.rain,
    required this.weathercode,
    required this.surfacePressure,
    required this.visibility,
    required this.evapotranspiration,
    required this.windspeed10M,
    required this.winddirection10M,
  });

  List<String> time;
  List<double> temperature2M;
  List<int> relativehumidity2M;
  List<double> apparentTemperature;
  List<double> precipitation;
  List<int> rain;
  List<int> weathercode;
  List<double> surfacePressure;
  List<int> visibility;
  List<double> evapotranspiration;
  List<double> windspeed10M;
  List<int> winddirection10M;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M:
            List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        relativehumidity2M:
            List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        apparentTemperature: List<double>.from(
            json["apparent_temperature"].map((x) => x?.toDouble())),
        precipitation:
            List<double>.from(json["precipitation"].map((x) => x?.toDouble())),
        rain: List<int>.from(json["rain"].map((x) => x)),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        surfacePressure: List<double>.from(
            json["surface_pressure"].map((x) => x?.toDouble())),
        visibility: List<int>.from(json["visibility"].map((x) => x)),
        evapotranspiration: List<double>.from(
            json["evapotranspiration"].map((x) => x?.toDouble())),
        windspeed10M:
            List<double>.from(json["windspeed_10m"].map((x) => x?.toDouble())),
        winddirection10M:
            List<int>.from(json["winddirection_10m"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "relativehumidity_2m":
            List<dynamic>.from(relativehumidity2M.map((x) => x)),
        "apparent_temperature":
            List<dynamic>.from(apparentTemperature.map((x) => x)),
        "precipitation": List<dynamic>.from(precipitation.map((x) => x)),
        "rain": List<dynamic>.from(rain.map((x) => x)),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "surface_pressure": List<dynamic>.from(surfacePressure.map((x) => x)),
        "visibility": List<dynamic>.from(visibility.map((x) => x)),
        "evapotranspiration":
            List<dynamic>.from(evapotranspiration.map((x) => x)),
        "windspeed_10m": List<dynamic>.from(windspeed10M.map((x) => x)),
        "winddirection_10m": List<dynamic>.from(winddirection10M.map((x) => x)),
      };
}

class HourlyUnits {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.relativehumidity2M,
    required this.apparentTemperature,
    required this.precipitation,
    required this.rain,
    required this.weathercode,
    required this.surfacePressure,
    required this.visibility,
    required this.evapotranspiration,
    required this.windspeed10M,
    required this.winddirection10M,
  });

  String time;
  String temperature2M;
  String relativehumidity2M;
  String apparentTemperature;
  String precipitation;
  String rain;
  String weathercode;
  String surfacePressure;
  String visibility;
  String evapotranspiration;
  String windspeed10M;
  String winddirection10M;

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        relativehumidity2M: json["relativehumidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        precipitation: json["precipitation"],
        rain: json["rain"],
        weathercode: json["weathercode"],
        surfacePressure: json["surface_pressure"],
        visibility: json["visibility"],
        evapotranspiration: json["evapotranspiration"],
        windspeed10M: json["windspeed_10m"],
        winddirection10M: json["winddirection_10m"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "relativehumidity_2m": relativehumidity2M,
        "apparent_temperature": apparentTemperature,
        "precipitation": precipitation,
        "rain": rain,
        "weathercode": weathercode,
        "surface_pressure": surfacePressure,
        "visibility": visibility,
        "evapotranspiration": evapotranspiration,
        "windspeed_10m": windspeed10M,
        "winddirection_10m": winddirection10M,
      };
}
