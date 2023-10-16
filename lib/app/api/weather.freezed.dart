// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return _Hourly.fromJson(json);
}

/// @nodoc
mixin _$Hourly {
  List<String>? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'weathercode')
  List<int>? get weatherCode => throw _privateConstructorUsedError;
  List<double>? get temperature2M => throw _privateConstructorUsedError;
  List<double?>? get apparentTemperature => throw _privateConstructorUsedError;
  List<double?>? get precipitation => throw _privateConstructorUsedError;
  List<double?>? get rain => throw _privateConstructorUsedError;
  @JsonKey(name: 'relativehumidity2M')
  List<int?>? get relativeHumidity2M => throw _privateConstructorUsedError;
  List<double?>? get surfacePressure => throw _privateConstructorUsedError;
  List<double?>? get visibility => throw _privateConstructorUsedError;
  List<double?>? get evapotranspiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'windspeed10M')
  List<double?>? get windSpeed10M => throw _privateConstructorUsedError;
  @JsonKey(name: 'winddirection10M')
  List<int?>? get windDirection10M => throw _privateConstructorUsedError;
  @JsonKey(name: 'windgusts10M')
  List<double?>? get windGusts10M => throw _privateConstructorUsedError;
  @JsonKey(name: 'cloudcover')
  List<int?>? get cloudCover => throw _privateConstructorUsedError;
  List<double?>? get uvIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'dewpoint2M')
  List<double?>? get dewpoint2M => throw _privateConstructorUsedError;
  List<int?>? get precipitationProbability =>
      throw _privateConstructorUsedError;
  List<double?>? get shortwaveRadiation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HourlyCopyWith<Hourly> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyCopyWith<$Res> {
  factory $HourlyCopyWith(Hourly value, $Res Function(Hourly) then) =
      _$HourlyCopyWithImpl<$Res, Hourly>;
  @useResult
  $Res call(
      {List<String>? time,
      @JsonKey(name: 'weathercode') List<int>? weatherCode,
      List<double>? temperature2M,
      List<double?>? apparentTemperature,
      List<double?>? precipitation,
      List<double?>? rain,
      @JsonKey(name: 'relativehumidity2M') List<int?>? relativeHumidity2M,
      List<double?>? surfacePressure,
      List<double?>? visibility,
      List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed10M') List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection10M') List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts10M') List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') List<int?>? cloudCover,
      List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint2M') List<double?>? dewpoint2M,
      List<int?>? precipitationProbability,
      List<double?>? shortwaveRadiation});
}

