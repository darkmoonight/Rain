// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherForecast {

 List<String>? get time; List<int>? get weathercode; List<double>? get temperature2M; List<double?>? get apparentTemperature; List<int?>? get relativehumidity2M; List<double?>? get precipitation; List<double?>? get rain; List<double?>? get surfacePressure; List<double?>? get visibility; List<double?>? get evapotranspiration; List<double?>? get windspeed10M; List<int?>? get winddirection10M; List<double?>? get windgusts10M; List<int?>? get cloudcover; List<double?>? get uvIndex; List<double?>? get dewpoint2M; List<int?>? get precipitationProbability; List<double?>? get shortwaveRadiation; List<double?>? get europeanAqi; List<double?>? get usAqi; List<double?>? get pm25; List<double?>? get pm10; List<double?>? get ozone; List<double?>? get co; List<double?>? get no2; List<double?>? get so2; List<DateTime>? get timeDaily; List<int?>? get weathercodeDaily; List<double?>? get temperature2MMax; List<double?>? get temperature2MMin; List<double?>? get apparentTemperatureMax; List<double?>? get apparentTemperatureMin; List<String>? get sunrise; List<String>? get sunset; List<double?>? get precipitationSum; List<int?>? get precipitationProbabilityMax; List<double?>? get windspeed10MMax; List<double?>? get windgusts10MMax; List<double?>? get uvIndexMax; List<double?>? get rainSum; List<int?>? get winddirection10MDominant; String? get timezone; int? get utcOffsetSeconds; int? get clockSkewSeconds; DateTime? get timestamp;
/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherForecastCopyWith<WeatherForecast> get copyWith => _$WeatherForecastCopyWithImpl<WeatherForecast>(this as WeatherForecast, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WeatherForecast;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherForecast&&const DeepCollectionEquality().equals(other.time, _this.time)&&const DeepCollectionEquality().equals(other.weathercode, _this.weathercode)&&const DeepCollectionEquality().equals(other.temperature2M, _this.temperature2M)&&const DeepCollectionEquality().equals(other.apparentTemperature, _this.apparentTemperature)&&const DeepCollectionEquality().equals(other.relativehumidity2M, _this.relativehumidity2M)&&const DeepCollectionEquality().equals(other.precipitation, _this.precipitation)&&const DeepCollectionEquality().equals(other.rain, _this.rain)&&const DeepCollectionEquality().equals(other.surfacePressure, _this.surfacePressure)&&const DeepCollectionEquality().equals(other.visibility, _this.visibility)&&const DeepCollectionEquality().equals(other.evapotranspiration, _this.evapotranspiration)&&const DeepCollectionEquality().equals(other.windspeed10M, _this.windspeed10M)&&const DeepCollectionEquality().equals(other.winddirection10M, _this.winddirection10M)&&const DeepCollectionEquality().equals(other.windgusts10M, _this.windgusts10M)&&const DeepCollectionEquality().equals(other.cloudcover, _this.cloudcover)&&const DeepCollectionEquality().equals(other.uvIndex, _this.uvIndex)&&const DeepCollectionEquality().equals(other.dewpoint2M, _this.dewpoint2M)&&const DeepCollectionEquality().equals(other.precipitationProbability, _this.precipitationProbability)&&const DeepCollectionEquality().equals(other.shortwaveRadiation, _this.shortwaveRadiation)&&const DeepCollectionEquality().equals(other.europeanAqi, _this.europeanAqi)&&const DeepCollectionEquality().equals(other.usAqi, _this.usAqi)&&const DeepCollectionEquality().equals(other.pm25, _this.pm25)&&const DeepCollectionEquality().equals(other.pm10, _this.pm10)&&const DeepCollectionEquality().equals(other.ozone, _this.ozone)&&const DeepCollectionEquality().equals(other.co, _this.co)&&const DeepCollectionEquality().equals(other.no2, _this.no2)&&const DeepCollectionEquality().equals(other.so2, _this.so2)&&const DeepCollectionEquality().equals(other.timeDaily, _this.timeDaily)&&const DeepCollectionEquality().equals(other.weathercodeDaily, _this.weathercodeDaily)&&const DeepCollectionEquality().equals(other.temperature2MMax, _this.temperature2MMax)&&const DeepCollectionEquality().equals(other.temperature2MMin, _this.temperature2MMin)&&const DeepCollectionEquality().equals(other.apparentTemperatureMax, _this.apparentTemperatureMax)&&const DeepCollectionEquality().equals(other.apparentTemperatureMin, _this.apparentTemperatureMin)&&const DeepCollectionEquality().equals(other.sunrise, _this.sunrise)&&const DeepCollectionEquality().equals(other.sunset, _this.sunset)&&const DeepCollectionEquality().equals(other.precipitationSum, _this.precipitationSum)&&const DeepCollectionEquality().equals(other.precipitationProbabilityMax, _this.precipitationProbabilityMax)&&const DeepCollectionEquality().equals(other.windspeed10MMax, _this.windspeed10MMax)&&const DeepCollectionEquality().equals(other.windgusts10MMax, _this.windgusts10MMax)&&const DeepCollectionEquality().equals(other.uvIndexMax, _this.uvIndexMax)&&const DeepCollectionEquality().equals(other.rainSum, _this.rainSum)&&const DeepCollectionEquality().equals(other.winddirection10MDominant, _this.winddirection10MDominant)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.utcOffsetSeconds, _this.utcOffsetSeconds) || other.utcOffsetSeconds == _this.utcOffsetSeconds)&&(identical(other.clockSkewSeconds, _this.clockSkewSeconds) || other.clockSkewSeconds == _this.clockSkewSeconds)&&(identical(other.timestamp, _this.timestamp) || other.timestamp == _this.timestamp));
}


