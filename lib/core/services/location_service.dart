import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
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

  Future<({double lat, double lon, String city, String district})?>
  getCurrentPlace() async {
    final position = await determinePosition();
    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isEmpty) return null;
    final place = placemarks.first;
    return (
      lat: position.latitude,
      lon: position.longitude,
      city: place.locality ?? '',
      district: place.administrativeArea ?? '',
    );
  }

  Future<bool> isServiceEnabled() => Geolocator.isLocationServiceEnabled();
}
