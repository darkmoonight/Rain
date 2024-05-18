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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherDataApi _$WeatherDataApiFromJson(Map<String, dynamic> json) {
  return _WeatherDataApi.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataApi {
  Hourly get hourly => throw _privateConstructorUsedError;
  Daily get daily => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataApiCopyWith<WeatherDataApi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataApiCopyWith<$Res> {
  factory $WeatherDataApiCopyWith(
          WeatherDataApi value, $Res Function(WeatherDataApi) then) =
      _$WeatherDataApiCopyWithImpl<$Res, WeatherDataApi>;
  @useResult
  $Res call({Hourly hourly, Daily daily, String timezone});

  $HourlyCopyWith<$Res> get hourly;
  $DailyCopyWith<$Res> get daily;
}

/// @nodoc
class _$WeatherDataApiCopyWithImpl<$Res, $Val extends WeatherDataApi>
    implements $WeatherDataApiCopyWith<$Res> {
  _$WeatherDataApiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourly = null,
    Object? daily = null,
    Object? timezone = null,
  }) {
    return _then(_value.copyWith(
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as Hourly,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as Daily,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HourlyCopyWith<$Res> get hourly {
    return $HourlyCopyWith<$Res>(_value.hourly, (value) {
      return _then(_value.copyWith(hourly: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DailyCopyWith<$Res> get daily {
    return $DailyCopyWith<$Res>(_value.daily, (value) {
      return _then(_value.copyWith(daily: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherDataApiImplCopyWith<$Res>
    implements $WeatherDataApiCopyWith<$Res> {
  factory _$$WeatherDataApiImplCopyWith(_$WeatherDataApiImpl value,
          $Res Function(_$WeatherDataApiImpl) then) =
      __$$WeatherDataApiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Hourly hourly, Daily daily, String timezone});

  @override
  $HourlyCopyWith<$Res> get hourly;
  @override
  $DailyCopyWith<$Res> get daily;
}

/// @nodoc
class __$$WeatherDataApiImplCopyWithImpl<$Res>
    extends _$WeatherDataApiCopyWithImpl<$Res, _$WeatherDataApiImpl>
    implements _$$WeatherDataApiImplCopyWith<$Res> {
  __$$WeatherDataApiImplCopyWithImpl(
      _$WeatherDataApiImpl _value, $Res Function(_$WeatherDataApiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hourly = null,
    Object? daily = null,
    Object? timezone = null,
  }) {
    return _then(_$WeatherDataApiImpl(
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as Hourly,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as Daily,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataApiImpl implements _WeatherDataApi {
  const _$WeatherDataApiImpl(
      {required this.hourly, required this.daily, required this.timezone});

  factory _$WeatherDataApiImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataApiImplFromJson(json);

  @override
  final Hourly hourly;
  @override
  final Daily daily;
  @override
  final String timezone;

  @override
  String toString() {
    return 'WeatherDataApi(hourly: $hourly, daily: $daily, timezone: $timezone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataApiImpl &&
            (identical(other.hourly, hourly) || other.hourly == hourly) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hourly, daily, timezone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataApiImplCopyWith<_$WeatherDataApiImpl> get copyWith =>
      __$$WeatherDataApiImplCopyWithImpl<_$WeatherDataApiImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataApiImplToJson(
      this,
    );
  }
}

abstract class _WeatherDataApi implements WeatherDataApi {
  const factory _WeatherDataApi(
      {required final Hourly hourly,
      required final Daily daily,
      required final String timezone}) = _$WeatherDataApiImpl;

  factory _WeatherDataApi.fromJson(Map<String, dynamic> json) =
      _$WeatherDataApiImpl.fromJson;

  @override
  Hourly get hourly;
  @override
  Daily get daily;
  @override
  String get timezone;
  @override
  @JsonKey(ignore: true)
  _$$WeatherDataApiImplCopyWith<_$WeatherDataApiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return _Hourly.fromJson(json);
}

/// @nodoc
mixin _$Hourly {
  List<String>? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'weathercode')
  List<int>? get weatherCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_2m')
  List<double>? get temperature2M => throw _privateConstructorUsedError;
  @JsonKey(name: 'apparent_temperature')
  List<double?>? get apparentTemperature => throw _privateConstructorUsedError;
  List<double?>? get precipitation => throw _privateConstructorUsedError;
  List<double?>? get rain => throw _privateConstructorUsedError;
  @JsonKey(name: 'relativehumidity_2m')
  List<int?>? get relativeHumidity2M => throw _privateConstructorUsedError;
  @JsonKey(name: 'surface_pressure')
  List<double?>? get surfacePressure => throw _privateConstructorUsedError;
  List<double?>? get visibility => throw _privateConstructorUsedError;
  List<double?>? get evapotranspiration => throw _privateConstructorUsedError;
  @JsonKey(name: 'windspeed_10m')
  List<double?>? get windSpeed10M => throw _privateConstructorUsedError;
  @JsonKey(name: 'winddirection_10m')
  List<int?>? get windDirection10M => throw _privateConstructorUsedError;
  @JsonKey(name: 'windgusts_10m')
  List<double?>? get windGusts10M => throw _privateConstructorUsedError;
  @JsonKey(name: 'cloudcover')
  List<int?>? get cloudCover => throw _privateConstructorUsedError;
  @JsonKey(name: 'uv_index')
  List<double?>? get uvIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'dewpoint_2m')
  List<double?>? get dewpoint2M => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation_probability')
  List<int?>? get precipitationProbability =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'shortwave_radiation')
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
      @JsonKey(name: 'temperature_2m') List<double>? temperature2M,
      @JsonKey(name: 'apparent_temperature') List<double?>? apparentTemperature,
      List<double?>? precipitation,
      List<double?>? rain,
      @JsonKey(name: 'relativehumidity_2m') List<int?>? relativeHumidity2M,
      @JsonKey(name: 'surface_pressure') List<double?>? surfacePressure,
      List<double?>? visibility,
      List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed_10m') List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection_10m') List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts_10m') List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') List<int?>? cloudCover,
      @JsonKey(name: 'uv_index') List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint_2m') List<double?>? dewpoint2M,
      @JsonKey(name: 'precipitation_probability')
      List<int?>? precipitationProbability,
      @JsonKey(name: 'shortwave_radiation') List<double?>? shortwaveRadiation});
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
      @JsonKey(name: 'temperature_2m') List<double>? temperature2M,
      @JsonKey(name: 'apparent_temperature') List<double?>? apparentTemperature,
      List<double?>? precipitation,
      List<double?>? rain,
      @JsonKey(name: 'relativehumidity_2m') List<int?>? relativeHumidity2M,
      @JsonKey(name: 'surface_pressure') List<double?>? surfacePressure,
      List<double?>? visibility,
      List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed_10m') List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection_10m') List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts_10m') List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') List<int?>? cloudCover,
      @JsonKey(name: 'uv_index') List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint_2m') List<double?>? dewpoint2M,
      @JsonKey(name: 'precipitation_probability')
      List<int?>? precipitationProbability,
      @JsonKey(name: 'shortwave_radiation') List<double?>? shortwaveRadiation});
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
      @JsonKey(name: 'temperature_2m') final List<double>? temperature2M,
      @JsonKey(name: 'apparent_temperature')
      final List<double?>? apparentTemperature,
      final List<double?>? precipitation,
      final List<double?>? rain,
      @JsonKey(name: 'relativehumidity_2m')
      final List<int?>? relativeHumidity2M,
      @JsonKey(name: 'surface_pressure') final List<double?>? surfacePressure,
      final List<double?>? visibility,
      final List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed_10m') final List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection_10m') final List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts_10m') final List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') final List<int?>? cloudCover,
      @JsonKey(name: 'uv_index') final List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint_2m') final List<double?>? dewpoint2M,
      @JsonKey(name: 'precipitation_probability')
      final List<int?>? precipitationProbability,
      @JsonKey(name: 'shortwave_radiation')
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
  @JsonKey(name: 'temperature_2m')
  List<double>? get temperature2M {
    final value = _temperature2M;
    if (value == null) return null;
    if (_temperature2M is EqualUnmodifiableListView) return _temperature2M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _apparentTemperature;
  @override
  @JsonKey(name: 'apparent_temperature')
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
  @JsonKey(name: 'relativehumidity_2m')
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
  @JsonKey(name: 'surface_pressure')
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
  @JsonKey(name: 'windspeed_10m')
  List<double?>? get windSpeed10M {
    final value = _windSpeed10M;
    if (value == null) return null;
    if (_windSpeed10M is EqualUnmodifiableListView) return _windSpeed10M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _windDirection10M;
  @override
  @JsonKey(name: 'winddirection_10m')
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
  @JsonKey(name: 'windgusts_10m')
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
  @JsonKey(name: 'uv_index')
  List<double?>? get uvIndex {
    final value = _uvIndex;
    if (value == null) return null;
    if (_uvIndex is EqualUnmodifiableListView) return _uvIndex;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _dewpoint2M;
  @override
  @JsonKey(name: 'dewpoint_2m')
  List<double?>? get dewpoint2M {
    final value = _dewpoint2M;
    if (value == null) return null;
    if (_dewpoint2M is EqualUnmodifiableListView) return _dewpoint2M;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _precipitationProbability;
  @override
  @JsonKey(name: 'precipitation_probability')
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
  @JsonKey(name: 'shortwave_radiation')
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
  bool operator ==(Object other) {
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
      @JsonKey(name: 'temperature_2m') final List<double>? temperature2M,
      @JsonKey(name: 'apparent_temperature')
      final List<double?>? apparentTemperature,
      final List<double?>? precipitation,
      final List<double?>? rain,
      @JsonKey(name: 'relativehumidity_2m')
      final List<int?>? relativeHumidity2M,
      @JsonKey(name: 'surface_pressure') final List<double?>? surfacePressure,
      final List<double?>? visibility,
      final List<double?>? evapotranspiration,
      @JsonKey(name: 'windspeed_10m') final List<double?>? windSpeed10M,
      @JsonKey(name: 'winddirection_10m') final List<int?>? windDirection10M,
      @JsonKey(name: 'windgusts_10m') final List<double?>? windGusts10M,
      @JsonKey(name: 'cloudcover') final List<int?>? cloudCover,
      @JsonKey(name: 'uv_index') final List<double?>? uvIndex,
      @JsonKey(name: 'dewpoint_2m') final List<double?>? dewpoint2M,
      @JsonKey(name: 'precipitation_probability')
      final List<int?>? precipitationProbability,
      @JsonKey(name: 'shortwave_radiation')
      final List<double?>? shortwaveRadiation}) = _$HourlyImpl;

  factory _Hourly.fromJson(Map<String, dynamic> json) = _$HourlyImpl.fromJson;

  @override
  List<String>? get time;
  @override
  @JsonKey(name: 'weathercode')
  List<int>? get weatherCode;
  @override
  @JsonKey(name: 'temperature_2m')
  List<double>? get temperature2M;
  @override
  @JsonKey(name: 'apparent_temperature')
  List<double?>? get apparentTemperature;
  @override
  List<double?>? get precipitation;
  @override
  List<double?>? get rain;
  @override
  @JsonKey(name: 'relativehumidity_2m')
  List<int?>? get relativeHumidity2M;
  @override
  @JsonKey(name: 'surface_pressure')
  List<double?>? get surfacePressure;
  @override
  List<double?>? get visibility;
  @override
  List<double?>? get evapotranspiration;
  @override
  @JsonKey(name: 'windspeed_10m')
  List<double?>? get windSpeed10M;
  @override
  @JsonKey(name: 'winddirection_10m')
  List<int?>? get windDirection10M;
  @override
  @JsonKey(name: 'windgusts_10m')
  List<double?>? get windGusts10M;
  @override
  @JsonKey(name: 'cloudcover')
  List<int?>? get cloudCover;
  @override
  @JsonKey(name: 'uv_index')
  List<double?>? get uvIndex;
  @override
  @JsonKey(name: 'dewpoint_2m')
  List<double?>? get dewpoint2M;
  @override
  @JsonKey(name: 'precipitation_probability')
  List<int?>? get precipitationProbability;
  @override
  @JsonKey(name: 'shortwave_radiation')
  List<double?>? get shortwaveRadiation;
  @override
  @JsonKey(ignore: true)
  _$$HourlyImplCopyWith<_$HourlyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Daily _$DailyFromJson(Map<String, dynamic> json) {
  return _Daily.fromJson(json);
}

/// @nodoc
mixin _$Daily {
  @JsonKey(fromJson: _dateTimeFromJson)
  List<DateTime>? get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'weathercode')
  List<int?>? get weatherCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_2m_max')
  List<double?>? get temperature2MMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_2m_min')
  List<double?>? get temperature2MMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'apparent_temperature_max')
  List<double?>? get apparentTemperatureMax =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'apparent_temperature_min')
  List<double?>? get apparentTemperatureMin =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation_sum')
  List<double?>? get precipitationSum => throw _privateConstructorUsedError;
  List<String>? get sunrise => throw _privateConstructorUsedError;
  List<String>? get sunset => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation_probability_max')
  List<int?>? get precipitationProbabilityMax =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'windspeed_10m_max')
  List<double?>? get windSpeed10MMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'windgusts_10m_max')
  List<double?>? get windGusts10MMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'uv_index_max')
  List<double?>? get uvIndexMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain_sum')
  List<double?>? get rainSum => throw _privateConstructorUsedError;
  @JsonKey(name: 'winddirection_10m_dominant')
  List<int?>? get windDirection10MDominant =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyCopyWith<Daily> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyCopyWith<$Res> {
  factory $DailyCopyWith(Daily value, $Res Function(Daily) then) =
      _$DailyCopyWithImpl<$Res, Daily>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromJson) List<DateTime>? time,
      @JsonKey(name: 'weathercode') List<int?>? weatherCode,
      @JsonKey(name: 'temperature_2m_max') List<double?>? temperature2MMax,
      @JsonKey(name: 'temperature_2m_min') List<double?>? temperature2MMin,
      @JsonKey(name: 'apparent_temperature_max')
      List<double?>? apparentTemperatureMax,
      @JsonKey(name: 'apparent_temperature_min')
      List<double?>? apparentTemperatureMin,
      @JsonKey(name: 'precipitation_sum') List<double?>? precipitationSum,
      List<String>? sunrise,
      List<String>? sunset,
      @JsonKey(name: 'precipitation_probability_max')
      List<int?>? precipitationProbabilityMax,
      @JsonKey(name: 'windspeed_10m_max') List<double?>? windSpeed10MMax,
      @JsonKey(name: 'windgusts_10m_max') List<double?>? windGusts10MMax,
      @JsonKey(name: 'uv_index_max') List<double?>? uvIndexMax,
      @JsonKey(name: 'rain_sum') List<double?>? rainSum,
      @JsonKey(name: 'winddirection_10m_dominant')
      List<int?>? windDirection10MDominant});
}

