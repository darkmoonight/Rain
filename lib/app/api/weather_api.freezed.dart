// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherDataApi {

 Hourly get hourly; Daily get daily; String get timezone;
/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherDataApiCopyWith<WeatherDataApi> get copyWith => _$WeatherDataApiCopyWithImpl<WeatherDataApi>(this as WeatherDataApi, _$identity);

  /// Serializes this WeatherDataApi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherDataApi&&(identical(other.hourly, hourly) || other.hourly == hourly)&&(identical(other.daily, daily) || other.daily == daily)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hourly,daily,timezone);

@override
String toString() {
  return 'WeatherDataApi(hourly: $hourly, daily: $daily, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class $WeatherDataApiCopyWith<$Res>  {
  factory $WeatherDataApiCopyWith(WeatherDataApi value, $Res Function(WeatherDataApi) _then) = _$WeatherDataApiCopyWithImpl;
@useResult
$Res call({
 Hourly hourly, Daily daily, String timezone
});


$HourlyCopyWith<$Res> get hourly;$DailyCopyWith<$Res> get daily;

}
/// @nodoc
class _$WeatherDataApiCopyWithImpl<$Res>
    implements $WeatherDataApiCopyWith<$Res> {
  _$WeatherDataApiCopyWithImpl(this._self, this._then);

  final WeatherDataApi _self;
  final $Res Function(WeatherDataApi) _then;

/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hourly = null,Object? daily = null,Object? timezone = null,}) {
  return _then(_self.copyWith(
hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as Hourly,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as Daily,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyCopyWith<$Res> get hourly {
  
  return $HourlyCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyCopyWith<$Res> get daily {
  
  return $DailyCopyWith<$Res>(_self.daily, (value) {
    return _then(_self.copyWith(daily: value));
  });
}
}


/// Adds pattern-matching-related methods to [WeatherDataApi].
extension WeatherDataApiPatterns on WeatherDataApi {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherDataApi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherDataApi() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherDataApi value)  $default,){
final _that = this;
switch (_that) {
case _WeatherDataApi():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherDataApi value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherDataApi() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Hourly hourly,  Daily daily,  String timezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherDataApi() when $default != null:
return $default(_that.hourly,_that.daily,_that.timezone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Hourly hourly,  Daily daily,  String timezone)  $default,) {final _that = this;
switch (_that) {
case _WeatherDataApi():
return $default(_that.hourly,_that.daily,_that.timezone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Hourly hourly,  Daily daily,  String timezone)?  $default,) {final _that = this;
switch (_that) {
case _WeatherDataApi() when $default != null:
return $default(_that.hourly,_that.daily,_that.timezone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherDataApi implements WeatherDataApi {
  const _WeatherDataApi({required this.hourly, required this.daily, required this.timezone});
  factory _WeatherDataApi.fromJson(Map<String, dynamic> json) => _$WeatherDataApiFromJson(json);

@override final  Hourly hourly;
@override final  Daily daily;
@override final  String timezone;

/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherDataApiCopyWith<_WeatherDataApi> get copyWith => __$WeatherDataApiCopyWithImpl<_WeatherDataApi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherDataApiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherDataApi&&(identical(other.hourly, hourly) || other.hourly == hourly)&&(identical(other.daily, daily) || other.daily == daily)&&(identical(other.timezone, timezone) || other.timezone == timezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hourly,daily,timezone);

@override
String toString() {
  return 'WeatherDataApi(hourly: $hourly, daily: $daily, timezone: $timezone)';
}


}

/// @nodoc
abstract mixin class _$WeatherDataApiCopyWith<$Res> implements $WeatherDataApiCopyWith<$Res> {
  factory _$WeatherDataApiCopyWith(_WeatherDataApi value, $Res Function(_WeatherDataApi) _then) = __$WeatherDataApiCopyWithImpl;
@override @useResult
$Res call({
 Hourly hourly, Daily daily, String timezone
});


@override $HourlyCopyWith<$Res> get hourly;@override $DailyCopyWith<$Res> get daily;

}
/// @nodoc
class __$WeatherDataApiCopyWithImpl<$Res>
    implements _$WeatherDataApiCopyWith<$Res> {
  __$WeatherDataApiCopyWithImpl(this._self, this._then);

  final _WeatherDataApi _self;
  final $Res Function(_WeatherDataApi) _then;

/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hourly = null,Object? daily = null,Object? timezone = null,}) {
  return _then(_WeatherDataApi(
hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as Hourly,daily: null == daily ? _self.daily : daily // ignore: cast_nullable_to_non_nullable
as Daily,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyCopyWith<$Res> get hourly {
  
  return $HourlyCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}/// Create a copy of WeatherDataApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyCopyWith<$Res> get daily {
  
  return $DailyCopyWith<$Res>(_self.daily, (value) {
    return _then(_self.copyWith(daily: value));
  });
}
}


/// @nodoc
mixin _$Hourly {

 List<String>? get time;@JsonKey(name: 'weathercode') List<int>? get weatherCode;@JsonKey(name: 'temperature_2m') List<double>? get temperature2M;@JsonKey(name: 'apparent_temperature') List<double?>? get apparentTemperature; List<double?>? get precipitation; List<double?>? get rain;@JsonKey(name: 'relativehumidity_2m') List<int?>? get relativeHumidity2M;@JsonKey(name: 'surface_pressure') List<double?>? get surfacePressure; List<double?>? get visibility; List<double?>? get evapotranspiration;@JsonKey(name: 'windspeed_10m') List<double?>? get windSpeed10M;@JsonKey(name: 'winddirection_10m') List<int?>? get windDirection10M;@JsonKey(name: 'windgusts_10m') List<double?>? get windGusts10M;@JsonKey(name: 'cloudcover') List<int?>? get cloudCover;@JsonKey(name: 'uv_index') List<double?>? get uvIndex;@JsonKey(name: 'dewpoint_2m') List<double?>? get dewpoint2M;@JsonKey(name: 'precipitation_probability') List<int?>? get precipitationProbability;@JsonKey(name: 'shortwave_radiation') List<double?>? get shortwaveRadiation;
/// Create a copy of Hourly
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourlyCopyWith<Hourly> get copyWith => _$HourlyCopyWithImpl<Hourly>(this as Hourly, _$identity);

  /// Serializes this Hourly to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hourly&&const DeepCollectionEquality().equals(other.time, time)&&const DeepCollectionEquality().equals(other.weatherCode, weatherCode)&&const DeepCollectionEquality().equals(other.temperature2M, temperature2M)&&const DeepCollectionEquality().equals(other.apparentTemperature, apparentTemperature)&&const DeepCollectionEquality().equals(other.precipitation, precipitation)&&const DeepCollectionEquality().equals(other.rain, rain)&&const DeepCollectionEquality().equals(other.relativeHumidity2M, relativeHumidity2M)&&const DeepCollectionEquality().equals(other.surfacePressure, surfacePressure)&&const DeepCollectionEquality().equals(other.visibility, visibility)&&const DeepCollectionEquality().equals(other.evapotranspiration, evapotranspiration)&&const DeepCollectionEquality().equals(other.windSpeed10M, windSpeed10M)&&const DeepCollectionEquality().equals(other.windDirection10M, windDirection10M)&&const DeepCollectionEquality().equals(other.windGusts10M, windGusts10M)&&const DeepCollectionEquality().equals(other.cloudCover, cloudCover)&&const DeepCollectionEquality().equals(other.uvIndex, uvIndex)&&const DeepCollectionEquality().equals(other.dewpoint2M, dewpoint2M)&&const DeepCollectionEquality().equals(other.precipitationProbability, precipitationProbability)&&const DeepCollectionEquality().equals(other.shortwaveRadiation, shortwaveRadiation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(time),const DeepCollectionEquality().hash(weatherCode),const DeepCollectionEquality().hash(temperature2M),const DeepCollectionEquality().hash(apparentTemperature),const DeepCollectionEquality().hash(precipitation),const DeepCollectionEquality().hash(rain),const DeepCollectionEquality().hash(relativeHumidity2M),const DeepCollectionEquality().hash(surfacePressure),const DeepCollectionEquality().hash(visibility),const DeepCollectionEquality().hash(evapotranspiration),const DeepCollectionEquality().hash(windSpeed10M),const DeepCollectionEquality().hash(windDirection10M),const DeepCollectionEquality().hash(windGusts10M),const DeepCollectionEquality().hash(cloudCover),const DeepCollectionEquality().hash(uvIndex),const DeepCollectionEquality().hash(dewpoint2M),const DeepCollectionEquality().hash(precipitationProbability),const DeepCollectionEquality().hash(shortwaveRadiation));

@override
String toString() {
  return 'Hourly(time: $time, weatherCode: $weatherCode, temperature2M: $temperature2M, apparentTemperature: $apparentTemperature, precipitation: $precipitation, rain: $rain, relativeHumidity2M: $relativeHumidity2M, surfacePressure: $surfacePressure, visibility: $visibility, evapotranspiration: $evapotranspiration, windSpeed10M: $windSpeed10M, windDirection10M: $windDirection10M, windGusts10M: $windGusts10M, cloudCover: $cloudCover, uvIndex: $uvIndex, dewpoint2M: $dewpoint2M, precipitationProbability: $precipitationProbability, shortwaveRadiation: $shortwaveRadiation)';
}


}

/// @nodoc
abstract mixin class $HourlyCopyWith<$Res>  {
  factory $HourlyCopyWith(Hourly value, $Res Function(Hourly) _then) = _$HourlyCopyWithImpl;
@useResult
$Res call({
 List<String>? time,@JsonKey(name: 'weathercode') List<int>? weatherCode,@JsonKey(name: 'temperature_2m') List<double>? temperature2M,@JsonKey(name: 'apparent_temperature') List<double?>? apparentTemperature, List<double?>? precipitation, List<double?>? rain,@JsonKey(name: 'relativehumidity_2m') List<int?>? relativeHumidity2M,@JsonKey(name: 'surface_pressure') List<double?>? surfacePressure, List<double?>? visibility, List<double?>? evapotranspiration,@JsonKey(name: 'windspeed_10m') List<double?>? windSpeed10M,@JsonKey(name: 'winddirection_10m') List<int?>? windDirection10M,@JsonKey(name: 'windgusts_10m') List<double?>? windGusts10M,@JsonKey(name: 'cloudcover') List<int?>? cloudCover,@JsonKey(name: 'uv_index') List<double?>? uvIndex,@JsonKey(name: 'dewpoint_2m') List<double?>? dewpoint2M,@JsonKey(name: 'precipitation_probability') List<int?>? precipitationProbability,@JsonKey(name: 'shortwave_radiation') List<double?>? shortwaveRadiation
});




}
/// @nodoc
class _$HourlyCopyWithImpl<$Res>
    implements $HourlyCopyWith<$Res> {
  _$HourlyCopyWithImpl(this._self, this._then);

  final Hourly _self;
  final $Res Function(Hourly) _then;

/// Create a copy of Hourly
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = freezed,Object? weatherCode = freezed,Object? temperature2M = freezed,Object? apparentTemperature = freezed,Object? precipitation = freezed,Object? rain = freezed,Object? relativeHumidity2M = freezed,Object? surfacePressure = freezed,Object? visibility = freezed,Object? evapotranspiration = freezed,Object? windSpeed10M = freezed,Object? windDirection10M = freezed,Object? windGusts10M = freezed,Object? cloudCover = freezed,Object? uvIndex = freezed,Object? dewpoint2M = freezed,Object? precipitationProbability = freezed,Object? shortwaveRadiation = freezed,}) {
  return _then(_self.copyWith(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,weatherCode: freezed == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int>?,temperature2M: freezed == temperature2M ? _self.temperature2M : temperature2M // ignore: cast_nullable_to_non_nullable
as List<double>?,apparentTemperature: freezed == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitation: freezed == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as List<double?>?,rain: freezed == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as List<double?>?,relativeHumidity2M: freezed == relativeHumidity2M ? _self.relativeHumidity2M : relativeHumidity2M // ignore: cast_nullable_to_non_nullable
as List<int?>?,surfacePressure: freezed == surfacePressure ? _self.surfacePressure : surfacePressure // ignore: cast_nullable_to_non_nullable
as List<double?>?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as List<double?>?,evapotranspiration: freezed == evapotranspiration ? _self.evapotranspiration : evapotranspiration // ignore: cast_nullable_to_non_nullable
as List<double?>?,windSpeed10M: freezed == windSpeed10M ? _self.windSpeed10M : windSpeed10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,windDirection10M: freezed == windDirection10M ? _self.windDirection10M : windDirection10M // ignore: cast_nullable_to_non_nullable
as List<int?>?,windGusts10M: freezed == windGusts10M ? _self.windGusts10M : windGusts10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,cloudCover: freezed == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as List<int?>?,uvIndex: freezed == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as List<double?>?,dewpoint2M: freezed == dewpoint2M ? _self.dewpoint2M : dewpoint2M // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationProbability: freezed == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<int?>?,shortwaveRadiation: freezed == shortwaveRadiation ? _self.shortwaveRadiation : shortwaveRadiation // ignore: cast_nullable_to_non_nullable
as List<double?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Hourly].
extension HourlyPatterns on Hourly {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hourly value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hourly() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hourly value)  $default,){
final _that = this;
switch (_that) {
case _Hourly():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hourly value)?  $default,){
final _that = this;
switch (_that) {
case _Hourly() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? time, @JsonKey(name: 'weathercode')  List<int>? weatherCode, @JsonKey(name: 'temperature_2m')  List<double>? temperature2M, @JsonKey(name: 'apparent_temperature')  List<double?>? apparentTemperature,  List<double?>? precipitation,  List<double?>? rain, @JsonKey(name: 'relativehumidity_2m')  List<int?>? relativeHumidity2M, @JsonKey(name: 'surface_pressure')  List<double?>? surfacePressure,  List<double?>? visibility,  List<double?>? evapotranspiration, @JsonKey(name: 'windspeed_10m')  List<double?>? windSpeed10M, @JsonKey(name: 'winddirection_10m')  List<int?>? windDirection10M, @JsonKey(name: 'windgusts_10m')  List<double?>? windGusts10M, @JsonKey(name: 'cloudcover')  List<int?>? cloudCover, @JsonKey(name: 'uv_index')  List<double?>? uvIndex, @JsonKey(name: 'dewpoint_2m')  List<double?>? dewpoint2M, @JsonKey(name: 'precipitation_probability')  List<int?>? precipitationProbability, @JsonKey(name: 'shortwave_radiation')  List<double?>? shortwaveRadiation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hourly() when $default != null:
return $default(_that.time,_that.weatherCode,_that.temperature2M,_that.apparentTemperature,_that.precipitation,_that.rain,_that.relativeHumidity2M,_that.surfacePressure,_that.visibility,_that.evapotranspiration,_that.windSpeed10M,_that.windDirection10M,_that.windGusts10M,_that.cloudCover,_that.uvIndex,_that.dewpoint2M,_that.precipitationProbability,_that.shortwaveRadiation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? time, @JsonKey(name: 'weathercode')  List<int>? weatherCode, @JsonKey(name: 'temperature_2m')  List<double>? temperature2M, @JsonKey(name: 'apparent_temperature')  List<double?>? apparentTemperature,  List<double?>? precipitation,  List<double?>? rain, @JsonKey(name: 'relativehumidity_2m')  List<int?>? relativeHumidity2M, @JsonKey(name: 'surface_pressure')  List<double?>? surfacePressure,  List<double?>? visibility,  List<double?>? evapotranspiration, @JsonKey(name: 'windspeed_10m')  List<double?>? windSpeed10M, @JsonKey(name: 'winddirection_10m')  List<int?>? windDirection10M, @JsonKey(name: 'windgusts_10m')  List<double?>? windGusts10M, @JsonKey(name: 'cloudcover')  List<int?>? cloudCover, @JsonKey(name: 'uv_index')  List<double?>? uvIndex, @JsonKey(name: 'dewpoint_2m')  List<double?>? dewpoint2M, @JsonKey(name: 'precipitation_probability')  List<int?>? precipitationProbability, @JsonKey(name: 'shortwave_radiation')  List<double?>? shortwaveRadiation)  $default,) {final _that = this;
switch (_that) {
case _Hourly():
return $default(_that.time,_that.weatherCode,_that.temperature2M,_that.apparentTemperature,_that.precipitation,_that.rain,_that.relativeHumidity2M,_that.surfacePressure,_that.visibility,_that.evapotranspiration,_that.windSpeed10M,_that.windDirection10M,_that.windGusts10M,_that.cloudCover,_that.uvIndex,_that.dewpoint2M,_that.precipitationProbability,_that.shortwaveRadiation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? time, @JsonKey(name: 'weathercode')  List<int>? weatherCode, @JsonKey(name: 'temperature_2m')  List<double>? temperature2M, @JsonKey(name: 'apparent_temperature')  List<double?>? apparentTemperature,  List<double?>? precipitation,  List<double?>? rain, @JsonKey(name: 'relativehumidity_2m')  List<int?>? relativeHumidity2M, @JsonKey(name: 'surface_pressure')  List<double?>? surfacePressure,  List<double?>? visibility,  List<double?>? evapotranspiration, @JsonKey(name: 'windspeed_10m')  List<double?>? windSpeed10M, @JsonKey(name: 'winddirection_10m')  List<int?>? windDirection10M, @JsonKey(name: 'windgusts_10m')  List<double?>? windGusts10M, @JsonKey(name: 'cloudcover')  List<int?>? cloudCover, @JsonKey(name: 'uv_index')  List<double?>? uvIndex, @JsonKey(name: 'dewpoint_2m')  List<double?>? dewpoint2M, @JsonKey(name: 'precipitation_probability')  List<int?>? precipitationProbability, @JsonKey(name: 'shortwave_radiation')  List<double?>? shortwaveRadiation)?  $default,) {final _that = this;
switch (_that) {
case _Hourly() when $default != null:
return $default(_that.time,_that.weatherCode,_that.temperature2M,_that.apparentTemperature,_that.precipitation,_that.rain,_that.relativeHumidity2M,_that.surfacePressure,_that.visibility,_that.evapotranspiration,_that.windSpeed10M,_that.windDirection10M,_that.windGusts10M,_that.cloudCover,_that.uvIndex,_that.dewpoint2M,_that.precipitationProbability,_that.shortwaveRadiation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hourly implements Hourly {
  const _Hourly({final  List<String>? time, @JsonKey(name: 'weathercode') final  List<int>? weatherCode, @JsonKey(name: 'temperature_2m') final  List<double>? temperature2M, @JsonKey(name: 'apparent_temperature') final  List<double?>? apparentTemperature, final  List<double?>? precipitation, final  List<double?>? rain, @JsonKey(name: 'relativehumidity_2m') final  List<int?>? relativeHumidity2M, @JsonKey(name: 'surface_pressure') final  List<double?>? surfacePressure, final  List<double?>? visibility, final  List<double?>? evapotranspiration, @JsonKey(name: 'windspeed_10m') final  List<double?>? windSpeed10M, @JsonKey(name: 'winddirection_10m') final  List<int?>? windDirection10M, @JsonKey(name: 'windgusts_10m') final  List<double?>? windGusts10M, @JsonKey(name: 'cloudcover') final  List<int?>? cloudCover, @JsonKey(name: 'uv_index') final  List<double?>? uvIndex, @JsonKey(name: 'dewpoint_2m') final  List<double?>? dewpoint2M, @JsonKey(name: 'precipitation_probability') final  List<int?>? precipitationProbability, @JsonKey(name: 'shortwave_radiation') final  List<double?>? shortwaveRadiation}): _time = time,_weatherCode = weatherCode,_temperature2M = temperature2M,_apparentTemperature = apparentTemperature,_precipitation = precipitation,_rain = rain,_relativeHumidity2M = relativeHumidity2M,_surfacePressure = surfacePressure,_visibility = visibility,_evapotranspiration = evapotranspiration,_windSpeed10M = windSpeed10M,_windDirection10M = windDirection10M,_windGusts10M = windGusts10M,_cloudCover = cloudCover,_uvIndex = uvIndex,_dewpoint2M = dewpoint2M,_precipitationProbability = precipitationProbability,_shortwaveRadiation = shortwaveRadiation;
  factory _Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

 final  List<String>? _time;
@override List<String>? get time {
  final value = _time;
  if (value == null) return null;
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _weatherCode;
@override@JsonKey(name: 'weathercode') List<int>? get weatherCode {
  final value = _weatherCode;
  if (value == null) return null;
  if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double>? _temperature2M;
@override@JsonKey(name: 'temperature_2m') List<double>? get temperature2M {
  final value = _temperature2M;
  if (value == null) return null;
  if (_temperature2M is EqualUnmodifiableListView) return _temperature2M;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _apparentTemperature;
@override@JsonKey(name: 'apparent_temperature') List<double?>? get apparentTemperature {
  final value = _apparentTemperature;
  if (value == null) return null;
  if (_apparentTemperature is EqualUnmodifiableListView) return _apparentTemperature;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _precipitation;
@override List<double?>? get precipitation {
  final value = _precipitation;
  if (value == null) return null;
  if (_precipitation is EqualUnmodifiableListView) return _precipitation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _rain;
@override List<double?>? get rain {
  final value = _rain;
  if (value == null) return null;
  if (_rain is EqualUnmodifiableListView) return _rain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int?>? _relativeHumidity2M;
@override@JsonKey(name: 'relativehumidity_2m') List<int?>? get relativeHumidity2M {
  final value = _relativeHumidity2M;
  if (value == null) return null;
  if (_relativeHumidity2M is EqualUnmodifiableListView) return _relativeHumidity2M;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _surfacePressure;
@override@JsonKey(name: 'surface_pressure') List<double?>? get surfacePressure {
  final value = _surfacePressure;
  if (value == null) return null;
  if (_surfacePressure is EqualUnmodifiableListView) return _surfacePressure;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _visibility;
@override List<double?>? get visibility {
  final value = _visibility;
  if (value == null) return null;
  if (_visibility is EqualUnmodifiableListView) return _visibility;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _evapotranspiration;
@override List<double?>? get evapotranspiration {
  final value = _evapotranspiration;
  if (value == null) return null;
  if (_evapotranspiration is EqualUnmodifiableListView) return _evapotranspiration;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _windSpeed10M;
@override@JsonKey(name: 'windspeed_10m') List<double?>? get windSpeed10M {
  final value = _windSpeed10M;
  if (value == null) return null;
  if (_windSpeed10M is EqualUnmodifiableListView) return _windSpeed10M;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int?>? _windDirection10M;
@override@JsonKey(name: 'winddirection_10m') List<int?>? get windDirection10M {
  final value = _windDirection10M;
  if (value == null) return null;
  if (_windDirection10M is EqualUnmodifiableListView) return _windDirection10M;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _windGusts10M;
@override@JsonKey(name: 'windgusts_10m') List<double?>? get windGusts10M {
  final value = _windGusts10M;
  if (value == null) return null;
  if (_windGusts10M is EqualUnmodifiableListView) return _windGusts10M;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int?>? _cloudCover;
@override@JsonKey(name: 'cloudcover') List<int?>? get cloudCover {
  final value = _cloudCover;
  if (value == null) return null;
  if (_cloudCover is EqualUnmodifiableListView) return _cloudCover;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _uvIndex;
@override@JsonKey(name: 'uv_index') List<double?>? get uvIndex {
  final value = _uvIndex;
  if (value == null) return null;
  if (_uvIndex is EqualUnmodifiableListView) return _uvIndex;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _dewpoint2M;
@override@JsonKey(name: 'dewpoint_2m') List<double?>? get dewpoint2M {
  final value = _dewpoint2M;
  if (value == null) return null;
  if (_dewpoint2M is EqualUnmodifiableListView) return _dewpoint2M;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int?>? _precipitationProbability;
@override@JsonKey(name: 'precipitation_probability') List<int?>? get precipitationProbability {
  final value = _precipitationProbability;
  if (value == null) return null;
  if (_precipitationProbability is EqualUnmodifiableListView) return _precipitationProbability;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _shortwaveRadiation;
@override@JsonKey(name: 'shortwave_radiation') List<double?>? get shortwaveRadiation {
  final value = _shortwaveRadiation;
  if (value == null) return null;
  if (_shortwaveRadiation is EqualUnmodifiableListView) return _shortwaveRadiation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Hourly
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourlyCopyWith<_Hourly> get copyWith => __$HourlyCopyWithImpl<_Hourly>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HourlyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hourly&&const DeepCollectionEquality().equals(other._time, _time)&&const DeepCollectionEquality().equals(other._weatherCode, _weatherCode)&&const DeepCollectionEquality().equals(other._temperature2M, _temperature2M)&&const DeepCollectionEquality().equals(other._apparentTemperature, _apparentTemperature)&&const DeepCollectionEquality().equals(other._precipitation, _precipitation)&&const DeepCollectionEquality().equals(other._rain, _rain)&&const DeepCollectionEquality().equals(other._relativeHumidity2M, _relativeHumidity2M)&&const DeepCollectionEquality().equals(other._surfacePressure, _surfacePressure)&&const DeepCollectionEquality().equals(other._visibility, _visibility)&&const DeepCollectionEquality().equals(other._evapotranspiration, _evapotranspiration)&&const DeepCollectionEquality().equals(other._windSpeed10M, _windSpeed10M)&&const DeepCollectionEquality().equals(other._windDirection10M, _windDirection10M)&&const DeepCollectionEquality().equals(other._windGusts10M, _windGusts10M)&&const DeepCollectionEquality().equals(other._cloudCover, _cloudCover)&&const DeepCollectionEquality().equals(other._uvIndex, _uvIndex)&&const DeepCollectionEquality().equals(other._dewpoint2M, _dewpoint2M)&&const DeepCollectionEquality().equals(other._precipitationProbability, _precipitationProbability)&&const DeepCollectionEquality().equals(other._shortwaveRadiation, _shortwaveRadiation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_weatherCode),const DeepCollectionEquality().hash(_temperature2M),const DeepCollectionEquality().hash(_apparentTemperature),const DeepCollectionEquality().hash(_precipitation),const DeepCollectionEquality().hash(_rain),const DeepCollectionEquality().hash(_relativeHumidity2M),const DeepCollectionEquality().hash(_surfacePressure),const DeepCollectionEquality().hash(_visibility),const DeepCollectionEquality().hash(_evapotranspiration),const DeepCollectionEquality().hash(_windSpeed10M),const DeepCollectionEquality().hash(_windDirection10M),const DeepCollectionEquality().hash(_windGusts10M),const DeepCollectionEquality().hash(_cloudCover),const DeepCollectionEquality().hash(_uvIndex),const DeepCollectionEquality().hash(_dewpoint2M),const DeepCollectionEquality().hash(_precipitationProbability),const DeepCollectionEquality().hash(_shortwaveRadiation));

@override
String toString() {
  return 'Hourly(time: $time, weatherCode: $weatherCode, temperature2M: $temperature2M, apparentTemperature: $apparentTemperature, precipitation: $precipitation, rain: $rain, relativeHumidity2M: $relativeHumidity2M, surfacePressure: $surfacePressure, visibility: $visibility, evapotranspiration: $evapotranspiration, windSpeed10M: $windSpeed10M, windDirection10M: $windDirection10M, windGusts10M: $windGusts10M, cloudCover: $cloudCover, uvIndex: $uvIndex, dewpoint2M: $dewpoint2M, precipitationProbability: $precipitationProbability, shortwaveRadiation: $shortwaveRadiation)';
}


}

/// @nodoc
abstract mixin class _$HourlyCopyWith<$Res> implements $HourlyCopyWith<$Res> {
  factory _$HourlyCopyWith(_Hourly value, $Res Function(_Hourly) _then) = __$HourlyCopyWithImpl;
@override @useResult
$Res call({
 List<String>? time,@JsonKey(name: 'weathercode') List<int>? weatherCode,@JsonKey(name: 'temperature_2m') List<double>? temperature2M,@JsonKey(name: 'apparent_temperature') List<double?>? apparentTemperature, List<double?>? precipitation, List<double?>? rain,@JsonKey(name: 'relativehumidity_2m') List<int?>? relativeHumidity2M,@JsonKey(name: 'surface_pressure') List<double?>? surfacePressure, List<double?>? visibility, List<double?>? evapotranspiration,@JsonKey(name: 'windspeed_10m') List<double?>? windSpeed10M,@JsonKey(name: 'winddirection_10m') List<int?>? windDirection10M,@JsonKey(name: 'windgusts_10m') List<double?>? windGusts10M,@JsonKey(name: 'cloudcover') List<int?>? cloudCover,@JsonKey(name: 'uv_index') List<double?>? uvIndex,@JsonKey(name: 'dewpoint_2m') List<double?>? dewpoint2M,@JsonKey(name: 'precipitation_probability') List<int?>? precipitationProbability,@JsonKey(name: 'shortwave_radiation') List<double?>? shortwaveRadiation
});




}
/// @nodoc
class __$HourlyCopyWithImpl<$Res>
    implements _$HourlyCopyWith<$Res> {
  __$HourlyCopyWithImpl(this._self, this._then);

  final _Hourly _self;
  final $Res Function(_Hourly) _then;

/// Create a copy of Hourly
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? weatherCode = freezed,Object? temperature2M = freezed,Object? apparentTemperature = freezed,Object? precipitation = freezed,Object? rain = freezed,Object? relativeHumidity2M = freezed,Object? surfacePressure = freezed,Object? visibility = freezed,Object? evapotranspiration = freezed,Object? windSpeed10M = freezed,Object? windDirection10M = freezed,Object? windGusts10M = freezed,Object? cloudCover = freezed,Object? uvIndex = freezed,Object? dewpoint2M = freezed,Object? precipitationProbability = freezed,Object? shortwaveRadiation = freezed,}) {
  return _then(_Hourly(
time: freezed == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,weatherCode: freezed == weatherCode ? _self._weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int>?,temperature2M: freezed == temperature2M ? _self._temperature2M : temperature2M // ignore: cast_nullable_to_non_nullable
as List<double>?,apparentTemperature: freezed == apparentTemperature ? _self._apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitation: freezed == precipitation ? _self._precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as List<double?>?,rain: freezed == rain ? _self._rain : rain // ignore: cast_nullable_to_non_nullable
as List<double?>?,relativeHumidity2M: freezed == relativeHumidity2M ? _self._relativeHumidity2M : relativeHumidity2M // ignore: cast_nullable_to_non_nullable
as List<int?>?,surfacePressure: freezed == surfacePressure ? _self._surfacePressure : surfacePressure // ignore: cast_nullable_to_non_nullable
as List<double?>?,visibility: freezed == visibility ? _self._visibility : visibility // ignore: cast_nullable_to_non_nullable
as List<double?>?,evapotranspiration: freezed == evapotranspiration ? _self._evapotranspiration : evapotranspiration // ignore: cast_nullable_to_non_nullable
as List<double?>?,windSpeed10M: freezed == windSpeed10M ? _self._windSpeed10M : windSpeed10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,windDirection10M: freezed == windDirection10M ? _self._windDirection10M : windDirection10M // ignore: cast_nullable_to_non_nullable
as List<int?>?,windGusts10M: freezed == windGusts10M ? _self._windGusts10M : windGusts10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,cloudCover: freezed == cloudCover ? _self._cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as List<int?>?,uvIndex: freezed == uvIndex ? _self._uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as List<double?>?,dewpoint2M: freezed == dewpoint2M ? _self._dewpoint2M : dewpoint2M // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationProbability: freezed == precipitationProbability ? _self._precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<int?>?,shortwaveRadiation: freezed == shortwaveRadiation ? _self._shortwaveRadiation : shortwaveRadiation // ignore: cast_nullable_to_non_nullable
as List<double?>?,
  ));
}


}


/// @nodoc
mixin _$Daily {

@JsonKey(fromJson: _dateTimeFromJson) List<DateTime>? get time;@JsonKey(name: 'weathercode') List<int?>? get weatherCode;@JsonKey(name: 'temperature_2m_max') List<double?>? get temperature2MMax;@JsonKey(name: 'temperature_2m_min') List<double?>? get temperature2MMin;@JsonKey(name: 'apparent_temperature_max') List<double?>? get apparentTemperatureMax;@JsonKey(name: 'apparent_temperature_min') List<double?>? get apparentTemperatureMin;@JsonKey(name: 'precipitation_sum') List<double?>? get precipitationSum; List<String>? get sunrise; List<String>? get sunset;@JsonKey(name: 'precipitation_probability_max') List<int?>? get precipitationProbabilityMax;@JsonKey(name: 'windspeed_10m_max') List<double?>? get windSpeed10MMax;@JsonKey(name: 'windgusts_10m_max') List<double?>? get windGusts10MMax;@JsonKey(name: 'uv_index_max') List<double?>? get uvIndexMax;@JsonKey(name: 'rain_sum') List<double?>? get rainSum;@JsonKey(name: 'winddirection_10m_dominant') List<int?>? get windDirection10MDominant;
/// Create a copy of Daily
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyCopyWith<Daily> get copyWith => _$DailyCopyWithImpl<Daily>(this as Daily, _$identity);

  /// Serializes this Daily to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Daily&&const DeepCollectionEquality().equals(other.time, time)&&const DeepCollectionEquality().equals(other.weatherCode, weatherCode)&&const DeepCollectionEquality().equals(other.temperature2MMax, temperature2MMax)&&const DeepCollectionEquality().equals(other.temperature2MMin, temperature2MMin)&&const DeepCollectionEquality().equals(other.apparentTemperatureMax, apparentTemperatureMax)&&const DeepCollectionEquality().equals(other.apparentTemperatureMin, apparentTemperatureMin)&&const DeepCollectionEquality().equals(other.precipitationSum, precipitationSum)&&const DeepCollectionEquality().equals(other.sunrise, sunrise)&&const DeepCollectionEquality().equals(other.sunset, sunset)&&const DeepCollectionEquality().equals(other.precipitationProbabilityMax, precipitationProbabilityMax)&&const DeepCollectionEquality().equals(other.windSpeed10MMax, windSpeed10MMax)&&const DeepCollectionEquality().equals(other.windGusts10MMax, windGusts10MMax)&&const DeepCollectionEquality().equals(other.uvIndexMax, uvIndexMax)&&const DeepCollectionEquality().equals(other.rainSum, rainSum)&&const DeepCollectionEquality().equals(other.windDirection10MDominant, windDirection10MDominant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(time),const DeepCollectionEquality().hash(weatherCode),const DeepCollectionEquality().hash(temperature2MMax),const DeepCollectionEquality().hash(temperature2MMin),const DeepCollectionEquality().hash(apparentTemperatureMax),const DeepCollectionEquality().hash(apparentTemperatureMin),const DeepCollectionEquality().hash(precipitationSum),const DeepCollectionEquality().hash(sunrise),const DeepCollectionEquality().hash(sunset),const DeepCollectionEquality().hash(precipitationProbabilityMax),const DeepCollectionEquality().hash(windSpeed10MMax),const DeepCollectionEquality().hash(windGusts10MMax),const DeepCollectionEquality().hash(uvIndexMax),const DeepCollectionEquality().hash(rainSum),const DeepCollectionEquality().hash(windDirection10MDominant));

@override
String toString() {
  return 'Daily(time: $time, weatherCode: $weatherCode, temperature2MMax: $temperature2MMax, temperature2MMin: $temperature2MMin, apparentTemperatureMax: $apparentTemperatureMax, apparentTemperatureMin: $apparentTemperatureMin, precipitationSum: $precipitationSum, sunrise: $sunrise, sunset: $sunset, precipitationProbabilityMax: $precipitationProbabilityMax, windSpeed10MMax: $windSpeed10MMax, windGusts10MMax: $windGusts10MMax, uvIndexMax: $uvIndexMax, rainSum: $rainSum, windDirection10MDominant: $windDirection10MDominant)';
}


}

/// @nodoc
abstract mixin class $DailyCopyWith<$Res>  {
  factory $DailyCopyWith(Daily value, $Res Function(Daily) _then) = _$DailyCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _dateTimeFromJson) List<DateTime>? time,@JsonKey(name: 'weathercode') List<int?>? weatherCode,@JsonKey(name: 'temperature_2m_max') List<double?>? temperature2MMax,@JsonKey(name: 'temperature_2m_min') List<double?>? temperature2MMin,@JsonKey(name: 'apparent_temperature_max') List<double?>? apparentTemperatureMax,@JsonKey(name: 'apparent_temperature_min') List<double?>? apparentTemperatureMin,@JsonKey(name: 'precipitation_sum') List<double?>? precipitationSum, List<String>? sunrise, List<String>? sunset,@JsonKey(name: 'precipitation_probability_max') List<int?>? precipitationProbabilityMax,@JsonKey(name: 'windspeed_10m_max') List<double?>? windSpeed10MMax,@JsonKey(name: 'windgusts_10m_max') List<double?>? windGusts10MMax,@JsonKey(name: 'uv_index_max') List<double?>? uvIndexMax,@JsonKey(name: 'rain_sum') List<double?>? rainSum,@JsonKey(name: 'winddirection_10m_dominant') List<int?>? windDirection10MDominant
});




}
/// @nodoc
class _$DailyCopyWithImpl<$Res>
    implements $DailyCopyWith<$Res> {
  _$DailyCopyWithImpl(this._self, this._then);

  final Daily _self;
  final $Res Function(Daily) _then;

/// Create a copy of Daily
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = freezed,Object? weatherCode = freezed,Object? temperature2MMax = freezed,Object? temperature2MMin = freezed,Object? apparentTemperatureMax = freezed,Object? apparentTemperatureMin = freezed,Object? precipitationSum = freezed,Object? sunrise = freezed,Object? sunset = freezed,Object? precipitationProbabilityMax = freezed,Object? windSpeed10MMax = freezed,Object? windGusts10MMax = freezed,Object? uvIndexMax = freezed,Object? rainSum = freezed,Object? windDirection10MDominant = freezed,}) {
  return _then(_self.copyWith(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<DateTime>?,weatherCode: freezed == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int?>?,temperature2MMax: freezed == temperature2MMax ? _self.temperature2MMax : temperature2MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,temperature2MMin: freezed == temperature2MMin ? _self.temperature2MMin : temperature2MMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMax: freezed == apparentTemperatureMax ? _self.apparentTemperatureMax : apparentTemperatureMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMin: freezed == apparentTemperatureMin ? _self.apparentTemperatureMin : apparentTemperatureMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationSum: freezed == precipitationSum ? _self.precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<String>?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<String>?,precipitationProbabilityMax: freezed == precipitationProbabilityMax ? _self.precipitationProbabilityMax : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
as List<int?>?,windSpeed10MMax: freezed == windSpeed10MMax ? _self.windSpeed10MMax : windSpeed10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,windGusts10MMax: freezed == windGusts10MMax ? _self.windGusts10MMax : windGusts10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,uvIndexMax: freezed == uvIndexMax ? _self.uvIndexMax : uvIndexMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,rainSum: freezed == rainSum ? _self.rainSum : rainSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,windDirection10MDominant: freezed == windDirection10MDominant ? _self.windDirection10MDominant : windDirection10MDominant // ignore: cast_nullable_to_non_nullable
as List<int?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Daily].
extension DailyPatterns on Daily {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Daily value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Daily() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Daily value)  $default,){
final _that = this;
switch (_that) {
case _Daily():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Daily value)?  $default,){
final _that = this;
switch (_that) {
case _Daily() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _dateTimeFromJson)  List<DateTime>? time, @JsonKey(name: 'weathercode')  List<int?>? weatherCode, @JsonKey(name: 'temperature_2m_max')  List<double?>? temperature2MMax, @JsonKey(name: 'temperature_2m_min')  List<double?>? temperature2MMin, @JsonKey(name: 'apparent_temperature_max')  List<double?>? apparentTemperatureMax, @JsonKey(name: 'apparent_temperature_min')  List<double?>? apparentTemperatureMin, @JsonKey(name: 'precipitation_sum')  List<double?>? precipitationSum,  List<String>? sunrise,  List<String>? sunset, @JsonKey(name: 'precipitation_probability_max')  List<int?>? precipitationProbabilityMax, @JsonKey(name: 'windspeed_10m_max')  List<double?>? windSpeed10MMax, @JsonKey(name: 'windgusts_10m_max')  List<double?>? windGusts10MMax, @JsonKey(name: 'uv_index_max')  List<double?>? uvIndexMax, @JsonKey(name: 'rain_sum')  List<double?>? rainSum, @JsonKey(name: 'winddirection_10m_dominant')  List<int?>? windDirection10MDominant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Daily() when $default != null:
return $default(_that.time,_that.weatherCode,_that.temperature2MMax,_that.temperature2MMin,_that.apparentTemperatureMax,_that.apparentTemperatureMin,_that.precipitationSum,_that.sunrise,_that.sunset,_that.precipitationProbabilityMax,_that.windSpeed10MMax,_that.windGusts10MMax,_that.uvIndexMax,_that.rainSum,_that.windDirection10MDominant);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _dateTimeFromJson)  List<DateTime>? time, @JsonKey(name: 'weathercode')  List<int?>? weatherCode, @JsonKey(name: 'temperature_2m_max')  List<double?>? temperature2MMax, @JsonKey(name: 'temperature_2m_min')  List<double?>? temperature2MMin, @JsonKey(name: 'apparent_temperature_max')  List<double?>? apparentTemperatureMax, @JsonKey(name: 'apparent_temperature_min')  List<double?>? apparentTemperatureMin, @JsonKey(name: 'precipitation_sum')  List<double?>? precipitationSum,  List<String>? sunrise,  List<String>? sunset, @JsonKey(name: 'precipitation_probability_max')  List<int?>? precipitationProbabilityMax, @JsonKey(name: 'windspeed_10m_max')  List<double?>? windSpeed10MMax, @JsonKey(name: 'windgusts_10m_max')  List<double?>? windGusts10MMax, @JsonKey(name: 'uv_index_max')  List<double?>? uvIndexMax, @JsonKey(name: 'rain_sum')  List<double?>? rainSum, @JsonKey(name: 'winddirection_10m_dominant')  List<int?>? windDirection10MDominant)  $default,) {final _that = this;
switch (_that) {
case _Daily():
return $default(_that.time,_that.weatherCode,_that.temperature2MMax,_that.temperature2MMin,_that.apparentTemperatureMax,_that.apparentTemperatureMin,_that.precipitationSum,_that.sunrise,_that.sunset,_that.precipitationProbabilityMax,_that.windSpeed10MMax,_that.windGusts10MMax,_that.uvIndexMax,_that.rainSum,_that.windDirection10MDominant);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _dateTimeFromJson)  List<DateTime>? time, @JsonKey(name: 'weathercode')  List<int?>? weatherCode, @JsonKey(name: 'temperature_2m_max')  List<double?>? temperature2MMax, @JsonKey(name: 'temperature_2m_min')  List<double?>? temperature2MMin, @JsonKey(name: 'apparent_temperature_max')  List<double?>? apparentTemperatureMax, @JsonKey(name: 'apparent_temperature_min')  List<double?>? apparentTemperatureMin, @JsonKey(name: 'precipitation_sum')  List<double?>? precipitationSum,  List<String>? sunrise,  List<String>? sunset, @JsonKey(name: 'precipitation_probability_max')  List<int?>? precipitationProbabilityMax, @JsonKey(name: 'windspeed_10m_max')  List<double?>? windSpeed10MMax, @JsonKey(name: 'windgusts_10m_max')  List<double?>? windGusts10MMax, @JsonKey(name: 'uv_index_max')  List<double?>? uvIndexMax, @JsonKey(name: 'rain_sum')  List<double?>? rainSum, @JsonKey(name: 'winddirection_10m_dominant')  List<int?>? windDirection10MDominant)?  $default,) {final _that = this;
switch (_that) {
case _Daily() when $default != null:
return $default(_that.time,_that.weatherCode,_that.temperature2MMax,_that.temperature2MMin,_that.apparentTemperatureMax,_that.apparentTemperatureMin,_that.precipitationSum,_that.sunrise,_that.sunset,_that.precipitationProbabilityMax,_that.windSpeed10MMax,_that.windGusts10MMax,_that.uvIndexMax,_that.rainSum,_that.windDirection10MDominant);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Daily implements Daily {
  const _Daily({@JsonKey(fromJson: _dateTimeFromJson) final  List<DateTime>? time, @JsonKey(name: 'weathercode') final  List<int?>? weatherCode, @JsonKey(name: 'temperature_2m_max') final  List<double?>? temperature2MMax, @JsonKey(name: 'temperature_2m_min') final  List<double?>? temperature2MMin, @JsonKey(name: 'apparent_temperature_max') final  List<double?>? apparentTemperatureMax, @JsonKey(name: 'apparent_temperature_min') final  List<double?>? apparentTemperatureMin, @JsonKey(name: 'precipitation_sum') final  List<double?>? precipitationSum, final  List<String>? sunrise, final  List<String>? sunset, @JsonKey(name: 'precipitation_probability_max') final  List<int?>? precipitationProbabilityMax, @JsonKey(name: 'windspeed_10m_max') final  List<double?>? windSpeed10MMax, @JsonKey(name: 'windgusts_10m_max') final  List<double?>? windGusts10MMax, @JsonKey(name: 'uv_index_max') final  List<double?>? uvIndexMax, @JsonKey(name: 'rain_sum') final  List<double?>? rainSum, @JsonKey(name: 'winddirection_10m_dominant') final  List<int?>? windDirection10MDominant}): _time = time,_weatherCode = weatherCode,_temperature2MMax = temperature2MMax,_temperature2MMin = temperature2MMin,_apparentTemperatureMax = apparentTemperatureMax,_apparentTemperatureMin = apparentTemperatureMin,_precipitationSum = precipitationSum,_sunrise = sunrise,_sunset = sunset,_precipitationProbabilityMax = precipitationProbabilityMax,_windSpeed10MMax = windSpeed10MMax,_windGusts10MMax = windGusts10MMax,_uvIndexMax = uvIndexMax,_rainSum = rainSum,_windDirection10MDominant = windDirection10MDominant;
  factory _Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

 final  List<DateTime>? _time;
@override@JsonKey(fromJson: _dateTimeFromJson) List<DateTime>? get time {
  final value = _time;
  if (value == null) return null;
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int?>? _weatherCode;
@override@JsonKey(name: 'weathercode') List<int?>? get weatherCode {
  final value = _weatherCode;
  if (value == null) return null;
  if (_weatherCode is EqualUnmodifiableListView) return _weatherCode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _temperature2MMax;
@override@JsonKey(name: 'temperature_2m_max') List<double?>? get temperature2MMax {
  final value = _temperature2MMax;
  if (value == null) return null;
  if (_temperature2MMax is EqualUnmodifiableListView) return _temperature2MMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _temperature2MMin;
@override@JsonKey(name: 'temperature_2m_min') List<double?>? get temperature2MMin {
  final value = _temperature2MMin;
  if (value == null) return null;
  if (_temperature2MMin is EqualUnmodifiableListView) return _temperature2MMin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _apparentTemperatureMax;
@override@JsonKey(name: 'apparent_temperature_max') List<double?>? get apparentTemperatureMax {
  final value = _apparentTemperatureMax;
  if (value == null) return null;
  if (_apparentTemperatureMax is EqualUnmodifiableListView) return _apparentTemperatureMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _apparentTemperatureMin;
@override@JsonKey(name: 'apparent_temperature_min') List<double?>? get apparentTemperatureMin {
  final value = _apparentTemperatureMin;
  if (value == null) return null;
  if (_apparentTemperatureMin is EqualUnmodifiableListView) return _apparentTemperatureMin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _precipitationSum;
@override@JsonKey(name: 'precipitation_sum') List<double?>? get precipitationSum {
  final value = _precipitationSum;
  if (value == null) return null;
  if (_precipitationSum is EqualUnmodifiableListView) return _precipitationSum;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _sunrise;
@override List<String>? get sunrise {
  final value = _sunrise;
  if (value == null) return null;
  if (_sunrise is EqualUnmodifiableListView) return _sunrise;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _sunset;
@override List<String>? get sunset {
  final value = _sunset;
  if (value == null) return null;
  if (_sunset is EqualUnmodifiableListView) return _sunset;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int?>? _precipitationProbabilityMax;
@override@JsonKey(name: 'precipitation_probability_max') List<int?>? get precipitationProbabilityMax {
  final value = _precipitationProbabilityMax;
  if (value == null) return null;
  if (_precipitationProbabilityMax is EqualUnmodifiableListView) return _precipitationProbabilityMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _windSpeed10MMax;
@override@JsonKey(name: 'windspeed_10m_max') List<double?>? get windSpeed10MMax {
  final value = _windSpeed10MMax;
  if (value == null) return null;
  if (_windSpeed10MMax is EqualUnmodifiableListView) return _windSpeed10MMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _windGusts10MMax;
@override@JsonKey(name: 'windgusts_10m_max') List<double?>? get windGusts10MMax {
  final value = _windGusts10MMax;
  if (value == null) return null;
  if (_windGusts10MMax is EqualUnmodifiableListView) return _windGusts10MMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _uvIndexMax;
@override@JsonKey(name: 'uv_index_max') List<double?>? get uvIndexMax {
  final value = _uvIndexMax;
  if (value == null) return null;
  if (_uvIndexMax is EqualUnmodifiableListView) return _uvIndexMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _rainSum;
@override@JsonKey(name: 'rain_sum') List<double?>? get rainSum {
  final value = _rainSum;
  if (value == null) return null;
  if (_rainSum is EqualUnmodifiableListView) return _rainSum;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int?>? _windDirection10MDominant;
@override@JsonKey(name: 'winddirection_10m_dominant') List<int?>? get windDirection10MDominant {
  final value = _windDirection10MDominant;
  if (value == null) return null;
  if (_windDirection10MDominant is EqualUnmodifiableListView) return _windDirection10MDominant;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Daily
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyCopyWith<_Daily> get copyWith => __$DailyCopyWithImpl<_Daily>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Daily&&const DeepCollectionEquality().equals(other._time, _time)&&const DeepCollectionEquality().equals(other._weatherCode, _weatherCode)&&const DeepCollectionEquality().equals(other._temperature2MMax, _temperature2MMax)&&const DeepCollectionEquality().equals(other._temperature2MMin, _temperature2MMin)&&const DeepCollectionEquality().equals(other._apparentTemperatureMax, _apparentTemperatureMax)&&const DeepCollectionEquality().equals(other._apparentTemperatureMin, _apparentTemperatureMin)&&const DeepCollectionEquality().equals(other._precipitationSum, _precipitationSum)&&const DeepCollectionEquality().equals(other._sunrise, _sunrise)&&const DeepCollectionEquality().equals(other._sunset, _sunset)&&const DeepCollectionEquality().equals(other._precipitationProbabilityMax, _precipitationProbabilityMax)&&const DeepCollectionEquality().equals(other._windSpeed10MMax, _windSpeed10MMax)&&const DeepCollectionEquality().equals(other._windGusts10MMax, _windGusts10MMax)&&const DeepCollectionEquality().equals(other._uvIndexMax, _uvIndexMax)&&const DeepCollectionEquality().equals(other._rainSum, _rainSum)&&const DeepCollectionEquality().equals(other._windDirection10MDominant, _windDirection10MDominant));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_weatherCode),const DeepCollectionEquality().hash(_temperature2MMax),const DeepCollectionEquality().hash(_temperature2MMin),const DeepCollectionEquality().hash(_apparentTemperatureMax),const DeepCollectionEquality().hash(_apparentTemperatureMin),const DeepCollectionEquality().hash(_precipitationSum),const DeepCollectionEquality().hash(_sunrise),const DeepCollectionEquality().hash(_sunset),const DeepCollectionEquality().hash(_precipitationProbabilityMax),const DeepCollectionEquality().hash(_windSpeed10MMax),const DeepCollectionEquality().hash(_windGusts10MMax),const DeepCollectionEquality().hash(_uvIndexMax),const DeepCollectionEquality().hash(_rainSum),const DeepCollectionEquality().hash(_windDirection10MDominant));

@override
String toString() {
  return 'Daily(time: $time, weatherCode: $weatherCode, temperature2MMax: $temperature2MMax, temperature2MMin: $temperature2MMin, apparentTemperatureMax: $apparentTemperatureMax, apparentTemperatureMin: $apparentTemperatureMin, precipitationSum: $precipitationSum, sunrise: $sunrise, sunset: $sunset, precipitationProbabilityMax: $precipitationProbabilityMax, windSpeed10MMax: $windSpeed10MMax, windGusts10MMax: $windGusts10MMax, uvIndexMax: $uvIndexMax, rainSum: $rainSum, windDirection10MDominant: $windDirection10MDominant)';
}


}

/// @nodoc
abstract mixin class _$DailyCopyWith<$Res> implements $DailyCopyWith<$Res> {
  factory _$DailyCopyWith(_Daily value, $Res Function(_Daily) _then) = __$DailyCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _dateTimeFromJson) List<DateTime>? time,@JsonKey(name: 'weathercode') List<int?>? weatherCode,@JsonKey(name: 'temperature_2m_max') List<double?>? temperature2MMax,@JsonKey(name: 'temperature_2m_min') List<double?>? temperature2MMin,@JsonKey(name: 'apparent_temperature_max') List<double?>? apparentTemperatureMax,@JsonKey(name: 'apparent_temperature_min') List<double?>? apparentTemperatureMin,@JsonKey(name: 'precipitation_sum') List<double?>? precipitationSum, List<String>? sunrise, List<String>? sunset,@JsonKey(name: 'precipitation_probability_max') List<int?>? precipitationProbabilityMax,@JsonKey(name: 'windspeed_10m_max') List<double?>? windSpeed10MMax,@JsonKey(name: 'windgusts_10m_max') List<double?>? windGusts10MMax,@JsonKey(name: 'uv_index_max') List<double?>? uvIndexMax,@JsonKey(name: 'rain_sum') List<double?>? rainSum,@JsonKey(name: 'winddirection_10m_dominant') List<int?>? windDirection10MDominant
});




}
/// @nodoc
class __$DailyCopyWithImpl<$Res>
    implements _$DailyCopyWith<$Res> {
  __$DailyCopyWithImpl(this._self, this._then);

  final _Daily _self;
  final $Res Function(_Daily) _then;

/// Create a copy of Daily
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? weatherCode = freezed,Object? temperature2MMax = freezed,Object? temperature2MMin = freezed,Object? apparentTemperatureMax = freezed,Object? apparentTemperatureMin = freezed,Object? precipitationSum = freezed,Object? sunrise = freezed,Object? sunset = freezed,Object? precipitationProbabilityMax = freezed,Object? windSpeed10MMax = freezed,Object? windGusts10MMax = freezed,Object? uvIndexMax = freezed,Object? rainSum = freezed,Object? windDirection10MDominant = freezed,}) {
  return _then(_Daily(
time: freezed == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<DateTime>?,weatherCode: freezed == weatherCode ? _self._weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as List<int?>?,temperature2MMax: freezed == temperature2MMax ? _self._temperature2MMax : temperature2MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,temperature2MMin: freezed == temperature2MMin ? _self._temperature2MMin : temperature2MMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMax: freezed == apparentTemperatureMax ? _self._apparentTemperatureMax : apparentTemperatureMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMin: freezed == apparentTemperatureMin ? _self._apparentTemperatureMin : apparentTemperatureMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationSum: freezed == precipitationSum ? _self._precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,sunrise: freezed == sunrise ? _self._sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<String>?,sunset: freezed == sunset ? _self._sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<String>?,precipitationProbabilityMax: freezed == precipitationProbabilityMax ? _self._precipitationProbabilityMax : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
as List<int?>?,windSpeed10MMax: freezed == windSpeed10MMax ? _self._windSpeed10MMax : windSpeed10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,windGusts10MMax: freezed == windGusts10MMax ? _self._windGusts10MMax : windGusts10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,uvIndexMax: freezed == uvIndexMax ? _self._uvIndexMax : uvIndexMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,rainSum: freezed == rainSum ? _self._rainSum : rainSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,windDirection10MDominant: freezed == windDirection10MDominant ? _self._windDirection10MDominant : windDirection10MDominant // ignore: cast_nullable_to_non_nullable
as List<int?>?,
  ));
}


}

// dart format on
