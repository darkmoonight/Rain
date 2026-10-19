// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoPlace {

 double? get lat; double? get lon; String? get city; String? get district;
/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoPlaceCopyWith<GeoPlace> get copyWith => _$GeoPlaceCopyWithImpl<GeoPlace>(this as GeoPlace, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GeoPlace;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoPlace&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lon, _this.lon) || other.lon == _this.lon)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.district, _this.district) || other.district == _this.district));
}


@override
int get hashCode {
  final _this = this as GeoPlace;
  return Object.hash(runtimeType,_this.lat,_this.lon,_this.city,_this.district);
}

@override
String toString() {
  final _this = this as GeoPlace;
  return 'GeoPlace(lat: ${_this.lat}, lon: ${_this.lon}, city: ${_this.city}, district: ${_this.district})';
}


}

/// @nodoc
abstract mixin class $GeoPlaceCopyWith<$Res>  {
  factory $GeoPlaceCopyWith(GeoPlace value, $Res Function(GeoPlace) _then) = _$GeoPlaceCopyWithImpl;
@useResult
$Res call({
 double? lat, double? lon, String? city, String? district
});




}
/// @nodoc
class _$GeoPlaceCopyWithImpl<$Res>
    implements $GeoPlaceCopyWith<$Res> {
  _$GeoPlaceCopyWithImpl(this._self, this._then);

  final GeoPlace _self;
  final $Res Function(GeoPlace) _then;

/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = freezed,Object? lon = freezed,Object? city = freezed,Object? district = freezed,}) {
  return _then(GeoPlace(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoPlace].
extension GeoPlacePatterns on GeoPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoPlace value)  $default,){
final _that = this;
switch (_that) {
case _GeoPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoPlace value)?  $default,){
final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? lat,  double? lon,  String? city,  String? district)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
return $default(_that.lat,_that.lon,_that.city,_that.district);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? lat,  double? lon,  String? city,  String? district)  $default,) {final _that = this;
switch (_that) {
case _GeoPlace():
return $default(_that.lat,_that.lon,_that.city,_that.district);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? lat,  double? lon,  String? city,  String? district)?  $default,) {final _that = this;
switch (_that) {
case _GeoPlace() when $default != null:
return $default(_that.lat,_that.lon,_that.city,_that.district);case _:
  return null;

}
}

}

/// @nodoc


class _GeoPlace extends GeoPlace {
  const _GeoPlace({this.lat, this.lon, this.city, this.district}): super._();
  

@override final  double? lat;
@override final  double? lon;
@override final  String? city;
@override final  String? district;

/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoPlaceCopyWith<_GeoPlace> get copyWith => __$GeoPlaceCopyWithImpl<_GeoPlace>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoPlace&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district));
}


@override
int get hashCode {
    return Object.hash(runtimeType,lat,lon,city,district);
}

@override
String toString() {
    return 'GeoPlace(lat: $lat, lon: $lon, city: $city, district: $district)';
}


}

/// @nodoc
abstract mixin class _$GeoPlaceCopyWith<$Res> implements $GeoPlaceCopyWith<$Res> {
  factory _$GeoPlaceCopyWith(_GeoPlace value, $Res Function(_GeoPlace) _then) = __$GeoPlaceCopyWithImpl;
@override @useResult
$Res call({
 double? lat, double? lon, String? city, String? district
});




}
/// @nodoc
class __$GeoPlaceCopyWithImpl<$Res>
    implements _$GeoPlaceCopyWith<$Res> {
  __$GeoPlaceCopyWithImpl(this._self, this._then);

  final _GeoPlace _self;
  final $Res Function(_GeoPlace) _then;

/// Create a copy of GeoPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = freezed,Object? lon = freezed,Object? city = freezed,Object? district = freezed,}) {
  return _then(_GeoPlace(
lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
