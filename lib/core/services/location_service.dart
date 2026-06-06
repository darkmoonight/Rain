import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Wraps Geolocator and geocoding for the current device position.
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
    if (placemarks.isEmpty) return null;
    final place = placemarks.first;
    final city = _firstNonEmpty([
      place.locality,
      place.subAdministrativeArea,
      place.name,
      place.subLocality,
    ]);
    final district = _firstNonEmpty([
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

  /// Returns the first trimmed non-empty string from [values].
  static String _firstNonEmpty(List<String?> values) {
    for (final value in values) {
      final trimmed = value?.trim();
      if (trimmed != null && trimmed.isNotEmpty) return trimmed;
    }
    return '';
  }
}
