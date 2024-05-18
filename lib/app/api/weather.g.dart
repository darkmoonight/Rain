// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataApiImpl _$$WeatherDataApiImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataApiImpl(
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
      daily: Daily.fromJson(json['daily'] as Map<String, dynamic>),
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$$WeatherDataApiImplToJson(
        _$WeatherDataApiImpl instance) =>
    <String, dynamic>{
      'hourly': instance.hourly,
      'daily': instance.daily,
      'timezone': instance.timezone,
    };

_$HourlyImpl _$$HourlyImplFromJson(Map<String, dynamic> json) => _$HourlyImpl(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      weatherCode: (json['weathercode'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      temperature2M: (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      apparentTemperature: (json['apparent_temperature'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      precipitation: (json['precipitation'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      rain: (json['rain'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      relativeHumidity2M: (json['relativehumidity_2m'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      surfacePressure: (json['surface_pressure'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      visibility: (json['visibility'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      evapotranspiration: (json['evapotranspiration'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windSpeed10M: (json['windspeed_10m'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windDirection10M: (json['winddirection_10m'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      windGusts10M: (json['windgusts_10m'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      cloudCover: (json['cloudcover'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      uvIndex: (json['uv_index'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      dewpoint2M: (json['dewpoint_2m'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      precipitationProbability:
          (json['precipitation_probability'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toInt())
              .toList(),
      shortwaveRadiation: (json['shortwave_radiation'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
    );

Map<String, dynamic> _$$HourlyImplToJson(_$HourlyImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weathercode': instance.weatherCode,
      'temperature_2m': instance.temperature2M,
      'apparent_temperature': instance.apparentTemperature,
      'precipitation': instance.precipitation,
      'rain': instance.rain,
      'relativehumidity_2m': instance.relativeHumidity2M,
      'surface_pressure': instance.surfacePressure,
      'visibility': instance.visibility,
      'evapotranspiration': instance.evapotranspiration,
      'windspeed_10m': instance.windSpeed10M,
      'winddirection_10m': instance.windDirection10M,
      'windgusts_10m': instance.windGusts10M,
      'cloudcover': instance.cloudCover,
      'uv_index': instance.uvIndex,
      'dewpoint_2m': instance.dewpoint2M,
      'precipitation_probability': instance.precipitationProbability,
      'shortwave_radiation': instance.shortwaveRadiation,
    };

_$DailyImpl _$$DailyImplFromJson(Map<String, dynamic> json) => _$DailyImpl(
      time: _dateTimeFromJson(json['time'] as List?),
      weatherCode: (json['weathercode'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toInt())
          .toList(),
      temperature2MMax: (json['temperature_2m_max'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      temperature2MMin: (json['temperature_2m_min'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      apparentTemperatureMax:
          (json['apparent_temperature_max'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toDouble())
              .toList(),
      apparentTemperatureMin:
          (json['apparent_temperature_min'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toDouble())
              .toList(),
      precipitationSum: (json['precipitation_sum'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      sunrise:
          (json['sunrise'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sunset:
          (json['sunset'] as List<dynamic>?)?.map((e) => e as String).toList(),
      precipitationProbabilityMax:
          (json['precipitation_probability_max'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toInt())
              .toList(),
      windSpeed10MMax: (json['windspeed_10m_max'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windGusts10MMax: (json['windgusts_10m_max'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      uvIndexMax: (json['uv_index_max'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      rainSum: (json['rain_sum'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windDirection10MDominant:
          (json['winddirection_10m_dominant'] as List<dynamic>?)
              ?.map((e) => (e as num?)?.toInt())
              .toList(),
    );

Map<String, dynamic> _$$DailyImplToJson(_$DailyImpl instance) =>
    <String, dynamic>{
      'time': instance.time?.map((e) => e.toIso8601String()).toList(),
      'weathercode': instance.weatherCode,
      'temperature_2m_max': instance.temperature2MMax,
      'temperature_2m_min': instance.temperature2MMin,
      'apparent_temperature_max': instance.apparentTemperatureMax,
      'apparent_temperature_min': instance.apparentTemperatureMin,
      'precipitation_sum': instance.precipitationSum,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'precipitation_probability_max': instance.precipitationProbabilityMax,
      'windspeed_10m_max': instance.windSpeed10MMax,
      'windgusts_10m_max': instance.windGusts10MMax,
      'uv_index_max': instance.uvIndexMax,
      'rain_sum': instance.rainSum,
      'winddirection_10m_dominant': instance.windDirection10MDominant,
    };
