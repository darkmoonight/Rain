// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AirQualityDataApi _$AirQualityDataApiFromJson(Map<String, dynamic> json) =>
    _AirQualityDataApi(
      hourly: AirQualityHourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirQualityDataApiToJson(_AirQualityDataApi instance) =>
    <String, dynamic>{'hourly': instance.hourly};

_AirQualityHourly _$AirQualityHourlyFromJson(Map<String, dynamic> json) =>
    _AirQualityHourly(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      europeanAqi: (json['european_aqi'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      usAqi: (json['us_aqi'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      pm25: (json['pm2_5'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      pm10: (json['pm10'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      ozone: (json['ozone'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      co: (json['carbon_monoxide'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      no2: (json['nitrogen_dioxide'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
      so2: (json['sulphur_dioxide'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
    );

Map<String, dynamic> _$AirQualityHourlyToJson(_AirQualityHourly instance) =>
    <String, dynamic>{
      'time': instance.time,
      'european_aqi': instance.europeanAqi,
      'us_aqi': instance.usAqi,
      'pm2_5': instance.pm25,
      'pm10': instance.pm10,
      'ozone': instance.ozone,
      'carbon_monoxide': instance.co,
      'nitrogen_dioxide': instance.no2,
      'sulphur_dioxide': instance.so2,
    };
