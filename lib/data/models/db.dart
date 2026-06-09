import 'package:isar_community/isar.dart';

part 'db.g.dart';

/// App preferences and display units persisted in Isar.
@collection
class Settings {
  Id id = Isar.autoIncrement;
  bool onboard = false;
  String? theme = 'system';
  bool location = false;
  bool notifications = false;
  bool materialColor = false;
  bool amoledTheme = false;
  bool roundDegree = false;
  bool largeElement = false;
  bool hideMap = false;
  String? widgetBackgroundColor;
  String? widgetTextColor;
  String measurements = 'metric';
  String degrees = 'celsius';
  String wind = 'kph';
  String pressure = 'hPa';
  String timeformat = '24';
  String aqiStandard = 'european';
  String? language;
  int? timeRange;
  String? timeStart;
  String? timeEnd;

  /// Incremented when forecast cache schema changes; triggers a re-save migration.
  int weatherCacheVersion = 0;
}

/// Cached forecast for the primary home-screen location.
@collection
class MainWeatherCache {
  Id id = Isar.autoIncrement;

  // --- Hourly fields ---

  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2M;
  List<double?>? apparentTemperature;
  List<int?>? relativehumidity2M;
  List<double?>? precipitation;
  List<double?>? rain;
  List<double?>? surfacePressure;
  List<double?>? visibility;
  List<double?>? evapotranspiration;
  List<double?>? windspeed10M;
  List<int?>? winddirection10M;
  List<double?>? windgusts10M;
  List<int?>? cloudcover;
  List<double?>? uvIndex;
  List<double?>? dewpoint2M;
  List<int?>? precipitationProbability;
  List<double?>? shortwaveRadiation;

  // --- Air quality hourly fields ---

  List<double?>? europeanAqi;
  List<double?>? usAqi;
  List<double?>? pm25;
  List<double?>? pm10;
  List<double?>? ozone;
  List<double?>? co;
  List<double?>? no2;
  List<double?>? so2;

  // --- Daily fields ---

  List<DateTime>? timeDaily;
  List<int?>? weathercodeDaily;
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

  // --- Metadata ---

  String? timezone;
  DateTime? timestamp;

  /// Creates a [MainWeatherCache] with optional hourly, daily, and metadata fields.
  MainWeatherCache({
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
    this.dewpoint2M,
    this.precipitationProbability,
    this.shortwaveRadiation,
    this.europeanAqi,
    this.usAqi,
    this.pm25,
    this.pm10,
    this.ozone,
    this.co,
    this.no2,
    this.so2,
    this.timeDaily,
    this.weathercodeDaily,
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
    this.timezone,
    this.timestamp,
  });

  /// Serializes hourly, daily, and metadata fields to a JSON map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'time': time,
    'weathercode': weathercode,
    'temperature2M': temperature2M,
    'apparentTemperature': apparentTemperature,
    'relativehumidity2M': relativehumidity2M,
    'precipitation': precipitation,
    'rain': rain,
    'surfacePressure': surfacePressure,
    'visibility': visibility,
    'evapotranspiration': evapotranspiration,
    'windspeed10M': windspeed10M,
    'winddirection10M': winddirection10M,
    'windgusts10M': windgusts10M,
    'cloudcover': cloudcover,
    'uvIndex': uvIndex,
    'dewpoint2M': dewpoint2M,
    'precipitationProbability': precipitationProbability,
    'shortwaveRadiation': shortwaveRadiation,
    'europeanAqi': europeanAqi,
    'usAqi': usAqi,
    'pm25': pm25,
    'pm10': pm10,
    'ozone': ozone,
    'co': co,
    'no2': no2,
    'so2': so2,
    'timeDaily': timeDaily,
    'weathercodeDaily': weathercodeDaily,
    'temperature2MMax': temperature2MMax,
    'temperature2MMin': temperature2MMin,
    'apparentTemperatureMax': apparentTemperatureMax,
    'apparentTemperatureMin': apparentTemperatureMin,
    'sunrise': sunrise,
    'sunset': sunset,
    'precipitationSum': precipitationSum,
    'precipitationProbabilityMax': precipitationProbabilityMax,
    'windspeed10MMax': windspeed10MMax,
    'windgusts10MMax': windgusts10MMax,
    'uvIndexMax': uvIndexMax,
    'rainSum': rainSum,
    'winddirection10MDominant': winddirection10MDominant,
    'timezone': timezone,
    'timestamp': timestamp,
  };
}

/// Cached city and coordinates for the primary home-screen location.
@collection
class LocationCache {
  Id id = Isar.autoIncrement;
  double? lat;
  double? lon;
  String? city;
  String? district;

  /// Creates a location cache with optional coordinates and labels.
  LocationCache({this.lat, this.lon, this.city, this.district});

  /// Serializes location fields to a JSON map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'lat': lat,
    'lon': lon,
    'city': city,
    'district': district,
  };
}

/// Cached forecast and location metadata for a saved city card.
@collection
class WeatherCard {
  Id id = Isar.autoIncrement;

