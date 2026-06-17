import 'package:dio/dio.dart';
import 'package:rain/data/datasources/weather_remote_datasource.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/data/models/weather_api.dart';

String _fixtureIsoTime(int dayOffset, {int hour = 12}) =>
    '2026-06-${(5 + dayOffset).toString().padLeft(2, '0')}T${hour.toString().padLeft(2, '0')}:00';

/// Sample Open-Meteo forecast JSON for fake Dio responses.
Map<String, dynamic> sampleWeatherJson() => {
  'hourly': {
    'time': ['2026-06-05T12:00', '2026-06-05T13:00'],
    'weathercode': [0, 1],
    'temperature_2m': [20.0, 21.0],
    'relativehumidity_2m': [50, 55],
    'apparent_temperature': [19.0, 20.0],
    'precipitation': [0.0, 0.0],
    'rain': [0.0, 0.0],
    'surface_pressure': [1013.0, 1013.0],
    'visibility': [10000.0, 10000.0],
    'evapotranspiration': [0.1, 0.1],
    'windspeed_10m': [5.0, 6.0],
    'winddirection_10m': [180.0, 190.0],
    'windgusts_10m': [10.0, 11.0],
    'cloudcover': [20.0, 30.0],
    'uv_index': [3.0, 4.0],
    'dewpoint_2m': [10.0, 11.0],
    'precipitation_probability': [0, 10],
    'shortwave_radiation': [500.0, 520.0],
  },
  'daily': {
    'time': ['2026-06-05', '2026-06-06'],
    'weathercode': [0, 1],
    'temperature_2m_max': [25.0, 26.0],
    'temperature_2m_min': [15.0, 16.0],
    'apparent_temperature_max': [24.0, 25.0],
    'apparent_temperature_min': [14.0, 15.0],
    'sunrise': ['06:00', '06:01'],
    'sunset': ['18:00', '18:01'],
    'precipitation_sum': [0.0, 0.0],
    'precipitation_probability_max': [10, 20],
    'windspeed_10m_max': [15.0, 16.0],
    'windgusts_10m_max': [25.0, 26.0],
    'uv_index_max': [5.0, 6.0],
    'rain_sum': [0.0, 0.0],
    'winddirection_10m_dominant': [180, 190],
  },
  'timezone': 'Europe/Moscow',
  'utc_offset_seconds': 10800,
};

/// Sample Open-Meteo air quality JSON for fake Dio responses.
Map<String, dynamic> sampleAirQualityJson() => {
  'hourly': {
    'time': ['2026-06-05T12:00', '2026-06-05T13:00'],
    'european_aqi': [28.0, 32.0],
    'us_aqi': [45.0, 55.0],
    'pm2_5': [8.4, 9.1],
    'pm10': [12.0, 13.5],
    'ozone': [45.0, 48.0],
    'carbon_monoxide': [420.0, 510.0],
    'nitrogen_dioxide': [18.0, 22.0],
    'sulphur_dioxide': [5.0, 6.5],
  },
  'timezone': 'Europe/Moscow',
  'utc_offset_seconds': 10800,
};

/// Sample geocoding search JSON.
Map<String, dynamic> sampleCitySearchJson() => {
  'results': [
    {
      'admin1': 'Moscow Oblast',
      'name': 'Moscow',
      'latitude': 55.75,
      'longitude': 37.62,
    },
  ],
};

WeatherDataApi sampleWeatherApi() =>
    WeatherDataApi.fromJson(sampleWeatherJson());

/// A complete saved-city card with all required forecast fields.
WeatherCard completeWeatherCard({
  DateTime? timestamp,
  int? index,
  int id = 1,
}) => WeatherCard(
  time: ['2026-06-05T12:00', '2026-06-05T13:00'],
  timeDaily: [DateTime(2026, 6, 5), DateTime(2026, 6, 6)],
  sunrise: ['06:00', '06:01'],
  sunset: ['18:00', '18:01'],
  weathercode: [0, 1],
  temperature2M: [20.0, 21.0],
  apparentTemperature: [19.0, 20.0],
  relativehumidity2M: [50, 55],
  precipitation: [0.0, 0.0],
  rain: [0.0, 0.0],
  surfacePressure: [1013.0, 1013.0],
  visibility: [10000.0, 10000.0],
  evapotranspiration: [0.1, 0.1],
  windspeed10M: [5.0, 6.0],
  winddirection10M: [180, 190],
  windgusts10M: [10.0, 11.0],
  cloudcover: [20, 30],
  uvIndex: [3.0, 4.0],
  dewpoint2M: [10.0, 11.0],
  precipitationProbability: [0, 10],
  shortwaveRadiation: [500.0, 520.0],
  weathercodeDaily: [0, 1],
  temperature2MMax: [25.0, 26.0],
  temperature2MMin: [15.0, 16.0],
  apparentTemperatureMax: [24.0, 25.0],
  apparentTemperatureMin: [14.0, 15.0],
  windspeed10MMax: [15.0, 16.0],
  windgusts10MMax: [25.0, 26.0],
  uvIndexMax: [5.0, 6.0],
  rainSum: [0.0, 0.0],
  winddirection10MDominant: [180, 190],
  precipitationSum: [0.0, 0.0],
  precipitationProbabilityMax: [10, 20],
  city: 'Moscow',
  district: 'Moscow Oblast',
  timezone: 'Europe/Moscow',
  utcOffsetSeconds: 10800,
  clockSkewSeconds: 0,
  lat: 55.75,
  lon: 37.62,
  timestamp: timestamp ?? DateTime(2026, 6, 5, 12),
  index: index ?? 0,
)..id = id;