@override
int get hashCode {
  final _this = this as WeatherForecast;
  return Object.hashAll([runtimeType,const DeepCollectionEquality().hash(_this.time),const DeepCollectionEquality().hash(_this.weathercode),const DeepCollectionEquality().hash(_this.temperature2M),const DeepCollectionEquality().hash(_this.apparentTemperature),const DeepCollectionEquality().hash(_this.relativehumidity2M),const DeepCollectionEquality().hash(_this.precipitation),const DeepCollectionEquality().hash(_this.rain),const DeepCollectionEquality().hash(_this.surfacePressure),const DeepCollectionEquality().hash(_this.visibility),const DeepCollectionEquality().hash(_this.evapotranspiration),const DeepCollectionEquality().hash(_this.windspeed10M),const DeepCollectionEquality().hash(_this.winddirection10M),const DeepCollectionEquality().hash(_this.windgusts10M),const DeepCollectionEquality().hash(_this.cloudcover),const DeepCollectionEquality().hash(_this.uvIndex),const DeepCollectionEquality().hash(_this.dewpoint2M),const DeepCollectionEquality().hash(_this.precipitationProbability),const DeepCollectionEquality().hash(_this.shortwaveRadiation),const DeepCollectionEquality().hash(_this.europeanAqi),const DeepCollectionEquality().hash(_this.usAqi),const DeepCollectionEquality().hash(_this.pm25),const DeepCollectionEquality().hash(_this.pm10),const DeepCollectionEquality().hash(_this.ozone),const DeepCollectionEquality().hash(_this.co),const DeepCollectionEquality().hash(_this.no2),const DeepCollectionEquality().hash(_this.so2),const DeepCollectionEquality().hash(_this.timeDaily),const DeepCollectionEquality().hash(_this.weathercodeDaily),const DeepCollectionEquality().hash(_this.temperature2MMax),const DeepCollectionEquality().hash(_this.temperature2MMin),const DeepCollectionEquality().hash(_this.apparentTemperatureMax),const DeepCollectionEquality().hash(_this.apparentTemperatureMin),const DeepCollectionEquality().hash(_this.sunrise),const DeepCollectionEquality().hash(_this.sunset),const DeepCollectionEquality().hash(_this.precipitationSum),const DeepCollectionEquality().hash(_this.precipitationProbabilityMax),const DeepCollectionEquality().hash(_this.windspeed10MMax),const DeepCollectionEquality().hash(_this.windgusts10MMax),const DeepCollectionEquality().hash(_this.uvIndexMax),const DeepCollectionEquality().hash(_this.rainSum),const DeepCollectionEquality().hash(_this.winddirection10MDominant),_this.timezone,_this.utcOffsetSeconds,_this.clockSkewSeconds,_this.timestamp]);
}

@override
String toString() {
  final _this = this as WeatherForecast;
  return 'WeatherForecast(time: ${_this.time}, weathercode: ${_this.weathercode}, temperature2M: ${_this.temperature2M}, apparentTemperature: ${_this.apparentTemperature}, relativehumidity2M: ${_this.relativehumidity2M}, precipitation: ${_this.precipitation}, rain: ${_this.rain}, surfacePressure: ${_this.surfacePressure}, visibility: ${_this.visibility}, evapotranspiration: ${_this.evapotranspiration}, windspeed10M: ${_this.windspeed10M}, winddirection10M: ${_this.winddirection10M}, windgusts10M: ${_this.windgusts10M}, cloudcover: ${_this.cloudcover}, uvIndex: ${_this.uvIndex}, dewpoint2M: ${_this.dewpoint2M}, precipitationProbability: ${_this.precipitationProbability}, shortwaveRadiation: ${_this.shortwaveRadiation}, europeanAqi: ${_this.europeanAqi}, usAqi: ${_this.usAqi}, pm25: ${_this.pm25}, pm10: ${_this.pm10}, ozone: ${_this.ozone}, co: ${_this.co}, no2: ${_this.no2}, so2: ${_this.so2}, timeDaily: ${_this.timeDaily}, weathercodeDaily: ${_this.weathercodeDaily}, temperature2MMax: ${_this.temperature2MMax}, temperature2MMin: ${_this.temperature2MMin}, apparentTemperatureMax: ${_this.apparentTemperatureMax}, apparentTemperatureMin: ${_this.apparentTemperatureMin}, sunrise: ${_this.sunrise}, sunset: ${_this.sunset}, precipitationSum: ${_this.precipitationSum}, precipitationProbabilityMax: ${_this.precipitationProbabilityMax}, windspeed10MMax: ${_this.windspeed10MMax}, windgusts10MMax: ${_this.windgusts10MMax}, uvIndexMax: ${_this.uvIndexMax}, rainSum: ${_this.rainSum}, winddirection10MDominant: ${_this.winddirection10MDominant}, timezone: ${_this.timezone}, utcOffsetSeconds: ${_this.utcOffsetSeconds}, clockSkewSeconds: ${_this.clockSkewSeconds}, timestamp: ${_this.timestamp})';
}


}

