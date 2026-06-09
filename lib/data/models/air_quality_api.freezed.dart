// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AirQualityDataApi {

 AirQualityHourly get hourly;
/// Create a copy of AirQualityDataApi
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityDataApiCopyWith<AirQualityDataApi> get copyWith => _$AirQualityDataApiCopyWithImpl<AirQualityDataApi>(this as AirQualityDataApi, _$identity);

  /// Serializes this AirQualityDataApi to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityDataApi&&(identical(other.hourly, hourly) || other.hourly == hourly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hourly);

@override
String toString() {
  return 'AirQualityDataApi(hourly: $hourly)';
}


}

/// @nodoc
abstract mixin class $AirQualityDataApiCopyWith<$Res>  {
  factory $AirQualityDataApiCopyWith(AirQualityDataApi value, $Res Function(AirQualityDataApi) _then) = _$AirQualityDataApiCopyWithImpl;
@useResult
$Res call({
 AirQualityHourly hourly
});


$AirQualityHourlyCopyWith<$Res> get hourly;

}
/// @nodoc
class _$AirQualityDataApiCopyWithImpl<$Res>
    implements $AirQualityDataApiCopyWith<$Res> {
  _$AirQualityDataApiCopyWithImpl(this._self, this._then);

  final AirQualityDataApi _self;
  final $Res Function(AirQualityDataApi) _then;

/// Create a copy of AirQualityDataApi
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hourly = null,}) {
  return _then(_self.copyWith(
hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as AirQualityHourly,
  ));
}
/// Create a copy of AirQualityDataApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityHourlyCopyWith<$Res> get hourly {
  
  return $AirQualityHourlyCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}
}