/// @nodoc
class _$DailyCopyWithImpl<$Res, $Val extends Daily>
    implements $DailyCopyWith<$Res> {
  _$DailyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? weatherCode = freezed,
    Object? temperature2MMax = freezed,
    Object? temperature2MMin = freezed,
    Object? apparentTemperatureMax = freezed,
    Object? apparentTemperatureMin = freezed,
    Object? precipitationSum = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? precipitationProbabilityMax = freezed,
    Object? windSpeed10MMax = freezed,
    Object? windGusts10MMax = freezed,
    Object? uvIndexMax = freezed,
    Object? rainSum = freezed,
    Object? windDirection10MDominant = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      weatherCode: freezed == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      temperature2MMax: freezed == temperature2MMax
          ? _value.temperature2MMax
          : temperature2MMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      temperature2MMin: freezed == temperature2MMin
          ? _value.temperature2MMin
          : temperature2MMin // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      apparentTemperatureMax: freezed == apparentTemperatureMax
          ? _value.apparentTemperatureMax
          : apparentTemperatureMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      apparentTemperatureMin: freezed == apparentTemperatureMin
          ? _value.apparentTemperatureMin
          : apparentTemperatureMin // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      precipitationSum: freezed == precipitationSum
          ? _value.precipitationSum
          : precipitationSum // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      sunrise: freezed == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sunset: freezed == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      precipitationProbabilityMax: freezed == precipitationProbabilityMax
          ? _value.precipitationProbabilityMax
          : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      windSpeed10MMax: freezed == windSpeed10MMax
          ? _value.windSpeed10MMax
          : windSpeed10MMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windGusts10MMax: freezed == windGusts10MMax
          ? _value.windGusts10MMax
          : windGusts10MMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      uvIndexMax: freezed == uvIndexMax
          ? _value.uvIndexMax
          : uvIndexMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      rainSum: freezed == rainSum
          ? _value.rainSum
          : rainSum // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windDirection10MDominant: freezed == windDirection10MDominant
          ? _value.windDirection10MDominant
          : windDirection10MDominant // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyImplCopyWith<$Res> implements $DailyCopyWith<$Res> {
  factory _$$DailyImplCopyWith(
          _$DailyImpl value, $Res Function(_$DailyImpl) then) =
      __$$DailyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _dateTimeFromJson) List<DateTime>? time,
      @JsonKey(name: 'weathercode') List<int?>? weatherCode,
      @JsonKey(name: 'temperature_2m_max') List<double?>? temperature2MMax,
      @JsonKey(name: 'temperature_2m_min') List<double?>? temperature2MMin,
      @JsonKey(name: 'apparent_temperature_max')
      List<double?>? apparentTemperatureMax,
      @JsonKey(name: 'apparent_temperature_min')
      List<double?>? apparentTemperatureMin,
      @JsonKey(name: 'precipitation_sum') List<double?>? precipitationSum,
      List<String>? sunrise,
      List<String>? sunset,
      @JsonKey(name: 'precipitation_probability_max')
      List<int?>? precipitationProbabilityMax,
      @JsonKey(name: 'windspeed_10m_max') List<double?>? windSpeed10MMax,
      @JsonKey(name: 'windgusts_10m_max') List<double?>? windGusts10MMax,
      @JsonKey(name: 'uv_index_max') List<double?>? uvIndexMax,
      @JsonKey(name: 'rain_sum') List<double?>? rainSum,
      @JsonKey(name: 'winddirection_10m_dominant')
      List<int?>? windDirection10MDominant});
}