  // --- Hourly fields ---

  List<String>? time;
  List<int>? weathercode;
  List<double>? temperature2M;
  List<double?>? apparentTemperature;
  List<int?>? relativehumidity2M;
  List<double?>? precipitation;
  List<double?>? rain;
  List<double?>? surfacePressure;
  List<double?>? visibility;
  List<double?>? evapotranspiration;
  List<double?>? windspeed10M;
  List<int?>? winddirection10M;
  List<double?>? windgusts10M;
  List<int?>? cloudcover;
  List<double?>? uvIndex;
  List<double?>? dewpoint2M;
  List<int?>? precipitationProbability;
  List<double?>? shortwaveRadiation;

  // --- Air quality hourly fields ---

  List<double?>? europeanAqi;
  List<double?>? usAqi;
  List<double?>? pm25;
  List<double?>? pm10;
  List<double?>? ozone;
  List<double?>? co;
  List<double?>? no2;
  List<double?>? so2;

  // --- Daily fields ---

  List<DateTime>? timeDaily;
  List<int?>? weathercodeDaily;
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

  // --- Location and metadata ---

  double? lat;
  double? lon;
  String? city;
  String? district;
  String? timezone;
  DateTime? timestamp;
  int? index;

  /// Creates a weather card with optional forecast, location, and sort fields.
  WeatherCard({
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
    this.dewpoint2M,
    this.precipitationProbability,
    this.shortwaveRadiation,
    this.europeanAqi,
    this.usAqi,
    this.pm25,
    this.pm10,
    this.ozone,
    this.co,
    this.no2,
    this.so2,
    this.timeDaily,
    this.weathercodeDaily,
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
    this.lat,
    this.lon,
    this.city,
    this.district,
    this.timezone,
    this.timestamp,
    this.index,
  });