/// Adds pattern-matching-related methods to [AirQualityDataApi].
extension AirQualityDataApiPatterns on AirQualityDataApi {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityDataApi value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityDataApi() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityDataApi value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityDataApi():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityDataApi value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityDataApi() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AirQualityHourly hourly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityDataApi() when $default != null:
return $default(_that.hourly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AirQualityHourly hourly)  $default,) {final _that = this;
switch (_that) {
case _AirQualityDataApi():
return $default(_that.hourly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AirQualityHourly hourly)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityDataApi() when $default != null:
return $default(_that.hourly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQualityDataApi implements AirQualityDataApi {
  const _AirQualityDataApi({required this.hourly});
  factory _AirQualityDataApi.fromJson(Map<String, dynamic> json) => _$AirQualityDataApiFromJson(json);

@override final  AirQualityHourly hourly;

/// Create a copy of AirQualityDataApi
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityDataApiCopyWith<_AirQualityDataApi> get copyWith => __$AirQualityDataApiCopyWithImpl<_AirQualityDataApi>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityDataApiToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityDataApi&&(identical(other.hourly, hourly) || other.hourly == hourly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hourly);

@override
String toString() {
  return 'AirQualityDataApi(hourly: $hourly)';
}


}

/// @nodoc
abstract mixin class _$AirQualityDataApiCopyWith<$Res> implements $AirQualityDataApiCopyWith<$Res> {
  factory _$AirQualityDataApiCopyWith(_AirQualityDataApi value, $Res Function(_AirQualityDataApi) _then) = __$AirQualityDataApiCopyWithImpl;
@override @useResult
$Res call({
 AirQualityHourly hourly
});


@override $AirQualityHourlyCopyWith<$Res> get hourly;

}
/// @nodoc
class __$AirQualityDataApiCopyWithImpl<$Res>
    implements _$AirQualityDataApiCopyWith<$Res> {
  __$AirQualityDataApiCopyWithImpl(this._self, this._then);

  final _AirQualityDataApi _self;
  final $Res Function(_AirQualityDataApi) _then;

/// Create a copy of AirQualityDataApi
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hourly = null,}) {
  return _then(_AirQualityDataApi(
hourly: null == hourly ? _self.hourly : hourly // ignore: cast_nullable_to_non_nullable
as AirQualityHourly,
  ));
}

/// Create a copy of AirQualityDataApi
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AirQualityHourlyCopyWith<$Res> get hourly {
  
  return $AirQualityHourlyCopyWith<$Res>(_self.hourly, (value) {
    return _then(_self.copyWith(hourly: value));
  });
}
}


/// @nodoc
mixin _$AirQualityHourly {

 List<String>? get time;@JsonKey(name: 'european_aqi') List<double?>? get europeanAqi;@JsonKey(name: 'us_aqi') List<double?>? get usAqi;@JsonKey(name: 'pm2_5') List<double?>? get pm25;@JsonKey(name: 'pm10') List<double?>? get pm10; List<double?>? get ozone;@JsonKey(name: 'carbon_monoxide') List<double?>? get co;@JsonKey(name: 'nitrogen_dioxide') List<double?>? get no2;@JsonKey(name: 'sulphur_dioxide') List<double?>? get so2;
/// Create a copy of AirQualityHourly
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityHourlyCopyWith<AirQualityHourly> get copyWith => _$AirQualityHourlyCopyWithImpl<AirQualityHourly>(this as AirQualityHourly, _$identity);

  /// Serializes this AirQualityHourly to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQualityHourly&&const DeepCollectionEquality().equals(other.time, time)&&const DeepCollectionEquality().equals(other.europeanAqi, europeanAqi)&&const DeepCollectionEquality().equals(other.usAqi, usAqi)&&const DeepCollectionEquality().equals(other.pm25, pm25)&&const DeepCollectionEquality().equals(other.pm10, pm10)&&const DeepCollectionEquality().equals(other.ozone, ozone)&&const DeepCollectionEquality().equals(other.co, co)&&const DeepCollectionEquality().equals(other.no2, no2)&&const DeepCollectionEquality().equals(other.so2, so2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(time),const DeepCollectionEquality().hash(europeanAqi),const DeepCollectionEquality().hash(usAqi),const DeepCollectionEquality().hash(pm25),const DeepCollectionEquality().hash(pm10),const DeepCollectionEquality().hash(ozone),const DeepCollectionEquality().hash(co),const DeepCollectionEquality().hash(no2),const DeepCollectionEquality().hash(so2));

@override
String toString() {
  return 'AirQualityHourly(time: $time, europeanAqi: $europeanAqi, usAqi: $usAqi, pm25: $pm25, pm10: $pm10, ozone: $ozone, co: $co, no2: $no2, so2: $so2)';
}


}

/// @nodoc
abstract mixin class $AirQualityHourlyCopyWith<$Res>  {
  factory $AirQualityHourlyCopyWith(AirQualityHourly value, $Res Function(AirQualityHourly) _then) = _$AirQualityHourlyCopyWithImpl;
@useResult
$Res call({
 List<String>? time,@JsonKey(name: 'european_aqi') List<double?>? europeanAqi,@JsonKey(name: 'us_aqi') List<double?>? usAqi,@JsonKey(name: 'pm2_5') List<double?>? pm25,@JsonKey(name: 'pm10') List<double?>? pm10, List<double?>? ozone,@JsonKey(name: 'carbon_monoxide') List<double?>? co,@JsonKey(name: 'nitrogen_dioxide') List<double?>? no2,@JsonKey(name: 'sulphur_dioxide') List<double?>? so2
});




}
/// @nodoc
class _$AirQualityHourlyCopyWithImpl<$Res>
    implements $AirQualityHourlyCopyWith<$Res> {
  _$AirQualityHourlyCopyWithImpl(this._self, this._then);

  final AirQualityHourly _self;
  final $Res Function(AirQualityHourly) _then;

/// Create a copy of AirQualityHourly
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = freezed,Object? europeanAqi = freezed,Object? usAqi = freezed,Object? pm25 = freezed,Object? pm10 = freezed,Object? ozone = freezed,Object? co = freezed,Object? no2 = freezed,Object? so2 = freezed,}) {
  return _then(_self.copyWith(
time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,europeanAqi: freezed == europeanAqi ? _self.europeanAqi : europeanAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,usAqi: freezed == usAqi ? _self.usAqi : usAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm25: freezed == pm25 ? _self.pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm10: freezed == pm10 ? _self.pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as List<double?>?,ozone: freezed == ozone ? _self.ozone : ozone // ignore: cast_nullable_to_non_nullable
as List<double?>?,co: freezed == co ? _self.co : co // ignore: cast_nullable_to_non_nullable
as List<double?>?,no2: freezed == no2 ? _self.no2 : no2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,so2: freezed == so2 ? _self.so2 : so2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQualityHourly].
extension AirQualityHourlyPatterns on AirQualityHourly {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQualityHourly value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQualityHourly() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQualityHourly value)  $default,){
final _that = this;
switch (_that) {
case _AirQualityHourly():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQualityHourly value)?  $default,){
final _that = this;
switch (_that) {
case _AirQualityHourly() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? time, @JsonKey(name: 'european_aqi')  List<double?>? europeanAqi, @JsonKey(name: 'us_aqi')  List<double?>? usAqi, @JsonKey(name: 'pm2_5')  List<double?>? pm25, @JsonKey(name: 'pm10')  List<double?>? pm10,  List<double?>? ozone, @JsonKey(name: 'carbon_monoxide')  List<double?>? co, @JsonKey(name: 'nitrogen_dioxide')  List<double?>? no2, @JsonKey(name: 'sulphur_dioxide')  List<double?>? so2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQualityHourly() when $default != null:
return $default(_that.time,_that.europeanAqi,_that.usAqi,_that.pm25,_that.pm10,_that.ozone,_that.co,_that.no2,_that.so2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? time, @JsonKey(name: 'european_aqi')  List<double?>? europeanAqi, @JsonKey(name: 'us_aqi')  List<double?>? usAqi, @JsonKey(name: 'pm2_5')  List<double?>? pm25, @JsonKey(name: 'pm10')  List<double?>? pm10,  List<double?>? ozone, @JsonKey(name: 'carbon_monoxide')  List<double?>? co, @JsonKey(name: 'nitrogen_dioxide')  List<double?>? no2, @JsonKey(name: 'sulphur_dioxide')  List<double?>? so2)  $default,) {final _that = this;
switch (_that) {
case _AirQualityHourly():
return $default(_that.time,_that.europeanAqi,_that.usAqi,_that.pm25,_that.pm10,_that.ozone,_that.co,_that.no2,_that.so2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? time, @JsonKey(name: 'european_aqi')  List<double?>? europeanAqi, @JsonKey(name: 'us_aqi')  List<double?>? usAqi, @JsonKey(name: 'pm2_5')  List<double?>? pm25, @JsonKey(name: 'pm10')  List<double?>? pm10,  List<double?>? ozone, @JsonKey(name: 'carbon_monoxide')  List<double?>? co, @JsonKey(name: 'nitrogen_dioxide')  List<double?>? no2, @JsonKey(name: 'sulphur_dioxide')  List<double?>? so2)?  $default,) {final _that = this;
switch (_that) {
case _AirQualityHourly() when $default != null:
return $default(_that.time,_that.europeanAqi,_that.usAqi,_that.pm25,_that.pm10,_that.ozone,_that.co,_that.no2,_that.so2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AirQualityHourly implements AirQualityHourly {
  const _AirQualityHourly({final  List<String>? time, @JsonKey(name: 'european_aqi') final  List<double?>? europeanAqi, @JsonKey(name: 'us_aqi') final  List<double?>? usAqi, @JsonKey(name: 'pm2_5') final  List<double?>? pm25, @JsonKey(name: 'pm10') final  List<double?>? pm10, final  List<double?>? ozone, @JsonKey(name: 'carbon_monoxide') final  List<double?>? co, @JsonKey(name: 'nitrogen_dioxide') final  List<double?>? no2, @JsonKey(name: 'sulphur_dioxide') final  List<double?>? so2}): _time = time,_europeanAqi = europeanAqi,_usAqi = usAqi,_pm25 = pm25,_pm10 = pm10,_ozone = ozone,_co = co,_no2 = no2,_so2 = so2;
  factory _AirQualityHourly.fromJson(Map<String, dynamic> json) => _$AirQualityHourlyFromJson(json);

 final  List<String>? _time;
@override List<String>? get time {
  final value = _time;
  if (value == null) return null;
  if (_time is EqualUnmodifiableListView) return _time;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _europeanAqi;
@override@JsonKey(name: 'european_aqi') List<double?>? get europeanAqi {
  final value = _europeanAqi;
  if (value == null) return null;
  if (_europeanAqi is EqualUnmodifiableListView) return _europeanAqi;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _usAqi;
@override@JsonKey(name: 'us_aqi') List<double?>? get usAqi {
  final value = _usAqi;
  if (value == null) return null;
  if (_usAqi is EqualUnmodifiableListView) return _usAqi;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _pm25;
@override@JsonKey(name: 'pm2_5') List<double?>? get pm25 {
  final value = _pm25;
  if (value == null) return null;
  if (_pm25 is EqualUnmodifiableListView) return _pm25;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _pm10;
@override@JsonKey(name: 'pm10') List<double?>? get pm10 {
  final value = _pm10;
  if (value == null) return null;
  if (_pm10 is EqualUnmodifiableListView) return _pm10;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _ozone;
@override List<double?>? get ozone {
  final value = _ozone;
  if (value == null) return null;
  if (_ozone is EqualUnmodifiableListView) return _ozone;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _co;
@override@JsonKey(name: 'carbon_monoxide') List<double?>? get co {
  final value = _co;
  if (value == null) return null;
  if (_co is EqualUnmodifiableListView) return _co;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _no2;
@override@JsonKey(name: 'nitrogen_dioxide') List<double?>? get no2 {
  final value = _no2;
  if (value == null) return null;
  if (_no2 is EqualUnmodifiableListView) return _no2;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<double?>? _so2;
@override@JsonKey(name: 'sulphur_dioxide') List<double?>? get so2 {
  final value = _so2;
  if (value == null) return null;
  if (_so2 is EqualUnmodifiableListView) return _so2;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AirQualityHourly
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityHourlyCopyWith<_AirQualityHourly> get copyWith => __$AirQualityHourlyCopyWithImpl<_AirQualityHourly>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AirQualityHourlyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQualityHourly&&const DeepCollectionEquality().equals(other._time, _time)&&const DeepCollectionEquality().equals(other._europeanAqi, _europeanAqi)&&const DeepCollectionEquality().equals(other._usAqi, _usAqi)&&const DeepCollectionEquality().equals(other._pm25, _pm25)&&const DeepCollectionEquality().equals(other._pm10, _pm10)&&const DeepCollectionEquality().equals(other._ozone, _ozone)&&const DeepCollectionEquality().equals(other._co, _co)&&const DeepCollectionEquality().equals(other._no2, _no2)&&const DeepCollectionEquality().equals(other._so2, _so2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_time),const DeepCollectionEquality().hash(_europeanAqi),const DeepCollectionEquality().hash(_usAqi),const DeepCollectionEquality().hash(_pm25),const DeepCollectionEquality().hash(_pm10),const DeepCollectionEquality().hash(_ozone),const DeepCollectionEquality().hash(_co),const DeepCollectionEquality().hash(_no2),const DeepCollectionEquality().hash(_so2));

@override
String toString() {
  return 'AirQualityHourly(time: $time, europeanAqi: $europeanAqi, usAqi: $usAqi, pm25: $pm25, pm10: $pm10, ozone: $ozone, co: $co, no2: $no2, so2: $so2)';
}


}

/// @nodoc
abstract mixin class _$AirQualityHourlyCopyWith<$Res> implements $AirQualityHourlyCopyWith<$Res> {
  factory _$AirQualityHourlyCopyWith(_AirQualityHourly value, $Res Function(_AirQualityHourly) _then) = __$AirQualityHourlyCopyWithImpl;
@override @useResult
$Res call({
 List<String>? time,@JsonKey(name: 'european_aqi') List<double?>? europeanAqi,@JsonKey(name: 'us_aqi') List<double?>? usAqi,@JsonKey(name: 'pm2_5') List<double?>? pm25,@JsonKey(name: 'pm10') List<double?>? pm10, List<double?>? ozone,@JsonKey(name: 'carbon_monoxide') List<double?>? co,@JsonKey(name: 'nitrogen_dioxide') List<double?>? no2,@JsonKey(name: 'sulphur_dioxide') List<double?>? so2
});




}
/// @nodoc
class __$AirQualityHourlyCopyWithImpl<$Res>
    implements _$AirQualityHourlyCopyWith<$Res> {
  __$AirQualityHourlyCopyWithImpl(this._self, this._then);

  final _AirQualityHourly _self;
  final $Res Function(_AirQualityHourly) _then;

/// Create a copy of AirQualityHourly
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = freezed,Object? europeanAqi = freezed,Object? usAqi = freezed,Object? pm25 = freezed,Object? pm10 = freezed,Object? ozone = freezed,Object? co = freezed,Object? no2 = freezed,Object? so2 = freezed,}) {
  return _then(_AirQualityHourly(
time: freezed == time ? _self._time : time // ignore: cast_nullable_to_non_nullable
as List<String>?,europeanAqi: freezed == europeanAqi ? _self._europeanAqi : europeanAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,usAqi: freezed == usAqi ? _self._usAqi : usAqi // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm25: freezed == pm25 ? _self._pm25 : pm25 // ignore: cast_nullable_to_non_nullable
as List<double?>?,pm10: freezed == pm10 ? _self._pm10 : pm10 // ignore: cast_nullable_to_non_nullable
as List<double?>?,ozone: freezed == ozone ? _self._ozone : ozone // ignore: cast_nullable_to_non_nullable
as List<double?>?,co: freezed == co ? _self._co : co // ignore: cast_nullable_to_non_nullable
as List<double?>?,no2: freezed == no2 ? _self._no2 : no2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,so2: freezed == so2 ? _self._so2 : so2 // ignore: cast_nullable_to_non_nullable
as List<double?>?,
  ));
}


}

// dart format on