MainWeatherCache sampleMainWeatherCache() => MainWeatherCache(
  time: ['2026-06-05T12:00', '2026-06-05T13:00'],
  timeDaily: [DateTime(2026, 6, 5), DateTime(2026, 6, 6)],
  sunrise: ['06:00', '06:01'],
  sunset: ['18:00', '18:01'],
  weathercode: [0, 1],
  temperature2M: [20.0, 21.0],
  apparentTemperature: [19.0, 20.0],
  relativehumidity2M: [50, 55],
  precipitation: [0.0, 0.0],
  rain: [0.0, 0.0],
  surfacePressure: [1013.0, 1013.0],
  visibility: [10000.0, 10000.0],
  evapotranspiration: [0.1, 0.1],
  windspeed10M: [5.0, 6.0],
  winddirection10M: [180, 190],
  windgusts10M: [10.0, 11.0],
  cloudcover: [20, 30],
  uvIndex: [3.0, 4.0],
  dewpoint2M: [10.0, 11.0],
  precipitationProbability: [0, 10],
  shortwaveRadiation: [500.0, 520.0],
  weathercodeDaily: [0, 1],
  temperature2MMax: [25.0, 26.0],
  temperature2MMin: [15.0, 16.0],
  apparentTemperatureMax: [24.0, 25.0],
  apparentTemperatureMin: [14.0, 15.0],
  windspeed10MMax: [15.0, 16.0],
  windgusts10MMax: [25.0, 26.0],
  uvIndexMax: [5.0, 6.0],
  rainSum: [0.0, 0.0],
  winddirection10MDominant: [180, 190],
  precipitationSum: [0.0, 0.0],
  precipitationProbabilityMax: [10, 20],
  timezone: 'Europe/Moscow',
  utcOffsetSeconds: 10800,
  clockSkewSeconds: 0,
  timestamp: DateTime(2026, 6, 5, 12),
);

/// [sampleMainWeatherCache] with hourly rows guaranteed to be in the future.
MainWeatherCache sampleFutureMainWeatherCache() {
  final day = DateTime.now().add(const Duration(days: 2));
  final y = day.year;
  final m = day.month.toString().padLeft(2, '0');
  final d = day.day.toString().padLeft(2, '0');
  return sampleMainWeatherCache()
    ..time = ['$y-$m-${d}T12:00', '$y-$m-${d}T13:00']
    ..timeDaily = [DateTime(y, day.month, day.day)];
}

LocationCache sampleLocationCache() => LocationCache(
  lat: 55.75,
  lon: 37.62,
  city: 'Moscow',
  district: 'Moscow Oblast',
);

