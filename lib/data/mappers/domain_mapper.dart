import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';
import 'package:rain/domain/entities/entities.dart';

/// Maps between Isar persistence models and domain entities.
class DomainMapper {
  DomainMapper._();

  static AppSettings settingsToDomain(Settings s) => AppSettings(
    onboard: s.onboard,
    theme: s.theme,
    location: s.location,
    notifications: s.notifications,
    notificationSound: s.notificationSound,
    notificationWeekdaysMask: s.notificationWeekdaysMask,
    persistentNotification: s.persistentNotification,
    materialColor: s.materialColor,
    colorPalette: s.colorPalette,
    amoledTheme: s.amoledTheme,
    roundDegree: s.roundDegree,
    largeElement: s.largeElement,
    hideMap: s.hideMap,
    widgetBackgroundColor: s.widgetBackgroundColor,
    widgetTextColor: s.widgetTextColor,
    widgetBackgroundColorLight: s.widgetBackgroundColorLight,
    widgetBackgroundColorDark: s.widgetBackgroundColorDark,
    widgetTextColorLight: s.widgetTextColorLight,
    widgetTextColorDark: s.widgetTextColorDark,
    measurements: s.measurements,
    degrees: s.degrees,
    wind: s.wind,
    pressure: s.pressure,
    timeformat: s.timeformat,
    appFont: s.appFont,
    weatherIconTheme: s.weatherIconTheme,
    aqiStandard: s.aqiStandard,
    language: s.language,
    timeRange: s.timeRange,
    timeStart: s.timeStart,
    timeEnd: s.timeEnd,
    weatherCacheVersion: s.weatherCacheVersion,
    notificationChannelVersion: s.notificationChannelVersion,
    clockSkewSeconds: s.clockSkewSeconds,
  );

  static void applySettingsToIsar(AppSettings e, Settings s) {
    s.onboard = e.onboard;
    s.theme = e.theme;
    s.location = e.location;
    s.notifications = e.notifications;
    s.notificationSound = e.notificationSound;
    s.notificationWeekdaysMask = e.notificationWeekdaysMask;
    s.persistentNotification = e.persistentNotification;
    s.materialColor = e.materialColor;
    s.colorPalette = e.colorPalette;
    s.amoledTheme = e.amoledTheme;
    s.roundDegree = e.roundDegree;
    s.largeElement = e.largeElement;
    s.hideMap = e.hideMap;
    s.widgetBackgroundColor = e.widgetBackgroundColor;
    s.widgetTextColor = e.widgetTextColor;
    s.widgetBackgroundColorLight = e.widgetBackgroundColorLight;
    s.widgetBackgroundColorDark = e.widgetBackgroundColorDark;
    s.widgetTextColorLight = e.widgetTextColorLight;
    s.widgetTextColorDark = e.widgetTextColorDark;
    s.measurements = e.measurements;
    s.degrees = e.degrees;
    s.wind = e.wind;
    s.pressure = e.pressure;
    s.timeformat = e.timeformat;
    s.appFont = e.appFont;
    s.weatherIconTheme = e.weatherIconTheme;
    s.aqiStandard = e.aqiStandard;
    s.language = e.language;
    s.timeRange = e.timeRange;
    s.timeStart = e.timeStart;
    s.timeEnd = e.timeEnd;
    s.weatherCacheVersion = e.weatherCacheVersion;
    s.notificationChannelVersion = e.notificationChannelVersion;
    s.clockSkewSeconds = e.clockSkewSeconds;
  }

  static Settings settingsToIsar(AppSettings e, {Settings? existing}) {
    final s = existing ?? Settings();
    applySettingsToIsar(e, s);
    return s;
  }