/// @nodoc
abstract mixin class $WeatherForecastCopyWith<$Res>  {
  factory $WeatherForecastCopyWith(WeatherForecast value, $Res Function(WeatherForecast) _then) = _$WeatherForecastCopyWithImpl;
@useResult
$Res call({
 List<String>? time, List<int>? weathercode, List<double>? temperature2M, List<double?>? apparentTemperature, List<int?>? relativehumidity2M, List<double?>? precipitation, List<double?>? rain, List<double?>? surfacePressure, List<double?>? visibility, List<double?>? evapotranspiration, List<double?>? windspeed10M, List<int?>? winddirection10M, List<double?>? windgusts10M, List<int?>? cloudcover, List<double?>? uvIndex, List<double?>? dewpoint2M, List<int?>? precipitationProbability, List<double?>? shortwaveRadiation, List<double?>? europeanAqi, List<double?>? usAqi, List<double?>? pm25, List<double?>? pm10, List<double?>? ozone, List<double?>? co, List<double?>? no2, List<double?>? so2, List<DateTime>? timeDaily, List<int?>? weathercodeDaily, List<double?>? temperature2MMax, List<double?>? temperature2MMin, List<double?>? apparentTemperatureMax, List<double?>? apparentTemperatureMin, List<String>? sunrise, List<String>? sunset, List<double?>? precipitationSum, List<int?>? precipitationProbabilityMax, List<double?>? windspeed10MMax, List<double?>? windgusts10MMax, List<double?>? uvIndexMax, List<double?>? rainSum, List<int?>? winddirection10MDominant, String? timezone, int? utcOffsetSeconds, int? clockSkewSeconds, DateTime? timestamp
});




}
/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._self, this._then);

  final WeatherForecast _self;
  final $Res Function(WeatherForecast) _then;