/// @nodoc
class _$HourlyCopyWithImpl<$Res, $Val extends Hourly>
    implements $HourlyCopyWith<$Res> {
  _$HourlyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? weatherCode = freezed,
    Object? temperature2M = freezed,
    Object? apparentTemperature = freezed,
    Object? precipitation = freezed,
    Object? rain = freezed,
    Object? relativeHumidity2M = freezed,
    Object? surfacePressure = freezed,
    Object? visibility = freezed,
    Object? evapotranspiration = freezed,
    Object? windSpeed10M = freezed,
    Object? windDirection10M = freezed,
    Object? windGusts10M = freezed,
    Object? cloudCover = freezed,
    Object? uvIndex = freezed,
    Object? dewpoint2M = freezed,
    Object? precipitationProbability = freezed,
    Object? shortwaveRadiation = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weatherCode: freezed == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      temperature2M: freezed == temperature2M
          ? _value.temperature2M
          : temperature2M // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      apparentTemperature: freezed == apparentTemperature
          ? _value.apparentTemperature
          : apparentTemperature // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      precipitation: freezed == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      relativeHumidity2M: freezed == relativeHumidity2M
          ? _value.relativeHumidity2M
          : relativeHumidity2M // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      surfacePressure: freezed == surfacePressure
          ? _value.surfacePressure
          : surfacePressure // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      visibility: freezed == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      evapotranspiration: freezed == evapotranspiration
          ? _value.evapotranspiration
          : evapotranspiration // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windSpeed10M: freezed == windSpeed10M
          ? _value.windSpeed10M
          : windSpeed10M // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windDirection10M: freezed == windDirection10M
          ? _value.windDirection10M
          : windDirection10M // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      windGusts10M: freezed == windGusts10M
          ? _value.windGusts10M
          : windGusts10M // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      cloudCover: freezed == cloudCover
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      uvIndex: freezed == uvIndex
          ? _value.uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      dewpoint2M: freezed == dewpoint2M
          ? _value.dewpoint2M
          : dewpoint2M // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      precipitationProbability: freezed == precipitationProbability
          ? _value.precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      shortwaveRadiation: freezed == shortwaveRadiation
          ? _value.shortwaveRadiation
          : shortwaveRadiation // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyImplCopyWith<$Res> implements $HourlyCopyWith<$Res> {
  factory _$$HourlyImplCopyWith(
          _$HourlyImpl value, $Res Function(_$HourlyImpl) then) =
      __$$HourlyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String>? time,
      @JsonKey(name: 'weathercode') List<int>? weatherCode,
      List<double>? temperature2M,
      List<double?>? apparentTemperature,
      List<double?>? precipitation,
      List<double?>? rain,
      @JsonKey(name: 'relativehumidity2M') List<int?>? relativeHumidity2M,
      List<double?>? surfacePressure,
      List<double?>? visibility,
      List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed10M') List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection10M') List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts10M') List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') List<int?>? cloudCover,
      List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint2M') List<double?>? dewpoint2M,
      List<int?>? precipitationProbability,
      List<double?>? shortwaveRadiation});
}