  static WeatherForecast forecastToDomain(MainWeatherCache c) =>
      WeatherForecast(
        time: c.time,
        weathercode: c.weathercode,
        temperature2M: c.temperature2M,
        apparentTemperature: c.apparentTemperature,
        relativehumidity2M: c.relativehumidity2M,
        precipitation: c.precipitation,
        rain: c.rain,
        surfacePressure: c.surfacePressure,
        visibility: c.visibility,
        evapotranspiration: c.evapotranspiration,
        windspeed10M: c.windspeed10M,
        winddirection10M: c.winddirection10M,
        windgusts10M: c.windgusts10M,
        cloudcover: c.cloudcover,
        uvIndex: c.uvIndex,
        dewpoint2M: c.dewpoint2M,
        precipitationProbability: c.precipitationProbability,
        shortwaveRadiation: c.shortwaveRadiation,
        europeanAqi: c.europeanAqi,
        usAqi: c.usAqi,
        pm25: c.pm25,
        pm10: c.pm10,
        ozone: c.ozone,
        co: c.co,
        no2: c.no2,
        so2: c.so2,
        timeDaily: c.timeDaily,
        weathercodeDaily: c.weathercodeDaily,
        temperature2MMax: c.temperature2MMax,
        temperature2MMin: c.temperature2MMin,
        apparentTemperatureMax: c.apparentTemperatureMax,
        apparentTemperatureMin: c.apparentTemperatureMin,
        sunrise: c.sunrise,
        sunset: c.sunset,
        precipitationSum: c.precipitationSum,
        precipitationProbabilityMax: c.precipitationProbabilityMax,
        windspeed10MMax: c.windspeed10MMax,
        windgusts10MMax: c.windgusts10MMax,
        uvIndexMax: c.uvIndexMax,
        rainSum: c.rainSum,
        winddirection10MDominant: c.winddirection10MDominant,
        timezone: c.timezone,
        utcOffsetSeconds: c.utcOffsetSeconds,
        clockSkewSeconds: c.clockSkewSeconds,
        timestamp: c.timestamp,
      );

  static MainWeatherCache forecastToIsar(
    WeatherForecast e, {
    MainWeatherCache? existing,
  }) {
    final c = existing ?? MainWeatherCache();
    c.time = e.time;
    c.weathercode = e.weathercode;
    c.temperature2M = e.temperature2M;
    c.apparentTemperature = e.apparentTemperature;
    c.relativehumidity2M = e.relativehumidity2M;
    c.precipitation = e.precipitation;
    c.rain = e.rain;
    c.surfacePressure = e.surfacePressure;
    c.visibility = e.visibility;
    c.evapotranspiration = e.evapotranspiration;
    c.windspeed10M = e.windspeed10M;
    c.winddirection10M = e.winddirection10M;
    c.windgusts10M = e.windgusts10M;
    c.cloudcover = e.cloudcover;
    c.uvIndex = e.uvIndex;
    c.dewpoint2M = e.dewpoint2M;
    c.precipitationProbability = e.precipitationProbability;
    c.shortwaveRadiation = e.shortwaveRadiation;
    c.europeanAqi = e.europeanAqi;
    c.usAqi = e.usAqi;
    c.pm25 = e.pm25;
    c.pm10 = e.pm10;
    c.ozone = e.ozone;
    c.co = e.co;
    c.no2 = e.no2;
    c.so2 = e.so2;
    c.timeDaily = e.timeDaily;
    c.weathercodeDaily = e.weathercodeDaily;
    c.temperature2MMax = e.temperature2MMax;
    c.temperature2MMin = e.temperature2MMin;
    c.apparentTemperatureMax = e.apparentTemperatureMax;
    c.apparentTemperatureMin = e.apparentTemperatureMin;
    c.sunrise = e.sunrise;
    c.sunset = e.sunset;
    c.precipitationSum = e.precipitationSum;
    c.precipitationProbabilityMax = e.precipitationProbabilityMax;
    c.windspeed10MMax = e.windspeed10MMax;
    c.windgusts10MMax = e.windgusts10MMax;
    c.uvIndexMax = e.uvIndexMax;
    c.rainSum = e.rainSum;
    c.winddirection10MDominant = e.winddirection10MDominant;
    c.timezone = e.timezone;
    c.utcOffsetSeconds = e.utcOffsetSeconds;
    c.clockSkewSeconds = e.clockSkewSeconds;
    c.timestamp = e.timestamp;
    return c;
  }