/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = freezed,Object? weathercode = freezed,Object? temperature2M = freezed,Object? apparentTemperature = freezed,Object? relativehumidity2M = freezed,Object? precipitation = freezed,Object? rain = freezed,Object? surfacePressure = freezed,Object? visibility = freezed,Object? evapotranspiration = freezed,Object? windspeed10M = freezed,Object? winddirection10M = freezed,Object? windgusts10M = freezed,Object? cloudcover = freezed,Object? uvIndex = freezed,Object? dewpoint2M = freezed,Object? precipitationProbability = freezed,Object? shortwaveRadiation = freezed,Object? europeanAqi = freezed,Object? usAqi = freezed,Object? pm25 = freezed,Object? pm10 = freezed,Object? ozone = freezed,Object? co = freezed,Object? no2 = freezed,Object? so2 = freezed,Object? timeDaily = freezed,Object? weathercodeDaily = freezed,Object? temperature2MMax = freezed,Object? temperature2MMin = freezed,Object? apparentTemperatureMax = freezed,Object? apparentTemperatureMin = freezed,Object? sunrise = freezed,Object? sunset = freezed,Object? precipitationSum = freezed,Object? precipitationProbabilityMax = freezed,Object? windspeed10MMax = freezed,Object? windgusts10MMax = freezed,Object? uvIndexMax = freezed,Object? rainSum = freezed,Object? winddirection10MDominant = freezed,Object? timezone = freezed,Object? utcOffsetSeconds = freezed,Object? clockSkewSeconds = freezed,Object? timestamp = freezed,}) {
  return _then(WeatherForecast(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,weathercode: freezed == weathercode ? _self.weathercode : weathercode // ignore: cast_nullable_to_non_nullable
as List<int>?,temperature2M: freezed == temperature2M ? _self.temperature2M : temperature2M // ignore: cast_nullable_to_non_nullable
as List<double>?,apparentTemperature: freezed == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as List<double?>?,relativehumidity2M: freezed == relativehumidity2M ? _self.relativehumidity2M : relativehumidity2M // ignore: cast_nullable_to_non_nullable
as List<int?>?,precipitation: freezed == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as List<double?>?,rain: freezed == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as List<double?>?,surfacePressure: freezed == surfacePressure ? _self.surfacePressure : surfacePressure // ignore: cast_nullable_to_non_nullable
as List<double?>?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as List<double?>?,evapotranspiration: freezed == evapotranspiration ? _self.evapotranspiration : evapotranspiration // ignore: cast_nullable_to_non_nullable
as List<double?>?,windspeed10M: freezed == windspeed10M ? _self.windspeed10M : windspeed10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,winddirection10M: freezed == winddirection10M ? _self.winddirection10M : winddirection10M // ignore: cast_nullable_to_non_nullable
as List<int?>?,windgusts10M: freezed == windgusts10M ? _self.windgusts10M : windgusts10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,cloudcover: freezed == cloudcover ? _self.cloudcover : cloudcover // ignore: cast_nullable_to_non_nullable
as List<int?>?,uvIndex: freezed == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as List<double?>?,dewpoint2M: freezed == dewpoint2M ? _self.dewpoint2M : dewpoint2M // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationProbability: freezed == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<int?>?,shortwaveRadiation: freezed == shortwaveRadiation ? _self.shortwaveRadiation : shortwaveRadiation // ignore: cast_nullable_to_non_nullable
as List<double?>?,europeanAqi: freezed == europeanAqi ? _self.europeanAqi : europeanAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,usAqi: freezed == usAqi ? _self.usAqi : usAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm10: freezed == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as List<double?>?,ozone: freezed == ozone ? _self.ozone : ozone // ignore: cast_nullable_to_non_nullable
as List<double?>?,co: freezed == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as List<double?>?,no2: freezed == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,so2: freezed == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,timeDaily: freezed == timeDaily ? _self.timeDaily : timeDaily // ignore: cast_nullable_to_non_nullable
as List<DateTime>?,weathercodeDaily: freezed == weathercodeDaily ? _self.weathercodeDaily : weathercodeDaily // ignore: cast_nullable_to_non_nullable
as List<int?>?,temperature2MMax: freezed == temperature2MMax ? _self.temperature2MMax : temperature2MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,temperature2MMin: freezed == temperature2MMin ? _self.temperature2MMin : temperature2MMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMax: freezed == apparentTemperatureMax ? _self.apparentTemperatureMax : apparentTemperatureMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMin: freezed == apparentTemperatureMin ? _self.apparentTemperatureMin : apparentTemperatureMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<String>?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<String>?,precipitationSum: freezed == precipitationSum ? _self.precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationProbabilityMax: freezed == precipitationProbabilityMax ? _self.precipitationProbabilityMax : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
as List<int?>?,windspeed10MMax: freezed == windspeed10MMax ? _self.windspeed10MMax : windspeed10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,windgusts10MMax: freezed == windgusts10MMax ? _self.windgusts10MMax : windgusts10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,uvIndexMax: freezed == uvIndexMax ? _self.uvIndexMax : uvIndexMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,rainSum: freezed == rainSum ? _self.rainSum : rainSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,winddirection10MDominant: freezed == winddirection10MDominant ? _self.winddirection10MDominant : winddirection10MDominant // ignore: cast_nullable_to_non_nullable
as List<int?>?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,utcOffsetSeconds: freezed == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int?,clockSkewSeconds: freezed == clockSkewSeconds ? _self.clockSkewSeconds : clockSkewSeconds // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherForecast].
extension WeatherForecastPatterns on WeatherForecast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherForecast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherForecast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherForecast value)  $default,){
final _that = this;
switch (_that) {
case _WeatherForecast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherForecast value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherForecast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? time,  List<int>? weathercode,  List<double>? temperature2M,  List<double?>? apparentTemperature,  List<int?>? relativehumidity2M,  List<double?>? precipitation,  List<double?>? rain,  List<double?>? surfacePressure,  List<double?>? visibility,  List<double?>? evapotranspiration,  List<double?>? windspeed10M,  List<int?>? winddirection10M,  List<double?>? windgusts10M,  List<int?>? cloudcover,  List<double?>? uvIndex,  List<double?>? dewpoint2M,  List<int?>? precipitationProbability,  List<double?>? shortwaveRadiation,  List<double?>? europeanAqi,  List<double?>? usAqi,  List<double?>? pm25,  List<double?>? pm10,  List<double?>? ozone,  List<double?>? co,  List<double?>? no2,  List<double?>? so2,  List<DateTime>? timeDaily,  List<int?>? weathercodeDaily,  List<double?>? temperature2MMax,  List<double?>? temperature2MMin,  List<double?>? apparentTemperatureMax,  List<double?>? apparentTemperatureMin,  List<String>? sunrise,  List<String>? sunset,  List<double?>? precipitationSum,  List<int?>? precipitationProbabilityMax,  List<double?>? windspeed10MMax,  List<double?>? windgusts10MMax,  List<double?>? uvIndexMax,  List<double?>? rainSum,  List<int?>? winddirection10MDominant,  String? timezone,  int? utcOffsetSeconds,  int? clockSkewSeconds,  DateTime? timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherForecast() when $default != null:
return $default(_that.time,_that.weathercode,_that.temperature2M,_that.apparentTemperature,_that.relativehumidity2M,_that.precipitation,_that.rain,_that.surfacePressure,_that.visibility,_that.evapotranspiration,_that.windspeed10M,_that.winddirection10M,_that.windgusts10M,_that.cloudcover,_that.uvIndex,_that.dewpoint2M,_that.precipitationProbability,_that.shortwaveRadiation,_that.europeanAqi,_that.usAqi,_that.pm25,_that.pm10,_that.ozone,_that.co,_that.no2,_that.so2,_that.timeDaily,_that.weathercodeDaily,_that.temperature2MMax,_that.temperature2MMin,_that.apparentTemperatureMax,_that.apparentTemperatureMin,_that.sunrise,_that.sunset,_that.precipitationSum,_that.precipitationProbabilityMax,_that.windspeed10MMax,_that.windgusts10MMax,_that.uvIndexMax,_that.rainSum,_that.winddirection10MDominant,_that.timezone,_that.utcOffsetSeconds,_that.clockSkewSeconds,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? time,  List<int>? weathercode,  List<double>? temperature2M,  List<double?>? apparentTemperature,  List<int?>? relativehumidity2M,  List<double?>? precipitation,  List<double?>? rain,  List<double?>? surfacePressure,  List<double?>? visibility,  List<double?>? evapotranspiration,  List<double?>? windspeed10M,  List<int?>? winddirection10M,  List<double?>? windgusts10M,  List<int?>? cloudcover,  List<double?>? uvIndex,  List<double?>? dewpoint2M,  List<int?>? precipitationProbability,  List<double?>? shortwaveRadiation,  List<double?>? europeanAqi,  List<double?>? usAqi,  List<double?>? pm25,  List<double?>? pm10,  List<double?>? ozone,  List<double?>? co,  List<double?>? no2,  List<double?>? so2,  List<DateTime>? timeDaily,  List<int?>? weathercodeDaily,  List<double?>? temperature2MMax,  List<double?>? temperature2MMin,  List<double?>? apparentTemperatureMax,  List<double?>? apparentTemperatureMin,  List<String>? sunrise,  List<String>? sunset,  List<double?>? precipitationSum,  List<int?>? precipitationProbabilityMax,  List<double?>? windspeed10MMax,  List<double?>? windgusts10MMax,  List<double?>? uvIndexMax,  List<double?>? rainSum,  List<int?>? winddirection10MDominant,  String? timezone,  int? utcOffsetSeconds,  int? clockSkewSeconds,  DateTime? timestamp)  $default,) {final _that = this;
switch (_that) {
case _WeatherForecast():
return $default(_that.time,_that.weathercode,_that.temperature2M,_that.apparentTemperature,_that.relativehumidity2M,_that.precipitation,_that.rain,_that.surfacePressure,_that.visibility,_that.evapotranspiration,_that.windspeed10M,_that.winddirection10M,_that.windgusts10M,_that.cloudcover,_that.uvIndex,_that.dewpoint2M,_that.precipitationProbability,_that.shortwaveRadiation,_that.europeanAqi,_that.usAqi,_that.pm25,_that.pm10,_that.ozone,_that.co,_that.no2,_that.so2,_that.timeDaily,_that.weathercodeDaily,_that.temperature2MMax,_that.temperature2MMin,_that.apparentTemperatureMax,_that.apparentTemperatureMin,_that.sunrise,_that.sunset,_that.precipitationSum,_that.precipitationProbabilityMax,_that.windspeed10MMax,_that.windgusts10MMax,_that.uvIndexMax,_that.rainSum,_that.winddirection10MDominant,_that.timezone,_that.utcOffsetSeconds,_that.clockSkewSeconds,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? time,  List<int>? weathercode,  List<double>? temperature2M,  List<double?>? apparentTemperature,  List<int?>? relativehumidity2M,  List<double?>? precipitation,  List<double?>? rain,  List<double?>? surfacePressure,  List<double?>? visibility,  List<double?>? evapotranspiration,  List<double?>? windspeed10M,  List<int?>? winddirection10M,  List<double?>? windgusts10M,  List<int?>? cloudcover,  List<double?>? uvIndex,  List<double?>? dewpoint2M,  List<int?>? precipitationProbability,  List<double?>? shortwaveRadiation,  List<double?>? europeanAqi,  List<double?>? usAqi,  List<double?>? pm25,  List<double?>? pm10,  List<double?>? ozone,  List<double?>? co,  List<double?>? no2,  List<double?>? so2,  List<DateTime>? timeDaily,  List<int?>? weathercodeDaily,  List<double?>? temperature2MMax,  List<double?>? temperature2MMin,  List<double?>? apparentTemperatureMax,  List<double?>? apparentTemperatureMin,  List<String>? sunrise,  List<String>? sunset,  List<double?>? precipitationSum,  List<int?>? precipitationProbabilityMax,  List<double?>? windspeed10MMax,  List<double?>? windgusts10MMax,  List<double?>? uvIndexMax,  List<double?>? rainSum,  List<int?>? winddirection10MDominant,  String? timezone,  int? utcOffsetSeconds,  int? clockSkewSeconds,  DateTime? timestamp)?  $default,) {final _that = this;
switch (_that) {
case _WeatherForecast() when $default != null:
return $default(_that.time,_that.weathercode,_that.temperature2M,_that.apparentTemperature,_that.relativehumidity2M,_that.precipitation,_that.rain,_that.surfacePressure,_that.visibility,_that.evapotranspiration,_that.windspeed10M,_that.winddirection10M,_that.windgusts10M,_that.cloudcover,_that.uvIndex,_that.dewpoint2M,_that.precipitationProbability,_that.shortwaveRadiation,_that.europeanAqi,_that.usAqi,_that.pm25,_that.pm10,_that.ozone,_that.co,_that.no2,_that.so2,_that.timeDaily,_that.weathercodeDaily,_that.temperature2MMax,_that.temperature2MMin,_that.apparentTemperatureMax,_that.apparentTemperatureMin,_that.sunrise,_that.sunset,_that.precipitationSum,_that.precipitationProbabilityMax,_that.windspeed10MMax,_that.windgusts10MMax,_that.uvIndexMax,_that.rainSum,_that.winddirection10MDominant,_that.timezone,_that.utcOffsetSeconds,_that.clockSkewSeconds,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherForecast extends WeatherForecast {
  const _WeatherForecast({this.time, this.weathercode, this.temperature2M, this.apparentTemperature, this.relativehumidity2M, this.precipitation, this.rain, this.surfacePressure, this.visibility, this.evapotranspiration, this.windspeed10M, this.winddirection10M, this.windgusts10M, this.cloudcover, this.uvIndex, this.dewpoint2M, this.precipitationProbability, this.shortwaveRadiation, this.europeanAqi, this.usAqi, this.pm25, this.pm10, this.ozone, this.co, this.no2, this.so2, this.timeDaily, this.weathercodeDaily, this.temperature2MMax, this.temperature2MMin, this.apparentTemperatureMax, this.apparentTemperatureMin, this.sunrise, this.sunset, this.precipitationSum, this.precipitationProbabilityMax, this.windspeed10MMax, this.windgusts10MMax, this.uvIndexMax, this.rainSum, this.winddirection10MDominant, this.timezone, this.utcOffsetSeconds, this.clockSkewSeconds, this.timestamp}): super._();
  

@override final  List<String>? time;
@override final  List<int>? weathercode;
@override final  List<double>? temperature2M;
@override final  List<double?>? apparentTemperature;
@override final  List<int?>? relativehumidity2M;
@override final  List<double?>? precipitation;
@override final  List<double?>? rain;
@override final  List<double?>? surfacePressure;
@override final  List<double?>? visibility;
@override final  List<double?>? evapotranspiration;
@override final  List<double?>? windspeed10M;
@override final  List<int?>? winddirection10M;
@override final  List<double?>? windgusts10M;
@override final  List<int?>? cloudcover;
@override final  List<double?>? uvIndex;
@override final  List<double?>? dewpoint2M;
@override final  List<int?>? precipitationProbability;
@override final  List<double?>? shortwaveRadiation;
@override final  List<double?>? europeanAqi;
@override final  List<double?>? usAqi;
@override final  List<double?>? pm25;
@override final  List<double?>? pm10;
@override final  List<double?>? ozone;
@override final  List<double?>? co;
@override final  List<double?>? no2;
@override final  List<double?>? so2;
@override final  List<DateTime>? timeDaily;
@override final  List<int?>? weathercodeDaily;
@override final  List<double?>? temperature2MMax;
@override final  List<double?>? temperature2MMin;
@override final  List<double?>? apparentTemperatureMax;
@override final  List<double?>? apparentTemperatureMin;
@override final  List<String>? sunrise;
@override final  List<String>? sunset;
@override final  List<double?>? precipitationSum;
@override final  List<int?>? precipitationProbabilityMax;
@override final  List<double?>? windspeed10MMax;
@override final  List<double?>? windgusts10MMax;
@override final  List<double?>? uvIndexMax;
@override final  List<double?>? rainSum;
@override final  List<int?>? winddirection10MDominant;
@override final  String? timezone;
@override final  int? utcOffsetSeconds;
@override final  int? clockSkewSeconds;
@override final  DateTime? timestamp;

/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherForecastCopyWith<_WeatherForecast> get copyWith => __$WeatherForecastCopyWithImpl<_WeatherForecast>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherForecast&&const DeepCollectionEquality().equals(other.time, time)&&const DeepCollectionEquality().equals(other.weathercode, weathercode)&&const DeepCollectionEquality().equals(other.temperature2M, temperature2M)&&const DeepCollectionEquality().equals(other.apparentTemperature, apparentTemperature)&&const DeepCollectionEquality().equals(other.relativehumidity2M, relativehumidity2M)&&const DeepCollectionEquality().equals(other.precipitation, precipitation)&&const DeepCollectionEquality().equals(other.rain, rain)&&const DeepCollectionEquality().equals(other.surfacePressure, surfacePressure)&&const DeepCollectionEquality().equals(other.visibility, visibility)&&const DeepCollectionEquality().equals(other.evapotranspiration, evapotranspiration)&&const DeepCollectionEquality().equals(other.windspeed10M, windspeed10M)&&const DeepCollectionEquality().equals(other.winddirection10M, winddirection10M)&&const DeepCollectionEquality().equals(other.windgusts10M, windgusts10M)&&const DeepCollectionEquality().equals(other.cloudcover, cloudcover)&&const DeepCollectionEquality().equals(other.uvIndex, uvIndex)&&const DeepCollectionEquality().equals(other.dewpoint2M, dewpoint2M)&&const DeepCollectionEquality().equals(other.precipitationProbability, precipitationProbability)&&const DeepCollectionEquality().equals(other.shortwaveRadiation, shortwaveRadiation)&&const DeepCollectionEquality().equals(other.europeanAqi, europeanAqi)&&const DeepCollectionEquality().equals(other.usAqi, usAqi)&&const DeepCollectionEquality().equals(other.pm25, pm25)&&const DeepCollectionEquality().equals(other.pm10, pm10)&&const DeepCollectionEquality().equals(other.ozone, ozone)&&const DeepCollectionEquality().equals(other.co, co)&&const DeepCollectionEquality().equals(other.no2, no2)&&const DeepCollectionEquality().equals(other.so2, so2)&&const DeepCollectionEquality().equals(other.timeDaily, timeDaily)&&const DeepCollectionEquality().equals(other.weathercodeDaily, weathercodeDaily)&&const DeepCollectionEquality().equals(other.temperature2MMax, temperature2MMax)&&const DeepCollectionEquality().equals(other.temperature2MMin, temperature2MMin)&&const DeepCollectionEquality().equals(other.apparentTemperatureMax, apparentTemperatureMax)&&const DeepCollectionEquality().equals(other.apparentTemperatureMin, apparentTemperatureMin)&&const DeepCollectionEquality().equals(other.sunrise, sunrise)&&const DeepCollectionEquality().equals(other.sunset, sunset)&&const DeepCollectionEquality().equals(other.precipitationSum, precipitationSum)&&const DeepCollectionEquality().equals(other.precipitationProbabilityMax, precipitationProbabilityMax)&&const DeepCollectionEquality().equals(other.windspeed10MMax, windspeed10MMax)&&const DeepCollectionEquality().equals(other.windgusts10MMax, windgusts10MMax)&&const DeepCollectionEquality().equals(other.uvIndexMax, uvIndexMax)&&const DeepCollectionEquality().equals(other.rainSum, rainSum)&&const DeepCollectionEquality().equals(other.winddirection10MDominant, winddirection10MDominant)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.utcOffsetSeconds, utcOffsetSeconds) || other.utcOffsetSeconds == utcOffsetSeconds)&&(identical(other.clockSkewSeconds, clockSkewSeconds) || other.clockSkewSeconds == clockSkewSeconds)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode {
    return Object.hashAll([runtimeType,const DeepCollectionEquality().hash(time),const DeepCollectionEquality().hash(weathercode),const DeepCollectionEquality().hash(temperature2M),const DeepCollectionEquality().hash(apparentTemperature),const DeepCollectionEquality().hash(relativehumidity2M),const DeepCollectionEquality().hash(precipitation),const DeepCollectionEquality().hash(rain),const DeepCollectionEquality().hash(surfacePressure),const DeepCollectionEquality().hash(visibility),const DeepCollectionEquality().hash(evapotranspiration),const DeepCollectionEquality().hash(windspeed10M),const DeepCollectionEquality().hash(winddirection10M),const DeepCollectionEquality().hash(windgusts10M),const DeepCollectionEquality().hash(cloudcover),const DeepCollectionEquality().hash(uvIndex),const DeepCollectionEquality().hash(dewpoint2M),const DeepCollectionEquality().hash(precipitationProbability),const DeepCollectionEquality().hash(shortwaveRadiation),const DeepCollectionEquality().hash(europeanAqi),const DeepCollectionEquality().hash(usAqi),const DeepCollectionEquality().hash(pm25),const DeepCollectionEquality().hash(pm10),const DeepCollectionEquality().hash(ozone),const DeepCollectionEquality().hash(co),const DeepCollectionEquality().hash(no2),const DeepCollectionEquality().hash(so2),const DeepCollectionEquality().hash(timeDaily),const DeepCollectionEquality().hash(weathercodeDaily),const DeepCollectionEquality().hash(temperature2MMax),const DeepCollectionEquality().hash(temperature2MMin),const DeepCollectionEquality().hash(apparentTemperatureMax),const DeepCollectionEquality().hash(apparentTemperatureMin),const DeepCollectionEquality().hash(sunrise),const DeepCollectionEquality().hash(sunset),const DeepCollectionEquality().hash(precipitationSum),const DeepCollectionEquality().hash(precipitationProbabilityMax),const DeepCollectionEquality().hash(windspeed10MMax),const DeepCollectionEquality().hash(windgusts10MMax),const DeepCollectionEquality().hash(uvIndexMax),const DeepCollectionEquality().hash(rainSum),const DeepCollectionEquality().hash(winddirection10MDominant),timezone,utcOffsetSeconds,clockSkewSeconds,timestamp]);
}

@override
String toString() {
    return 'WeatherForecast(time: $time, weathercode: $weathercode, temperature2M: $temperature2M, apparentTemperature: $apparentTemperature, relativehumidity2M: $relativehumidity2M, precipitation: $precipitation, rain: $rain, surfacePressure: $surfacePressure, visibility: $visibility, evapotranspiration: $evapotranspiration, windspeed10M: $windspeed10M, winddirection10M: $winddirection10M, windgusts10M: $windgusts10M, cloudcover: $cloudcover, uvIndex: $uvIndex, dewpoint2M: $dewpoint2M, precipitationProbability: $precipitationProbability, shortwaveRadiation: $shortwaveRadiation, europeanAqi: $europeanAqi, usAqi: $usAqi, pm25: $pm25, pm10: $pm10, ozone: $ozone, co: $co, no2: $no2, so2: $so2, timeDaily: $timeDaily, weathercodeDaily: $weathercodeDaily, temperature2MMax: $temperature2MMax, temperature2MMin: $temperature2MMin, apparentTemperatureMax: $apparentTemperatureMax, apparentTemperatureMin: $apparentTemperatureMin, sunrise: $sunrise, sunset: $sunset, precipitationSum: $precipitationSum, precipitationProbabilityMax: $precipitationProbabilityMax, windspeed10MMax: $windspeed10MMax, windgusts10MMax: $windgusts10MMax, uvIndexMax: $uvIndexMax, rainSum: $rainSum, winddirection10MDominant: $winddirection10MDominant, timezone: $timezone, utcOffsetSeconds: $utcOffsetSeconds, clockSkewSeconds: $clockSkewSeconds, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$WeatherForecastCopyWith<$Res> implements $WeatherForecastCopyWith<$Res> {
  factory _$WeatherForecastCopyWith(_WeatherForecast value, $Res Function(_WeatherForecast) _then) = __$WeatherForecastCopyWithImpl;
@override @useResult
$Res call({
 List<String>? time, List<int>? weathercode, List<double>? temperature2M, List<double?>? apparentTemperature, List<int?>? relativehumidity2M, List<double?>? precipitation, List<double?>? rain, List<double?>? surfacePressure, List<double?>? visibility, List<double?>? evapotranspiration, List<double?>? windspeed10M, List<int?>? winddirection10M, List<double?>? windgusts10M, List<int?>? cloudcover, List<double?>? uvIndex, List<double?>? dewpoint2M, List<int?>? precipitationProbability, List<double?>? shortwaveRadiation, List<double?>? europeanAqi, List<double?>? usAqi, List<double?>? pm25, List<double?>? pm10, List<double?>? ozone, List<double?>? co, List<double?>? no2, List<double?>? so2, List<DateTime>? timeDaily, List<int?>? weathercodeDaily, List<double?>? temperature2MMax, List<double?>? temperature2MMin, List<double?>? apparentTemperatureMax, List<double?>? apparentTemperatureMin, List<String>? sunrise, List<String>? sunset, List<double?>? precipitationSum, List<int?>? precipitationProbabilityMax, List<double?>? windspeed10MMax, List<double?>? windgusts10MMax, List<double?>? uvIndexMax, List<double?>? rainSum, List<int?>? winddirection10MDominant, String? timezone, int? utcOffsetSeconds, int? clockSkewSeconds, DateTime? timestamp
});




}
/// @nodoc
class __$WeatherForecastCopyWithImpl<$Res>
    implements _$WeatherForecastCopyWith<$Res> {
  __$WeatherForecastCopyWithImpl(this._self, this._then);

  final _WeatherForecast _self;
  final $Res Function(_WeatherForecast) _then;

/// Create a copy of WeatherForecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? weathercode = freezed,Object? temperature2M = freezed,Object? apparentTemperature = freezed,Object? relativehumidity2M = freezed,Object? precipitation = freezed,Object? rain = freezed,Object? surfacePressure = freezed,Object? visibility = freezed,Object? evapotranspiration = freezed,Object? windspeed10M = freezed,Object? winddirection10M = freezed,Object? windgusts10M = freezed,Object? cloudcover = freezed,Object? uvIndex = freezed,Object? dewpoint2M = freezed,Object? precipitationProbability = freezed,Object? shortwaveRadiation = freezed,Object? europeanAqi = freezed,Object? usAqi = freezed,Object? pm25 = freezed,Object? pm10 = freezed,Object? ozone = freezed,Object? co = freezed,Object? no2 = freezed,Object? so2 = freezed,Object? timeDaily = freezed,Object? weathercodeDaily = freezed,Object? temperature2MMax = freezed,Object? temperature2MMin = freezed,Object? apparentTemperatureMax = freezed,Object? apparentTemperatureMin = freezed,Object? sunrise = freezed,Object? sunset = freezed,Object? precipitationSum = freezed,Object? precipitationProbabilityMax = freezed,Object? windspeed10MMax = freezed,Object? windgusts10MMax = freezed,Object? uvIndexMax = freezed,Object? rainSum = freezed,Object? winddirection10MDominant = freezed,Object? timezone = freezed,Object? utcOffsetSeconds = freezed,Object? clockSkewSeconds = freezed,Object? timestamp = freezed,}) {
  return _then(_WeatherForecast(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,weathercode: freezed == weathercode ? _self.weathercode : weathercode // ignore: cast_nullable_to_non_nullable
as List<int>?,temperature2M: freezed == temperature2M ? _self.temperature2M : temperature2M // ignore: cast_nullable_to_non_nullable
as List<double>?,apparentTemperature: freezed == apparentTemperature ? _self.apparentTemperature : apparentTemperature // ignore: cast_nullable_to_non_nullable
as List<double?>?,relativehumidity2M: freezed == relativehumidity2M ? _self.relativehumidity2M : relativehumidity2M // ignore: cast_nullable_to_non_nullable
as List<int?>?,precipitation: freezed == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as List<double?>?,rain: freezed == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as List<double?>?,surfacePressure: freezed == surfacePressure ? _self.surfacePressure : surfacePressure // ignore: cast_nullable_to_non_nullable
as List<double?>?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as List<double?>?,evapotranspiration: freezed == evapotranspiration ? _self.evapotranspiration : evapotranspiration // ignore: cast_nullable_to_non_nullable
as List<double?>?,windspeed10M: freezed == windspeed10M ? _self.windspeed10M : windspeed10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,winddirection10M: freezed == winddirection10M ? _self.winddirection10M : winddirection10M // ignore: cast_nullable_to_non_nullable
as List<int?>?,windgusts10M: freezed == windgusts10M ? _self.windgusts10M : windgusts10M // ignore: cast_nullable_to_non_nullable
as List<double?>?,cloudcover: freezed == cloudcover ? _self.cloudcover : cloudcover // ignore: cast_nullable_to_non_nullable
as List<int?>?,uvIndex: freezed == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as List<double?>?,dewpoint2M: freezed == dewpoint2M ? _self.dewpoint2M : dewpoint2M // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationProbability: freezed == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as List<int?>?,shortwaveRadiation: freezed == shortwaveRadiation ? _self.shortwaveRadiation : shortwaveRadiation // ignore: cast_nullable_to_non_nullable
as List<double?>?,europeanAqi: freezed == europeanAqi ? _self.europeanAqi : europeanAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,usAqi: freezed == usAqi ? _self.usAqi : usAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm10: freezed == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as List<double?>?,ozone: freezed == ozone ? _self.ozone : ozone // ignore: cast_nullable_to_non_nullable
as List<double?>?,co: freezed == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as List<double?>?,no2: freezed == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,so2: freezed == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,timeDaily: freezed == timeDaily ? _self.timeDaily : timeDaily // ignore: cast_nullable_to_non_nullable
as List<DateTime>?,weathercodeDaily: freezed == weathercodeDaily ? _self.weathercodeDaily : weathercodeDaily // ignore: cast_nullable_to_non_nullable
as List<int?>?,temperature2MMax: freezed == temperature2MMax ? _self.temperature2MMax : temperature2MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,temperature2MMin: freezed == temperature2MMin ? _self.temperature2MMin : temperature2MMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMax: freezed == apparentTemperatureMax ? _self.apparentTemperatureMax : apparentTemperatureMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,apparentTemperatureMin: freezed == apparentTemperatureMin ? _self.apparentTemperatureMin : apparentTemperatureMin // ignore: cast_nullable_to_non_nullable
as List<double?>?,sunrise: freezed == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as List<String>?,sunset: freezed == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as List<String>?,precipitationSum: freezed == precipitationSum ? _self.precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,precipitationProbabilityMax: freezed == precipitationProbabilityMax ? _self.precipitationProbabilityMax : precipitationProbabilityMax // ignore: cast_nullable_to_non_nullable
as List<int?>?,windspeed10MMax: freezed == windspeed10MMax ? _self.windspeed10MMax : windspeed10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,windgusts10MMax: freezed == windgusts10MMax ? _self.windgusts10MMax : windgusts10MMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,uvIndexMax: freezed == uvIndexMax ? _self.uvIndexMax : uvIndexMax // ignore: cast_nullable_to_non_nullable
as List<double?>?,rainSum: freezed == rainSum ? _self.rainSum : rainSum // ignore: cast_nullable_to_non_nullable
as List<double?>?,winddirection10MDominant: freezed == winddirection10MDominant ? _self.winddirection10MDominant : winddirection10MDominant // ignore: cast_nullable_to_non_nullable
as List<int?>?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,utcOffsetSeconds: freezed == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int?,clockSkewSeconds: freezed == clockSkewSeconds ? _self.clockSkewSeconds : clockSkewSeconds // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
