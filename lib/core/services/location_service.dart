import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Wraps Geolocator and geocoding — the only layer that talks to platform GPS APIs.
class LocationService {
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
  Future<({double lat, double lon, String city, String district})?>
  getCurrentPlace() async {
    final position = await determinePosition();
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    return parsePlaceFromPlacemarks(position, placemarks);
  }

  /// Builds a place record from GPS coordinates and geocoding results.
  @visibleForTesting
  static ({double lat, double lon, String city, String district})?
  parsePlaceFromPlacemarks(Position position, List<Placemark> placemarks) {
    if (placemarks.isEmpty) return null;
    final place = placemarks.first;
    final city = firstNonEmpty([
      place.locality,
      place.subAdministrativeArea,
      place.name,
      place.subLocality,
    ]);
    final district = firstNonEmpty([
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

  /// Returns the first trimmed non-empty string from [values].
  @visibleForTesting
  static String firstNonEmpty(List<String?> values) {
    for (final value in values) {
      final trimmed = value?.trim();
      if (trimmed != null && trimmed.isNotEmpty) return trimmed;
    }
    return '';
  }
}