  static GeoPlace placeToDomain(LocationCache c) =>
      GeoPlace(lat: c.lat, lon: c.lon, city: c.city, district: c.district);

  static LocationCache placeToIsar(GeoPlace e, {LocationCache? existing}) {
    final c = existing ?? LocationCache();
    c.lat = e.lat;
    c.lon = e.lon;
    c.city = e.city;
    c.district = e.district;
    return c;
  }

  static void applyPlaceToIsar(GeoPlace e, LocationCache c) {
    c.lat = e.lat;
    c.lon = e.lon;
    c.city = e.city;
    c.district = e.district;
  }

  static SavedPlace cardToDomain(WeatherCard c) => SavedPlace(
    time: c.time,
    weathercode: c.weathercode,
    temperature2M: c.temperature2M,
    apparentTemperature: c.apparentTemperature,
    relativehumidity2M: c.relativehumidity2M,
    precipitation: c.precipitation,
    rain: c.rain,
    surfacePressure: c.surfacePressure,
    visibility: c.visibility,
    evapotranspiration: c.evapotranspiration,
    windspeed10M: c.windspeed10M,
    winddirection10M: c.winddirection10M,
    windgusts10M: c.windgusts10M,
    cloudcover: c.cloudcover,
    uvIndex: c.uvIndex,
    dewpoint2M: c.dewpoint2M,
    precipitationProbability: c.precipitationProbability,
    shortwaveRadiation: c.shortwaveRadiation,
    europeanAqi: c.europeanAqi,
    usAqi: c.usAqi,
    pm25: c.pm25,
    pm10: c.pm10,
    ozone: c.ozone,
    co: c.co,
    no2: c.no2,
    so2: c.so2,
    timeDaily: c.timeDaily,
    weathercodeDaily: c.weathercodeDaily,
    temperature2MMax: c.temperature2MMax,
    temperature2MMin: c.temperature2MMin,
    apparentTemperatureMax: c.apparentTemperatureMax,
    apparentTemperatureMin: c.apparentTemperatureMin,
    sunrise: c.sunrise,
    sunset: c.sunset,
    precipitationSum: c.precipitationSum,
    precipitationProbabilityMax: c.precipitationProbabilityMax,
    windspeed10MMax: c.windspeed10MMax,
    windgusts10MMax: c.windgusts10MMax,
    uvIndexMax: c.uvIndexMax,
    rainSum: c.rainSum,
    winddirection10MDominant: c.winddirection10MDominant,
    timezone: c.timezone,
    utcOffsetSeconds: c.utcOffsetSeconds,
    clockSkewSeconds: c.clockSkewSeconds,
    timestamp: c.timestamp,
    lat: c.lat,
    lon: c.lon,
    city: c.city,
    district: c.district,
    index: c.index,
    id: c.id == Isar.autoIncrement ? null : c.id,
  );