/// @nodoc
class __$$HourlyImplCopyWithImpl<$Res>
    extends _$HourlyCopyWithImpl<$Res, _$HourlyImpl>
    implements _$$HourlyImplCopyWith<$Res> {
  __$$HourlyImplCopyWithImpl(
      _$HourlyImpl _value, $Res Function(_$HourlyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? weatherCode = freezed,
    Object? temperature2M = freezed,
    Object? apparentTemperature = freezed,
    Object? precipitation = freezed,
    Object? rain = freezed,
    Object? relativeHumidity2M = freezed,
    Object? surfacePressure = freezed,
    Object? visibility = freezed,
    Object? evapotranspiration = freezed,
    Object? windSpeed10M = freezed,
    Object? windDirection10M = freezed,
    Object? windGusts10M = freezed,
    Object? cloudCover = freezed,
    Object? uvIndex = freezed,
    Object? dewpoint2M = freezed,
    Object? precipitationProbability = freezed,
    Object? shortwaveRadiation = freezed,
  }) {
    return _then(_$HourlyImpl(
      time: freezed == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      weatherCode: freezed == weatherCode
          ? _value._weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      temperature2M: freezed == temperature2M
          ? _value._temperature2M
          : temperature2M // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      apparentTemperature: freezed == apparentTemperature
          ? _value._apparentTemperature
          : apparentTemperature // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      precipitation: freezed == precipitation
          ? _value._precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      rain: freezed == rain
          ? _value._rain
          : rain // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      relativeHumidity2M: freezed == relativeHumidity2M
          ? _value._relativeHumidity2M
          : relativeHumidity2M // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      surfacePressure: freezed == surfacePressure
          ? _value._surfacePressure
          : surfacePressure // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      visibility: freezed == visibility
          ? _value._visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      evapotranspiration: freezed == evapotranspiration
          ? _value._evapotranspiration
          : evapotranspiration // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windSpeed10M: freezed == windSpeed10M
          ? _value._windSpeed10M
          : windSpeed10M // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windDirection10M: freezed == windDirection10M
          ? _value._windDirection10M
          : windDirection10M // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      windGusts10M: freezed == windGusts10M
          ? _value._windGusts10M
          : windGusts10M // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      cloudCover: freezed == cloudCover
          ? _value._cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      uvIndex: freezed == uvIndex
          ? _value._uvIndex
          : uvIndex // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      dewpoint2M: freezed == dewpoint2M
          ? _value._dewpoint2M
          : dewpoint2M // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      precipitationProbability: freezed == precipitationProbability
          ? _value._precipitationProbability
          : precipitationProbability // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      shortwaveRadiation: freezed == shortwaveRadiation
          ? _value._shortwaveRadiation
          : shortwaveRadiation // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyImpl implements _Hourly {
  const _$HourlyImpl(
      {final List<String>? time,
      @JsonKey(name: 'weathercode') final List<int>? weatherCode,
      final List<double>? temperature2M,
      final List<double?>? apparentTemperature,
      final List<double?>? precipitation,
      final List<double?>? rain,
      @JsonKey(name: 'relativehumidity2M') final List<int?>? relativeHumidity2M,
      final List<double?>? surfacePressure,
      final List<double?>? visibility,
      final List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed10M') final List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection10M') final List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts10M') final List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') final List<int?>? cloudCover,
      final List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint2M') final List<double?>? dewpoint2M,
      final List<int?>? precipitationProbability,
      final List<double?>? shortwaveRadiation})
      : _time = time,
        _weatherCode = weatherCode,
        _temperature2M = temperature2M,
        _apparentTemperature = apparentTemperature,
        _precipitation = precipitation,
        _rain = rain,
        _relativeHumidity2M = relativeHumidity2M,
        _surfacePressure = surfacePressure,
        _visibility = visibility,
        _evapotranspiration = evapotranspiration,
        _windSpeed10M = windSpeed10M,
        _windDirection10M = windDirection10M,
        _windGusts10M = windGusts10M,
        _cloudCover = cloudCover,
        _uvIndex = uvIndex,
        _dewpoint2M = dewpoint2M,
        _precipitationProbability = precipitationProbability,
        _shortwaveRadiation = shortwaveRadiation;

  factory _$HourlyImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyImplFromJson(json);

  final List<String>? _time;
  @override
  List<String>? get time {
    final value = _time;
    if (value == null) return null;
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _weatherCode;
  @override
  @JsonKey(name: 'weathercode')
  List<int>? get weatherCode {
    final value = _weatherCode;
    if (value == null) return null;
    if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _temperature2M;
  @override
  List<double>? get temperature2M {
    final value = _temperature2M;
    if (value == null) return null;
    if (_temperature2M is EqualUnmodifiableListView) return _temperature2M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _apparentTemperature;
  @override
  List<double?>? get apparentTemperature {
    final value = _apparentTemperature;
    if (value == null) return null;
    if (_apparentTemperature is EqualUnmodifiableListView)
      return _apparentTemperature;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _precipitation;
  @override
  List<double?>? get precipitation {
    final value = _precipitation;
    if (value == null) return null;
    if (_precipitation is EqualUnmodifiableListView) return _precipitation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _rain;
  @override
  List<double?>? get rain {
    final value = _rain;
    if (value == null) return null;
    if (_rain is EqualUnmodifiableListView) return _rain;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _relativeHumidity2M;
  @override
  @JsonKey(name: 'relativehumidity2M')
  List<int?>? get relativeHumidity2M {
    final value = _relativeHumidity2M;
    if (value == null) return null;
    if (_relativeHumidity2M is EqualUnmodifiableListView)
      return _relativeHumidity2M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _surfacePressure;
  @override
  List<double?>? get surfacePressure {
    final value = _surfacePressure;
    if (value == null) return null;
    if (_surfacePressure is EqualUnmodifiableListView) return _surfacePressure;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _visibility;
  @override
  List<double?>? get visibility {
    final value = _visibility;
    if (value == null) return null;
    if (_visibility is EqualUnmodifiableListView) return _visibility;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _evapotranspiration;
  @override
  List<double?>? get evapotranspiration {
    final value = _evapotranspiration;
    if (value == null) return null;
    if (_evapotranspiration is EqualUnmodifiableListView)
      return _evapotranspiration;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _windSpeed10M;
  @override
  @JsonKey(name: 'windspeed10M')
  List<double?>? get windSpeed10M {
    final value = _windSpeed10M;
    if (value == null) return null;
    if (_windSpeed10M is EqualUnmodifiableListView) return _windSpeed10M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _windDirection10M;
  @override
  @JsonKey(name: 'winddirection10M')
  List<int?>? get windDirection10M {
    final value = _windDirection10M;
    if (value == null) return null;
    if (_windDirection10M is EqualUnmodifiableListView)
      return _windDirection10M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _windGusts10M;
  @override
  @JsonKey(name: 'windgusts10M')
  List<double?>? get windGusts10M {
    final value = _windGusts10M;
    if (value == null) return null;
    if (_windGusts10M is EqualUnmodifiableListView) return _windGusts10M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _cloudCover;
  @override
  @JsonKey(name: 'cloudcover')
  List<int?>? get cloudCover {
    final value = _cloudCover;
    if (value == null) return null;
    if (_cloudCover is EqualUnmodifiableListView) return _cloudCover;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _uvIndex;
  @override
  List<double?>? get uvIndex {
    final value = _uvIndex;
    if (value == null) return null;
    if (_uvIndex is EqualUnmodifiableListView) return _uvIndex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _dewpoint2M;
  @override
  @JsonKey(name: 'dewpoint2M')
  List<double?>? get dewpoint2M {
    final value = _dewpoint2M;
    if (value == null) return null;
    if (_dewpoint2M is EqualUnmodifiableListView) return _dewpoint2M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _precipitationProbability;
  @override
  List<int?>? get precipitationProbability {
    final value = _precipitationProbability;
    if (value == null) return null;
    if (_precipitationProbability is EqualUnmodifiableListView)
      return _precipitationProbability;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _shortwaveRadiation;
  @override
  List<double?>? get shortwaveRadiation {
    final value = _shortwaveRadiation;
    if (value == null) return null;
    if (_shortwaveRadiation is EqualUnmodifiableListView)
      return _shortwaveRadiation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Hourly(time: $time, weatherCode: $weatherCode, temperature2M: $temperature2M, apparentTemperature: $apparentTemperature, precipitation: $precipitation, rain: $rain, relativeHumidity2M: $relativeHumidity2M, surfacePressure: $surfacePressure, visibility: $visibility, evapotranspiration: $evapotranspiration, windSpeed10M: $windSpeed10M, windDirection10M: $windDirection10M, windGusts10M: $windGusts10M, cloudCover: $cloudCover, uvIndex: $uvIndex, dewpoint2M: $dewpoint2M, precipitationProbability: $precipitationProbability, shortwaveRadiation: $shortwaveRadiation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyImpl &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality()
                .equals(other._weatherCode, _weatherCode) &&
            const DeepCollectionEquality()
                .equals(other._temperature2M, _temperature2M) &&
            const DeepCollectionEquality()
                .equals(other._apparentTemperature, _apparentTemperature) &&
            const DeepCollectionEquality()
                .equals(other._precipitation, _precipitation) &&
            const DeepCollectionEquality().equals(other._rain, _rain) &&
            const DeepCollectionEquality()
                .equals(other._relativeHumidity2M, _relativeHumidity2M) &&
            const DeepCollectionEquality()
                .equals(other._surfacePressure, _surfacePressure) &&
            const DeepCollectionEquality()
                .equals(other._visibility, _visibility) &&
            const DeepCollectionEquality()
                .equals(other._evapotranspiration, _evapotranspiration) &&
            const DeepCollectionEquality()
                .equals(other._windSpeed10M, _windSpeed10M) &&
            const DeepCollectionEquality()
                .equals(other._windDirection10M, _windDirection10M) &&
            const DeepCollectionEquality()
                .equals(other._windGusts10M, _windGusts10M) &&
            const DeepCollectionEquality()
                .equals(other._cloudCover, _cloudCover) &&
            const DeepCollectionEquality().equals(other._uvIndex, _uvIndex) &&
            const DeepCollectionEquality()
                .equals(other._dewpoint2M, _dewpoint2M) &&
            const DeepCollectionEquality().equals(
                other._precipitationProbability, _precipitationProbability) &&
            const DeepCollectionEquality()
                .equals(other._shortwaveRadiation, _shortwaveRadiation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_time),
      const DeepCollectionEquality().hash(_weatherCode),
      const DeepCollectionEquality().hash(_temperature2M),
      const DeepCollectionEquality().hash(_apparentTemperature),
      const DeepCollectionEquality().hash(_precipitation),
      const DeepCollectionEquality().hash(_rain),
      const DeepCollectionEquality().hash(_relativeHumidity2M),
      const DeepCollectionEquality().hash(_surfacePressure),
      const DeepCollectionEquality().hash(_visibility),
      const DeepCollectionEquality().hash(_evapotranspiration),
      const DeepCollectionEquality().hash(_windSpeed10M),
      const DeepCollectionEquality().hash(_windDirection10M),
      const DeepCollectionEquality().hash(_windGusts10M),
      const DeepCollectionEquality().hash(_cloudCover),
      const DeepCollectionEquality().hash(_uvIndex),
      const DeepCollectionEquality().hash(_dewpoint2M),
      const DeepCollectionEquality().hash(_precipitationProbability),
      const DeepCollectionEquality().hash(_shortwaveRadiation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyImplCopyWith<_$HourlyImpl> get copyWith =>
      __$$HourlyImplCopyWithImpl<_$HourlyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyImplToJson(
      this,
    );
  }
}

abstract class _Hourly implements Hourly {
  const factory _Hourly(
      {final List<String>? time,
      @JsonKey(name: 'weathercode') final List<int>? weatherCode,
      final List<double>? temperature2M,
      final List<double?>? apparentTemperature,
      final List<double?>? precipitation,
      final List<double?>? rain,
      @JsonKey(name: 'relativehumidity2M') final List<int?>? relativeHumidity2M,
      final List<double?>? surfacePressure,
      final List<double?>? visibility,
      final List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed10M') final List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection10M') final List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts10M') final List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') final List<int?>? cloudCover,
      final List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint2M') final List<double?>? dewpoint2M,
      final List<int?>? precipitationProbability,
      final List<double?>? shortwaveRadiation}) = _$HourlyImpl;

  factory _Hourly.fromJson(Map<String, dynamic> json) = _$HourlyImpl.fromJson;

  @override
  List<String>? get time;
  @override
  @JsonKey(name: 'weathercode')
  List<int>? get weatherCode;
  @override
  List<double>? get temperature2M;
  @override
  List<double?>? get apparentTemperature;
  @override
  List<double?>? get precipitation;
  @override
  List<double?>? get rain;
  @override
  @JsonKey(name: 'relativehumidity2M')
  List<int?>? get relativeHumidity2M;
  @override
  List<double?>? get surfacePressure;
  @override
  List<double?>? get visibility;
  @override
  List<double?>? get evapotranspiration;
  @override
  @JsonKey(name: 'windspeed10M')
  List<double?>? get windSpeed10M;
  @override
  @JsonKey(name: 'winddirection10M')
  List<int?>? get windDirection10M;
  @override
  @JsonKey(name: 'windgusts10M')
  List<double?>? get windGusts10M;
  @override
  @JsonKey(name: 'cloudcover')
  List<int?>? get cloudCover;
  @override
  List<double?>? get uvIndex;
  @override
  @JsonKey(name: 'dewpoint2M')
  List<double?>? get dewpoint2M;
  @override
  List<int?>? get precipitationProbability;
  @override
  List<double?>? get shortwaveRadiation;
  @override
  @JsonKey(ignore: true)
  _$$HourlyImplCopyWith<_$HourlyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
