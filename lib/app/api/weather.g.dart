// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HourlyImpl _$$HourlyImplFromJson(Map<String, dynamic> json) => _$HourlyImpl(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      weatherCode: (json['weathercode'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      temperature2M: (json['temperature2M'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      apparentTemperature: (json['apparentTemperature'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      precipitation: (json['precipitation'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      rain: (json['rain'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      relativeHumidity2M: (json['relativehumidity2M'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      surfacePressure: (json['surfacePressure'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      visibility: (json['visibility'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      evapotranspiration: (json['evapotranspiration'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windSpeed10M: (json['windspeed10M'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      windDirection10M: (json['winddirection10M'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      windGusts10M: (json['windgusts10M'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      cloudCover: (json['cloudcover'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      uvIndex: (json['uvIndex'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      dewpoint2M: (json['dewpoint2M'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      precipitationProbability:
          (json['precipitationProbability'] as List<dynamic>?)
              ?.map((e) => e as int?)
              .toList(),
      shortwaveRadiation: (json['shortwaveRadiation'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
    );

Map<String, dynamic> _$$HourlyImplToJson(_$HourlyImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'weathercode': instance.weatherCode,
      'temperature2M': instance.temperature2M,
      'apparentTemperature': instance.apparentTemperature,
      'precipitation': instance.precipitation,
      'rain': instance.rain,
      'relativehumidity2M': instance.relativeHumidity2M,
      'surfacePressure': instance.surfacePressure,
      'visibility': instance.visibility,
      'evapotranspiration': instance.evapotranspiration,
      'windspeed10M': instance.windSpeed10M,
      'winddirection10M': instance.windDirection10M,
      'windgusts10M': instance.windGusts10M,
      'cloudcover': instance.cloudCover,
      'uvIndex': instance.uvIndex,
      'dewpoint2M': instance.dewpoint2M,
      'precipitationProbability': instance.precipitationProbability,
      'shortwaveRadiation': instance.shortwaveRadiation,
    };