  static WeatherCard cardToIsar(SavedPlace e, {WeatherCard? existing}) {
    final c = existing ?? WeatherCard();
    c.time = e.time;
    c.weathercode = e.weathercode;
    c.temperature2M = e.temperature2M;
    c.apparentTemperature = e.apparentTemperature;
    c.relativehumidity2M = e.relativehumidity2M;
    c.precipitation = e.precipitation;
    c.rain = e.rain;
    c.surfacePressure = e.surfacePressure;
    c.visibility = e.visibility;
    c.evapotranspiration = e.evapotranspiration;
    c.windspeed10M = e.windspeed10M;
    c.winddirection10M = e.winddirection10M;
    c.windgusts10M = e.windgusts10M;
    c.cloudcover = e.cloudcover;
    c.uvIndex = e.uvIndex;
    c.dewpoint2M = e.dewpoint2M;
    c.precipitationProbability = e.precipitationProbability;
    c.shortwaveRadiation = e.shortwaveRadiation;
    c.europeanAqi = e.europeanAqi;
    c.usAqi = e.usAqi;
    c.pm25 = e.pm25;
    c.pm10 = e.pm10;
    c.ozone = e.ozone;
    c.co = e.co;
    c.no2 = e.no2;
    c.so2 = e.so2;
    c.timeDaily = e.timeDaily;
    c.weathercodeDaily = e.weathercodeDaily;
    c.temperature2MMax = e.temperature2MMax;
    c.temperature2MMin = e.temperature2MMin;
    c.apparentTemperatureMax = e.apparentTemperatureMax;
    c.apparentTemperatureMin = e.apparentTemperatureMin;
    c.sunrise = e.sunrise;
    c.sunset = e.sunset;
    c.precipitationSum = e.precipitationSum;
    c.precipitationProbabilityMax = e.precipitationProbabilityMax;
    c.windspeed10MMax = e.windspeed10MMax;
    c.windgusts10MMax = e.windgusts10MMax;
    c.uvIndexMax = e.uvIndexMax;
    c.rainSum = e.rainSum;
    c.winddirection10MDominant = e.winddirection10MDominant;
    c.timezone = e.timezone;
    c.utcOffsetSeconds = e.utcOffsetSeconds;
    c.clockSkewSeconds = e.clockSkewSeconds;
    c.timestamp = e.timestamp;
    c.lat = e.lat;
    c.lon = e.lon;
    c.city = e.city;
    c.district = e.district;
    c.index = e.index;
    if (e.id != null) c.id = e.id!;
    return c;
  }

  static SavedPlace savedFromForecast(
    WeatherForecast forecast, {
    double? lat,
    double? lon,
    String? city,
    String? district,
  }) => SavedPlace.fromForecast(
    forecast,
    lat: lat,
    lon: lon,
    city: city,
    district: district,
  );

  /// Returns [source] forecast fields with identity/location from [target].
  static SavedPlace mergeSavedPlaceForecast(
    SavedPlace target,
    SavedPlace source,
  ) => SavedPlace.fromForecast(
    WeatherForecast(
      time: source.time,
      weathercode: source.weathercode,
      temperature2M: source.temperature2M,
      apparentTemperature: source.apparentTemperature,
      relativehumidity2M: source.relativehumidity2M,
      precipitation: source.precipitation,
      rain: source.rain,
      surfacePressure: source.surfacePressure,
      visibility: source.visibility,
      evapotranspiration: source.evapotranspiration,
      windspeed10M: source.windspeed10M,
      winddirection10M: source.winddirection10M,
      windgusts10M: source.windgusts10M,
      cloudcover: source.cloudcover,
      uvIndex: source.uvIndex,
      dewpoint2M: source.dewpoint2M,
      precipitationProbability: source.precipitationProbability,
      shortwaveRadiation: source.shortwaveRadiation,
      europeanAqi: source.europeanAqi,
      usAqi: source.usAqi,
      pm25: source.pm25,
      pm10: source.pm10,
      ozone: source.ozone,
      co: source.co,
      no2: source.no2,
      so2: source.so2,
      timeDaily: source.timeDaily,
      weathercodeDaily: source.weathercodeDaily,
      temperature2MMax: source.temperature2MMax,
      temperature2MMin: source.temperature2MMin,
      apparentTemperatureMax: source.apparentTemperatureMax,
      apparentTemperatureMin: source.apparentTemperatureMin,
      sunrise: source.sunrise,
      sunset: source.sunset,
      precipitationSum: source.precipitationSum,
      precipitationProbabilityMax: source.precipitationProbabilityMax,
      windspeed10MMax: source.windspeed10MMax,
      windgusts10MMax: source.windgusts10MMax,
      uvIndexMax: source.uvIndexMax,
      rainSum: source.rainSum,
      winddirection10MDominant: source.winddirection10MDominant,
      timezone: source.timezone,
      utcOffsetSeconds: source.utcOffsetSeconds,
      clockSkewSeconds: source.clockSkewSeconds,
      timestamp: source.timestamp,
    ),
    lat: target.lat,
    lon: target.lon,
    city: target.city,
    district: target.district,
  ).copyWith(id: target.id, index: target.index);
}
