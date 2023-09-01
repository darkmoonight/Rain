class WeatherDataApi {
  Hourly hourly;
  Daily daily;
  String timezone;

  WeatherDataApi({
    required this.hourly,
    required this.daily,
    required this.timezone,
  });

  factory WeatherDataApi.fromJson(Map<String, dynamic> json) => WeatherDataApi(
        hourly: Hourly.fromJson(json['hourly']),
        daily: Daily.fromJson(json['daily']),
        timezone: json['timezone'],
      );
}

class Hourly {
  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2M;
  List<double?>? apparentTemperature;
  List<double?>? precipitation;
  List<double?>? rain;
  List<int?>? relativehumidity2M;
  List<double?>? surfacePressure;
  List<double?>? visibility;
  List<double?>? evapotranspiration;
  List<double?>? windspeed10M;
  List<int?>? winddirection10M;
  List<double?>? windgusts10M;
  List<int?>? cloudcover;
  List<double?>? uvIndex;

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
    this.windgusts10M,
    this.cloudcover,
    this.uvIndex,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json['time'].map((x) => x)),
        weathercode: List<int>.from(json['weathercode'].map((x) => x)),
        temperature2M: List<double>.from(json['temperature_2m'].map((x) => x)),
        apparentTemperature:
            List<double?>.from(json['apparent_temperature'].map((x) => x)),
        relativehumidity2M:
            List<int?>.from(json['relativehumidity_2m'].map((x) => x)),
        precipitation: List<double>.from(json['precipitation'].map((x) => x)),
        rain: List<double?>.from(json['rain'].map((x) => x)),
        surfacePressure:
            List<double?>.from(json['surface_pressure'].map((x) => x)),
        visibility: List<double?>.from(json['visibility'].map((x) => x)),
        evapotranspiration:
            List<double?>.from(json['evapotranspiration'].map((x) => x)),
        windspeed10M: List<double?>.from(json['windspeed_10m'].map((x) => x)),
        winddirection10M:
            List<int?>.from(json['winddirection_10m'].map((x) => x)),
        windgusts10M: List<double?>.from(json['windgusts_10m'].map((x) => x)),
        cloudcover: List<int?>.from(json['cloudcover'].map((x) => x)),
        uvIndex: List<double?>.from(json['uv_index'].map((x) => x)),
      );
}

class Daily {
  List<DateTime>? time;
  List<int?>? weathercode;
  List<double?>? temperature2MMax;
  List<double?>? temperature2MMin;
  List<double?>? apparentTemperatureMax;
  List<double?>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double?>? precipitationSum;
  List<int?>? precipitationProbabilityMax;
  List<double?>? windspeed10MMax;
  List<double?>? windgusts10MMax;
  List<double?>? uvIndexMax;
  List<double?>? rainSum;
  List<int?>? winddirection10MDominant;

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

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json['time'].map((x) => DateTime.parse(x))),
        weathercode: List<int?>.from(json['weathercode'].map((x) => x)),
        temperature2MMax:
            List<double?>.from(json['temperature_2m_max'].map((x) => x)),
        temperature2MMin:
            List<double?>.from(json['temperature_2m_min'].map((x) => x)),
        apparentTemperatureMax:
            List<double?>.from(json['apparent_temperature_max'].map((x) => x)),
        apparentTemperatureMin:
            List<double?>.from(json['apparent_temperature_min'].map((x) => x)),
        sunrise: List<String>.from(json['sunrise'].map((x) => x)),
        sunset: List<String>.from(json['sunset'].map((x) => x)),
        precipitationSum:
            List<double?>.from(json['precipitation_sum'].map((x) => x)),
        precipitationProbabilityMax: List<int?>.from(
            json['precipitation_probability_max'].map((x) => x)),
        windspeed10MMax:
            List<double?>.from(json['windspeed_10m_max'].map((x) => x)),
        windgusts10MMax:
            List<double?>.from(json['windgusts_10m_max'].map((x) => x)),
        uvIndexMax: List<double?>.from(json['uv_index_max'].map((x) => x)),
        rainSum: List<double?>.from(json['rain_sum'].map((x) => x)),
        winddirection10MDominant:
            List<int?>.from(json['winddirection_10m_dominant'].map((x) => x)),
      );
}