/// @nodoc
class __$$DailyImplCopyWithImpl<$Res>
    extends _$DailyCopyWithImpl<$Res, _$DailyImpl>
    implements _$$DailyImplCopyWith<$Res> {
  __$$DailyImplCopyWithImpl(
      _$DailyImpl _value, $Res Function(_$DailyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? weatherCode = freezed,
    Object? temperature2MMax = freezed,
    Object? temperature2MMin = freezed,
    Object? apparentTemperatureMax = freezed,
    Object? apparentTemperatureMin = freezed,
    Object? precipitationSum = freezed,
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? precipitationProbabilityMax = freezed,
    Object? windSpeed10MMax = freezed,
    Object? windGusts10MMax = freezed,
    Object? uvIndexMax = freezed,
    Object? rainSum = freezed,
    Object? windDirection10MDominant = freezed,
  }) {
    return _then(_$DailyImpl(
      time: freezed == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
      weatherCode: freezed == weatherCode
          ? _value._weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      temperature2MMax: freezed == temperature2MMax
          ? _value._temperature2MMax
          : temperature2MMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      temperature2MMin: freezed == temperature2MMin
          ? _value._temperature2MMin
          : temperature2MMin // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      apparentTemperatureMax: freezed == apparentTemperatureMax
          ? _value._apparentTemperatureMax
          : apparentTemperatureMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      apparentTemperatureMin: freezed == apparentTemperatureMin
          ? _value._apparentTemperatureMin
          : apparentTemperatureMin // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      precipitationSum: freezed == precipitationSum
          ? _value._precipitationSum
          : precipitationSum // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      sunrise: freezed == sunrise
          ? _value._sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sunset: freezed == sunset
          ? _value._sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      precipitationProbabilityMax: freezed == precipitationProbabilityMax
          ? _value._precipitationProbabilityMax
          : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
      windSpeed10MMax: freezed == windSpeed10MMax
          ? _value._windSpeed10MMax
          : windSpeed10MMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windGusts10MMax: freezed == windGusts10MMax
          ? _value._windGusts10MMax
          : windGusts10MMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      uvIndexMax: freezed == uvIndexMax
          ? _value._uvIndexMax
          : uvIndexMax // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      rainSum: freezed == rainSum
          ? _value._rainSum
          : rainSum // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
      windDirection10MDominant: freezed == windDirection10MDominant
          ? _value._windDirection10MDominant
          : windDirection10MDominant // ignore: cast_nullable_to_non_nullable
              as List<int?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyImpl implements _Daily {
  const _$DailyImpl(
      {@JsonKey(fromJson: _dateTimeFromJson) final List<DateTime>? time,
      @JsonKey(name: 'weathercode') final List<int?>? weatherCode,
      @JsonKey(name: 'temperature_2m_max')
      final List<double?>? temperature2MMax,
      @JsonKey(name: 'temperature_2m_min')
      final List<double?>? temperature2MMin,
      @JsonKey(name: 'apparent_temperature_max')
      final List<double?>? apparentTemperatureMax,
      @JsonKey(name: 'apparent_temperature_min')
      final List<double?>? apparentTemperatureMin,
      @JsonKey(name: 'precipitation_sum') final List<double?>? precipitationSum,
      final List<String>? sunrise,
      final List<String>? sunset,
      @JsonKey(name: 'precipitation_probability_max')
      final List<int?>? precipitationProbabilityMax,
      @JsonKey(name: 'windspeed_10m_max') final List<double?>? windSpeed10MMax,
      @JsonKey(name: 'windgusts_10m_max') final List<double?>? windGusts10MMax,
      @JsonKey(name: 'uv_index_max') final List<double?>? uvIndexMax,
      @JsonKey(name: 'rain_sum') final List<double?>? rainSum,
      @JsonKey(name: 'winddirection_10m_dominant')
      final List<int?>? windDirection10MDominant})
      : _time = time,
        _weatherCode = weatherCode,
        _temperature2MMax = temperature2MMax,
        _temperature2MMin = temperature2MMin,
        _apparentTemperatureMax = apparentTemperatureMax,
        _apparentTemperatureMin = apparentTemperatureMin,
        _precipitationSum = precipitationSum,
        _sunrise = sunrise,
        _sunset = sunset,
        _precipitationProbabilityMax = precipitationProbabilityMax,
        _windSpeed10MMax = windSpeed10MMax,
        _windGusts10MMax = windGusts10MMax,
        _uvIndexMax = uvIndexMax,
        _rainSum = rainSum,
        _windDirection10MDominant = windDirection10MDominant;

  factory _$DailyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyImplFromJson(json);

  final List<DateTime>? _time;
  @override
  @JsonKey(fromJson: _dateTimeFromJson)
  List<DateTime>? get time {
    final value = _time;
    if (value == null) return null;
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _weatherCode;
  @override
  @JsonKey(name: 'weathercode')
  List<int?>? get weatherCode {
    final value = _weatherCode;
    if (value == null) return null;
    if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _temperature2MMax;
  @override
  @JsonKey(name: 'temperature_2m_max')
  List<double?>? get temperature2MMax {
    final value = _temperature2MMax;
    if (value == null) return null;
    if (_temperature2MMax is EqualUnmodifiableListView)
      return _temperature2MMax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _temperature2MMin;
  @override
  @JsonKey(name: 'temperature_2m_min')
  List<double?>? get temperature2MMin {
    final value = _temperature2MMin;
    if (value == null) return null;
    if (_temperature2MMin is EqualUnmodifiableListView)
      return _temperature2MMin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _apparentTemperatureMax;
  @override
  @JsonKey(name: 'apparent_temperature_max')
  List<double?>? get apparentTemperatureMax {
    final value = _apparentTemperatureMax;
    if (value == null) return null;
    if (_apparentTemperatureMax is EqualUnmodifiableListView)
      return _apparentTemperatureMax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _apparentTemperatureMin;
  @override
  @JsonKey(name: 'apparent_temperature_min')
  List<double?>? get apparentTemperatureMin {
    final value = _apparentTemperatureMin;
    if (value == null) return null;
    if (_apparentTemperatureMin is EqualUnmodifiableListView)
      return _apparentTemperatureMin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _precipitationSum;
  @override
  @JsonKey(name: 'precipitation_sum')
  List<double?>? get precipitationSum {
    final value = _precipitationSum;
    if (value == null) return null;
    if (_precipitationSum is EqualUnmodifiableListView)
      return _precipitationSum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _sunrise;
  @override
  List<String>? get sunrise {
    final value = _sunrise;
    if (value == null) return null;
    if (_sunrise is EqualUnmodifiableListView) return _sunrise;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _sunset;
  @override
  List<String>? get sunset {
    final value = _sunset;
    if (value == null) return null;
    if (_sunset is EqualUnmodifiableListView) return _sunset;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _precipitationProbabilityMax;
  @override
  @JsonKey(name: 'precipitation_probability_max')
  List<int?>? get precipitationProbabilityMax {
    final value = _precipitationProbabilityMax;
    if (value == null) return null;
    if (_precipitationProbabilityMax is EqualUnmodifiableListView)
      return _precipitationProbabilityMax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _windSpeed10MMax;
  @override
  @JsonKey(name: 'windspeed_10m_max')
  List<double?>? get windSpeed10MMax {
    final value = _windSpeed10MMax;
    if (value == null) return null;
    if (_windSpeed10MMax is EqualUnmodifiableListView) return _windSpeed10MMax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _windGusts10MMax;
  @override
  @JsonKey(name: 'windgusts_10m_max')
  List<double?>? get windGusts10MMax {
    final value = _windGusts10MMax;
    if (value == null) return null;
    if (_windGusts10MMax is EqualUnmodifiableListView) return _windGusts10MMax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _uvIndexMax;
  @override
  @JsonKey(name: 'uv_index_max')
  List<double?>? get uvIndexMax {
    final value = _uvIndexMax;
    if (value == null) return null;
    if (_uvIndexMax is EqualUnmodifiableListView) return _uvIndexMax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double?>? _rainSum;
  @override
  @JsonKey(name: 'rain_sum')
  List<double?>? get rainSum {
    final value = _rainSum;
    if (value == null) return null;
    if (_rainSum is EqualUnmodifiableListView) return _rainSum;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int?>? _windDirection10MDominant;
  @override
  @JsonKey(name: 'winddirection_10m_dominant')
  List<int?>? get windDirection10MDominant {
    final value = _windDirection10MDominant;
    if (value == null) return null;
    if (_windDirection10MDominant is EqualUnmodifiableListView)
      return _windDirection10MDominant;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Daily(time: $time, weatherCode: $weatherCode, temperature2MMax: $temperature2MMax, temperature2MMin: $temperature2MMin, apparentTemperatureMax: $apparentTemperatureMax, apparentTemperatureMin: $apparentTemperatureMin, precipitationSum: $precipitationSum, sunrise: $sunrise, sunset: $sunset, precipitationProbabilityMax: $precipitationProbabilityMax, windSpeed10MMax: $windSpeed10MMax, windGusts10MMax: $windGusts10MMax, uvIndexMax: $uvIndexMax, rainSum: $rainSum, windDirection10MDominant: $windDirection10MDominant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyImpl &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality()
                .equals(other._weatherCode, _weatherCode) &&
            const DeepCollectionEquality()
                .equals(other._temperature2MMax, _temperature2MMax) &&
            const DeepCollectionEquality()
                .equals(other._temperature2MMin, _temperature2MMin) &&
            const DeepCollectionEquality().equals(
                other._apparentTemperatureMax, _apparentTemperatureMax) &&
            const DeepCollectionEquality().equals(
                other._apparentTemperatureMin, _apparentTemperatureMin) &&
            const DeepCollectionEquality()
                .equals(other._precipitationSum, _precipitationSum) &&
            const DeepCollectionEquality().equals(other._sunrise, _sunrise) &&
            const DeepCollectionEquality().equals(other._sunset, _sunset) &&
            const DeepCollectionEquality().equals(
                other._precipitationProbabilityMax,
                _precipitationProbabilityMax) &&
            const DeepCollectionEquality()
                .equals(other._windSpeed10MMax, _windSpeed10MMax) &&
            const DeepCollectionEquality()
                .equals(other._windGusts10MMax, _windGusts10MMax) &&
            const DeepCollectionEquality()
                .equals(other._uvIndexMax, _uvIndexMax) &&
            const DeepCollectionEquality().equals(other._rainSum, _rainSum) &&
            const DeepCollectionEquality().equals(
                other._windDirection10MDominant, _windDirection10MDominant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_time),
      const DeepCollectionEquality().hash(_weatherCode),
      const DeepCollectionEquality().hash(_temperature2MMax),
      const DeepCollectionEquality().hash(_temperature2MMin),
      const DeepCollectionEquality().hash(_apparentTemperatureMax),
      const DeepCollectionEquality().hash(_apparentTemperatureMin),
      const DeepCollectionEquality().hash(_precipitationSum),
      const DeepCollectionEquality().hash(_sunrise),
      const DeepCollectionEquality().hash(_sunset),
      const DeepCollectionEquality().hash(_precipitationProbabilityMax),
      const DeepCollectionEquality().hash(_windSpeed10MMax),
      const DeepCollectionEquality().hash(_windGusts10MMax),
      const DeepCollectionEquality().hash(_uvIndexMax),
      const DeepCollectionEquality().hash(_rainSum),
      const DeepCollectionEquality().hash(_windDirection10MDominant));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyImplCopyWith<_$DailyImpl> get copyWith =>
      __$$DailyImplCopyWithImpl<_$DailyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyImplToJson(
      this,
    );
  }
}

abstract class _Daily implements Daily {
  const factory _Daily(
      {@JsonKey(fromJson: _dateTimeFromJson) final List<DateTime>? time,
      @JsonKey(name: 'weathercode') final List<int?>? weatherCode,
      @JsonKey(name: 'temperature_2m_max')
      final List<double?>? temperature2MMax,
      @JsonKey(name: 'temperature_2m_min')
      final List<double?>? temperature2MMin,
      @JsonKey(name: 'apparent_temperature_max')
      final List<double?>? apparentTemperatureMax,
      @JsonKey(name: 'apparent_temperature_min')
      final List<double?>? apparentTemperatureMin,
      @JsonKey(name: 'precipitation_sum') final List<double?>? precipitationSum,
      final List<String>? sunrise,
      final List<String>? sunset,
      @JsonKey(name: 'precipitation_probability_max')
      final List<int?>? precipitationProbabilityMax,
      @JsonKey(name: 'windspeed_10m_max') final List<double?>? windSpeed10MMax,
      @JsonKey(name: 'windgusts_10m_max') final List<double?>? windGusts10MMax,
      @JsonKey(name: 'uv_index_max') final List<double?>? uvIndexMax,
      @JsonKey(name: 'rain_sum') final List<double?>? rainSum,
      @JsonKey(name: 'winddirection_10m_dominant')
      final List<int?>? windDirection10MDominant}) = _$DailyImpl;

  factory _Daily.fromJson(Map<String, dynamic> json) = _$DailyImpl.fromJson;

  @override
  @JsonKey(fromJson: _dateTimeFromJson)
  List<DateTime>? get time;
  @override
  @JsonKey(name: 'weathercode')
  List<int?>? get weatherCode;
  @override
  @JsonKey(name: 'temperature_2m_max')
  List<double?>? get temperature2MMax;
  @override
  @JsonKey(name: 'temperature_2m_min')
  List<double?>? get temperature2MMin;
  @override
  @JsonKey(name: 'apparent_temperature_max')
  List<double?>? get apparentTemperatureMax;
  @override
  @JsonKey(name: 'apparent_temperature_min')
  List<double?>? get apparentTemperatureMin;
  @override
  @JsonKey(name: 'precipitation_sum')
  List<double?>? get precipitationSum;
  @override
  List<String>? get sunrise;
  @override
  List<String>? get sunset;
  @override
  @JsonKey(name: 'precipitation_probability_max')
  List<int?>? get precipitationProbabilityMax;
  @override
  @JsonKey(name: 'windspeed_10m_max')
  List<double?>? get windSpeed10MMax;
  @override
  @JsonKey(name: 'windgusts_10m_max')
  List<double?>? get windGusts10MMax;
  @override
  @JsonKey(name: 'uv_index_max')
  List<double?>? get uvIndexMax;
  @override
  @JsonKey(name: 'rain_sum')
  List<double?>? get rainSum;
  @override
  @JsonKey(name: 'winddirection_10m_dominant')
  List<int?>? get windDirection10MDominant;
  @override
  @JsonKey(ignore: true)
  _$$DailyImplCopyWith<_$DailyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
