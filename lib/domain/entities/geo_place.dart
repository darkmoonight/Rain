import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_place.freezed.dart';

/// Domain primary location — no persistence annotations.
@freezed
abstract class GeoPlace with _$GeoPlace {
  const GeoPlace._();

  const factory GeoPlace({
    double? lat,
    double? lon,
    String? city,
    String? district,
  }) = _GeoPlace;

  /// City name for widgets and notifications, falling back to [district].
  String get displayLabel => city ?? district ?? '';
}
