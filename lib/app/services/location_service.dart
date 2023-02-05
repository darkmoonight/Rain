import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as goa;

class LocationService {
  late Location _location;
  bool _serviceEnabled = false;
  PermissionStatus? _grantedPermission;

  LocationService() {
    _location = Location();
  }

  Future<bool> _checkPermission() async {
    if (await _checkService()) {
      _grantedPermission = await _location.hasPermission();
      if (_grantedPermission == PermissionStatus.denied) {
        _grantedPermission = await _location.requestPermission();
      }
    }

    return _grantedPermission == PermissionStatus.granted;
  }

  Future<bool> _checkService() async {
    try {
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await _location.requestService();
      }
    } on PlatformException catch (error) {
      if (kDebugMode) {
        print('error code is ${error.code} and message = ${error.message}');
      }
      _serviceEnabled = false;
      await _checkService();
    }

    return _serviceEnabled;
  }

  Future<LocationData?> getLocation() async {
    if (await _checkPermission()) {
      final locationData = _location.getLocation();
      return locationData;
    }

    return null;
  }

  Future<goa.Placemark?> getPlaceMark(
      {required LocationData locationData}) async {
    final List<goa.Placemark> placeMarks = await goa.placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);
    if (placeMarks.isNotEmpty) {
      return placeMarks[0];
    }

    return null;
  }
}