/// Main weather cache with seven daily entries for detail screens.
MainWeatherCache weeklyMainWeatherCache() {
  final base = sampleMainWeatherCache();
  List<T> repeat<T>(List<T> values, int count) =>
      List.generate(count, (i) => values[i % values.length]);

  return MainWeatherCache(
    time: List.generate(7, (i) => _fixtureIsoTime(i)),
    timeDaily: List.generate(7, (i) => DateTime(2026, 6, 5 + i)),
    sunrise: repeat(base.sunrise!, 7),
    sunset: repeat(base.sunset!, 7),
    weathercode: repeat(base.weathercode!, 7),
    temperature2M: repeat(base.temperature2M!, 7),
    apparentTemperature: repeat(base.apparentTemperature!, 7),
    relativehumidity2M: repeat(base.relativehumidity2M!, 7),
    precipitation: repeat(base.precipitation!, 7),
    rain: repeat(base.rain!, 7),
    surfacePressure: repeat(base.surfacePressure!, 7),
    visibility: repeat(base.visibility!, 7),
    evapotranspiration: repeat(base.evapotranspiration!, 7),
    windspeed10M: repeat(base.windspeed10M!, 7),
    winddirection10M: repeat(base.winddirection10M!, 7),
    windgusts10M: repeat(base.windgusts10M!, 7),
    cloudcover: repeat(base.cloudcover!, 7),
    uvIndex: repeat(base.uvIndex!, 7),
    dewpoint2M: repeat(base.dewpoint2M!, 7),
    precipitationProbability: repeat(base.precipitationProbability!, 7),
    shortwaveRadiation: repeat(base.shortwaveRadiation!, 7),
    weathercodeDaily: repeat(base.weathercodeDaily!, 7),
    temperature2MMax: repeat(base.temperature2MMax!, 7),
    temperature2MMin: repeat(base.temperature2MMin!, 7),
    apparentTemperatureMax: repeat(base.apparentTemperatureMax!, 7),
    apparentTemperatureMin: repeat(base.apparentTemperatureMin!, 7),
    windspeed10MMax: repeat(base.windspeed10MMax!, 7),
    windgusts10MMax: repeat(base.windgusts10MMax!, 7),
    uvIndexMax: repeat(base.uvIndexMax!, 7),
    rainSum: repeat(base.rainSum!, 7),
    winddirection10MDominant: repeat(base.winddirection10MDominant!, 7),
    precipitationSum: repeat(base.precipitationSum!, 7),
    precipitationProbabilityMax: repeat(base.precipitationProbabilityMax!, 7),
    timezone: base.timezone,
    timestamp: base.timestamp,
  );
}

/// Weather card with seven days and 24 hourly slots per day for [DailyCardInfo].
WeatherCard dailyDetailWeatherCard() {
  final base = completeWeatherCard();
  List<T> repeat<T>(List<T> values, int count) =>
      List.generate(count, (i) => values[i % values.length]);

  const hours = 24 * 7;
  return WeatherCard(
    time: List.generate(hours, (i) {
      final day = i ~/ 24;
      final hour = i % 24;
      return _fixtureIsoTime(day, hour: hour);
    }),
    timeDaily: List.generate(7, (i) => DateTime(2026, 6, 5 + i)),
    sunrise: repeat(base.sunrise!, 7),
    sunset: repeat(base.sunset!, 7),
    weathercode: repeat(base.weathercode!, hours),
    temperature2M: repeat(base.temperature2M!, hours),
    apparentTemperature: repeat(base.apparentTemperature!, hours),
    relativehumidity2M: repeat(base.relativehumidity2M!, hours),
    precipitation: repeat(base.precipitation!, hours),
    rain: repeat(base.rain!, hours),
    surfacePressure: repeat(base.surfacePressure!, hours),
    visibility: repeat(base.visibility!, hours),
    evapotranspiration: repeat(base.evapotranspiration!, hours),
    windspeed10M: repeat(base.windspeed10M!, hours),
    winddirection10M: repeat(base.winddirection10M!, hours),
    windgusts10M: repeat(base.windgusts10M!, hours),
    cloudcover: repeat(base.cloudcover!, hours),
    uvIndex: repeat(base.uvIndex!, hours),
    dewpoint2M: repeat(base.dewpoint2M!, hours),
    precipitationProbability: repeat(base.precipitationProbability!, hours),
    shortwaveRadiation: repeat(base.shortwaveRadiation!, hours),
    weathercodeDaily: repeat(base.weathercodeDaily!, 7),
    temperature2MMax: repeat(base.temperature2MMax!, 7),
    temperature2MMin: repeat(base.temperature2MMin!, 7),
    apparentTemperatureMax: repeat(base.apparentTemperatureMax!, 7),
    apparentTemperatureMin: repeat(base.apparentTemperatureMin!, 7),
    windspeed10MMax: repeat(base.windspeed10MMax!, 7),
    windgusts10MMax: repeat(base.windgusts10MMax!, 7),
    uvIndexMax: repeat(base.uvIndexMax!, 7),
    rainSum: repeat(base.rainSum!, 7),
    winddirection10MDominant: repeat(base.winddirection10MDominant!, 7),
    precipitationSum: repeat(base.precipitationSum!, 7),
    precipitationProbabilityMax: repeat(base.precipitationProbabilityMax!, 7),
    city: base.city,
    district: base.district,
    timezone: base.timezone,
    lat: base.lat,
    lon: base.lon,
    timestamp: base.timestamp,
    index: base.index,
  )..id = base.id;
}

