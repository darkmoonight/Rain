import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rain/core/utils/location_label.dart';

/// Wraps Geolocator and geocoding — the only layer that talks to platform GPS APIs.
///
/// Callers enabling location should check [isServiceEnabled] before
/// [getCurrentPlace] or [determinePosition] so the UI can prompt the user.
class LocationService {
  /// Creates a location service.
  ///
  /// [geocoding] is optional so tests/fakes can avoid constructing the real
  /// plugin (which requires a platform factory). Production code lazy-inits.
  LocationService({Geocoding? geocoding}) : _geocodingOrNull = geocoding;

  Geocoding? _geocodingOrNull;

  Geocoding get _geocoding => _geocodingOrNull ??= Geocoding();

  /// Returns the current GPS position after requesting permissions if needed.
  Future<Position> determinePosition() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }
    return Geolocator.getCurrentPosition();
  }

  /// Resolves coordinates and a human-readable city/district label.
  ///
  /// Platform reverse geocoding runs first; when it fails, [resolveLabels] (e.g.
  /// Nominatim) is used. Falls back to a coordinate label when GPS succeeds but
  /// labels cannot be resolved, so callers keep a usable place.
  Future<({double lat, double lon, String city, String district})?>
  getCurrentPlace({
    Future<({String city, String district})?> Function(double lat, double lon)?
    resolveLabels,
  }) async {
    final position = await determinePosition();

    try {
      final placemarks = await _geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final place = parsePlaceFromPlacemarks(position, placemarks);
      if (place != null) return place;
    } catch (_) {
      // Platform geocoder failed; network fallback may still resolve labels.
    }

    if (resolveLabels != null) {
      try {
        final labels = await resolveLabels(
          position.latitude,
          position.longitude,
        );
        if (labels != null &&
            (hasNonEmptyLocationText(labels.city) ||
                hasNonEmptyLocationText(labels.district))) {
          return (
            lat: position.latitude,
            lon: position.longitude,
            city: labels.city,
            district: labels.district,
          );
        }
      } catch (_) {
        // Ignore fallback failures; use coordinate label below.
      }
    }

    final coordinateLabel =
        '${position.latitude.toStringAsFixed(3)}, '
        '${position.longitude.toStringAsFixed(3)}';
    return (
      lat: position.latitude,
      lon: position.longitude,
      city: coordinateLabel,
      district: '',
    );
  }

  /// Builds a place record from GPS coordinates and geocoding results.
  @visibleForTesting
  static ({double lat, double lon, String city, String district})?
  parsePlaceFromPlacemarks(Position position, List<Placemark> placemarks) {
    if (placemarks.isEmpty) return null;
    final place = placemarks.first;
    final city = firstNonEmptyLocationLabel([
      place.locality,
      place.subAdministrativeArea,
      place.name,
      place.subLocality,
    ]);
    final district = firstNonEmptyLocationLabel([
      place.administrativeArea,
      place.subAdministrativeArea,
    ]);
    if (city.isEmpty && district.isEmpty) return null;
    return (
      lat: position.latitude,
      lon: position.longitude,
      city: city,
      district: district,
    );
  }

  /// Whether the device location service is enabled at the OS level.
  Future<bool> isServiceEnabled() => Geolocator.isLocationServiceEnabled();

  /// Opens the system location settings screen.
  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();
}