  /// Serializes forecast, location, and metadata fields to a JSON map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'time': time,
    'weathercode': weathercode,
    'temperature2M': temperature2M,
    'apparentTemperature': apparentTemperature,
    'relativehumidity2M': relativehumidity2M,
    'precipitation': precipitation,
    'rain': rain,
    'surfacePressure': surfacePressure,
    'visibility': visibility,
    'evapotranspiration': evapotranspiration,
    'windspeed10M': windspeed10M,
    'winddirection10M': winddirection10M,
    'windgusts10M': windgusts10M,
    'cloudcover': cloudcover,
    'uvIndex': uvIndex,
    'dewpoint2M': dewpoint2M,
    'precipitationProbability': precipitationProbability,
    'shortwaveRadiation': shortwaveRadiation,
    'europeanAqi': europeanAqi,
    'usAqi': usAqi,
    'pm25': pm25,
    'pm10': pm10,
    'ozone': ozone,
    'co': co,
    'no2': no2,
    'so2': so2,
    'timeDaily': timeDaily,
    'weathercodeDaily': weathercodeDaily,
    'temperature2MMax': temperature2MMax,
    'temperature2MMin': temperature2MMin,
    'apparentTemperatureMax': apparentTemperatureMax,
    'apparentTemperatureMin': apparentTemperatureMin,
    'sunrise': sunrise,
    'sunset': sunset,
    'precipitationSum': precipitationSum,
    'precipitationProbabilityMax': precipitationProbabilityMax,
    'windspeed10MMax': windspeed10MMax,
    'windgusts10MMax': windgusts10MMax,
    'uvIndexMax': uvIndexMax,
    'rainSum': rainSum,
    'winddirection10MDominant': winddirection10MDominant,
    'timezone': timezone,
    'timestamp': timestamp,
    'lat': lat,
    'lon': lon,
    'city': city,
    'district': district,
    'index': index,
  };

  /// Builds a card from main weather cache fields, optionally with location metadata.
  factory WeatherCard.fromMainWeatherCache(
    MainWeatherCache cache, {
    double? lat,
    double? lon,
    String? city,
    String? district,
  }) => WeatherCard(
    time: cache.time,
    weathercode: cache.weathercode,
    temperature2M: cache.temperature2M,
    apparentTemperature: cache.apparentTemperature,
    relativehumidity2M: cache.relativehumidity2M,
    precipitation: cache.precipitation,
    rain: cache.rain,
    surfacePressure: cache.surfacePressure,
    visibility: cache.visibility,
    evapotranspiration: cache.evapotranspiration,
    windspeed10M: cache.windspeed10M,
    winddirection10M: cache.winddirection10M,
    windgusts10M: cache.windgusts10M,
    cloudcover: cache.cloudcover,
    uvIndex: cache.uvIndex,
    dewpoint2M: cache.dewpoint2M,
    precipitationProbability: cache.precipitationProbability,
    shortwaveRadiation: cache.shortwaveRadiation,
    europeanAqi: cache.europeanAqi,
    usAqi: cache.usAqi,
    pm25: cache.pm25,
    pm10: cache.pm10,
    ozone: cache.ozone,
    co: cache.co,
    no2: cache.no2,
    so2: cache.so2,
    timeDaily: cache.timeDaily,
    weathercodeDaily: cache.weathercodeDaily,
    temperature2MMax: cache.temperature2MMax,
    temperature2MMin: cache.temperature2MMin,
    apparentTemperatureMax: cache.apparentTemperatureMax,
    apparentTemperatureMin: cache.apparentTemperatureMin,
    sunrise: cache.sunrise,
    sunset: cache.sunset,
    precipitationSum: cache.precipitationSum,
    precipitationProbabilityMax: cache.precipitationProbabilityMax,
    windspeed10MMax: cache.windspeed10MMax,
    windgusts10MMax: cache.windgusts10MMax,
    uvIndexMax: cache.uvIndexMax,
    rainSum: cache.rainSum,
    winddirection10MDominant: cache.winddirection10MDominant,
    timezone: cache.timezone,
    timestamp: cache.timestamp,
    lat: lat,
    lon: lon,
    city: city,
    district: district,
  );

  /// Builds a card from main weather cache and location metadata.
  factory WeatherCard.fromMainAndLocation(
    MainWeatherCache cache,
    LocationCache location,
  ) => WeatherCard.fromMainWeatherCache(
    cache,
    lat: location.lat,
    lon: location.lon,
    city: location.city,
    district: location.district,
  );

  /// Deserializes a [WeatherCard] from a JSON map.
  factory WeatherCard.fromJson(Map<String, dynamic> json) {
    return WeatherCard(
      time: List<String>.from(json['time'] ?? []),
      weathercode: List<int>.from(json['weathercode'] ?? []),
      temperature2M: List<double>.from(json['temperature2M'] ?? []),
      apparentTemperature: List<double?>.from(
        json['apparentTemperature'] ?? [],
      ),
      relativehumidity2M: List<int?>.from(json['relativehumidity2M'] ?? []),
      precipitation: List<double>.from(json['precipitation'] ?? []),
      rain: List<double?>.from(json['rain'] ?? []),
      surfacePressure: List<double?>.from(json['surfacePressure'] ?? []),
      visibility: List<double?>.from(json['visibility'] ?? []),
      evapotranspiration: List<double?>.from(json['evapotranspiration'] ?? []),
      windspeed10M: List<double?>.from(json['windspeed10M'] ?? []),
      winddirection10M: List<int?>.from(json['winddirection10M'] ?? []),
      windgusts10M: List<double?>.from(json['windgusts10M'] ?? []),
      cloudcover: List<int?>.from(json['cloudcover'] ?? []),
      uvIndex: List<double?>.from(json['uvIndex'] ?? []),
      dewpoint2M: List<double?>.from(json['dewpoint2M'] ?? []),
      precipitationProbability: List<int?>.from(
        json['precipitationProbability'] ?? [],
      ),
      shortwaveRadiation: List<double?>.from(json['shortwaveRadiation'] ?? []),
      europeanAqi: List<double?>.from(json['europeanAqi'] ?? []),
      usAqi: List<double?>.from(json['usAqi'] ?? []),
      pm25: List<double?>.from(json['pm25'] ?? []),
      pm10: List<double?>.from(json['pm10'] ?? []),
      ozone: List<double?>.from(json['ozone'] ?? []),
      co: List<double?>.from(json['co'] ?? []),
      no2: List<double?>.from(json['no2'] ?? []),
      so2: List<double?>.from(json['so2'] ?? []),
      timeDaily: List<DateTime>.from(json['timeDaily'] ?? []),
      weathercodeDaily: List<int?>.from(json['weathercodeDaily'] ?? []),
      temperature2MMax: List<double?>.from(json['temperature2MMax'] ?? []),
      temperature2MMin: List<double?>.from(json['temperature2MMin'] ?? []),
      apparentTemperatureMax: List<double?>.from(
        json['apparentTemperatureMax'] ?? [],
      ),
      apparentTemperatureMin: List<double?>.from(
        json['apparentTemperatureMin'] ?? [],
      ),
      windspeed10MMax: List<double?>.from(json['windspeed10MMax'] ?? []),
      windgusts10MMax: List<double?>.from(json['windgusts10MMax'] ?? []),
      uvIndexMax: List<double?>.from(json['uvIndexMax'] ?? []),
      rainSum: List<double?>.from(json['rainSum'] ?? []),
      winddirection10MDominant: List<int?>.from(
        json['winddirection10MDominant'] ?? [],
      ),
      precipitationSum: List<double?>.from(json['precipitationSum'] ?? []),
      precipitationProbabilityMax: List<int?>.from(
        json['precipitationProbabilityMax'] ?? [],
      ),
      sunrise: List<String>.from(json['sunrise'] ?? []),
      sunset: List<String>.from(json['sunset'] ?? []),
      lat: json['lat'],
      lon: json['lon'],
      city: json['city'],
      district: json['district'],
      timezone: json['timezone'],
      timestamp: json['timestamp'],
      index: json['index'],
    );
  }
}