/// Weather card with seven daily entries for preview widgets.
WeatherCard weeklyWeatherCard() {
  final base = completeWeatherCard();
  List<T> repeat<T>(List<T> values, int count) =>
      List.generate(count, (i) => values[i % values.length]);

  return WeatherCard(
    time: List.generate(7, (i) => _fixtureIsoTime(i)),
    timeDaily: List.generate(7, (i) => DateTime(2026, 6, 5 + i)),
    sunrise: repeat(base.sunrise!, 7),
    sunset: repeat(base.sunset!, 7),
    weathercode: repeat(base.weathercode!, 7),
    temperature2M: repeat(base.temperature2M!, 7),
    apparentTemperature: repeat(base.apparentTemperature!, 7),
    relativehumidity2M: repeat(base.relativehumidity2M!, 7),
    precipitation: repeat(base.precipitation!, 7),
    rain: repeat(base.rain!, 7),
    surfacePressure: repeat(base.surfacePressure!, 7),
    visibility: repeat(base.visibility!, 7),
    evapotranspiration: repeat(base.evapotranspiration!, 7),
    windspeed10M: repeat(base.windspeed10M!, 7),
    winddirection10M: repeat(base.winddirection10M!, 7),
    windgusts10M: repeat(base.windgusts10M!, 7),
    cloudcover: repeat(base.cloudcover!, 7),
    uvIndex: repeat(base.uvIndex!, 7),
    dewpoint2M: repeat(base.dewpoint2M!, 7),
    precipitationProbability: repeat(base.precipitationProbability!, 7),
    shortwaveRadiation: repeat(base.shortwaveRadiation!, 7),
    weathercodeDaily: repeat(base.weathercodeDaily!, 7),
    temperature2MMax: repeat(base.temperature2MMax!, 7),
    temperature2MMin: repeat(base.temperature2MMin!, 7),
    apparentTemperatureMax: repeat(base.apparentTemperatureMax!, 7),
    apparentTemperatureMin: repeat(base.apparentTemperatureMin!, 7),
    windspeed10MMax: repeat(base.windspeed10MMax!, 7),
    windgusts10MMax: repeat(base.windgusts10MMax!, 7),
    uvIndexMax: repeat(base.uvIndexMax!, 7),
    rainSum: repeat(base.rainSum!, 7),
    winddirection10MDominant: repeat(base.winddirection10MDominant!, 7),
    precipitationSum: repeat(base.precipitationSum!, 7),
    precipitationProbabilityMax: repeat(base.precipitationProbabilityMax!, 7),
    city: base.city,
    district: base.district,
    timezone: base.timezone,
    lat: base.lat,
    lon: base.lon,
    timestamp: base.timestamp,
    index: base.index,
  )..id = base.id;
}

Settings onboardedSettings({
  bool location = false,
  bool hideMap = true,
  bool largeElement = false,
  bool roundDegree = false,
}) => Settings()
  ..onboard = true
  ..location = location
  ..hideMap = hideMap
  ..largeElement = largeElement
  ..roundDegree = roundDegree
  ..theme = 'system'
  ..language = 'en';

/// Creates a [WeatherRemoteDatasource] with fake weather and geocoding responses.
///
/// Always use this in tests instead of [WeatherRemoteDatasource] with a single Dio:
/// production uses separate clients for forecast and geocoding.
WeatherRemoteDatasource createFakeWeatherRemoteDatasource({
  Map<String, dynamic>? weatherJson,
  Map<String, dynamic>? cityJson,
  Map<String, dynamic>? airQualityJson,
}) {
  final dio = createFakeWeatherDio(
    weatherJson: weatherJson,
    cityJson: cityJson,
    airQualityJson: airQualityJson,
  );
  return WeatherRemoteDatasource(dio: dio, dioLocation: dio);
}

/// Creates a [Dio] instance that returns fixture JSON for weather and geocoding.
Dio createFakeWeatherDio({
  Map<String, dynamic>? weatherJson,
  Map<String, dynamic>? cityJson,
  Map<String, dynamic>? airQualityJson,
}) {
  final dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final host = options.uri.host;
        final Map<String, dynamic> data;
        if (host.contains('geocoding')) {
          data = cityJson ?? sampleCitySearchJson();
        } else if (host.contains('air-quality')) {
          data = airQualityJson ?? sampleAirQualityJson();
        } else {
          data = weatherJson ?? sampleWeatherJson();
        }
        handler.resolve(
          Response(requestOptions: options, data: data, statusCode: 200),
        );
      },
    ),
  );
  return dio;
}
