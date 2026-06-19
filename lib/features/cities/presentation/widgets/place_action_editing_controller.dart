import 'package:flutter/foundation.dart';

/// Tracks field changes and whether the place form is complete enough to save.
class PlaceActionEditingController extends ChangeNotifier {
  PlaceActionEditingController(
    this._initialLat,
    this._initialLon,
    this._initialCity,
    this._initialDistrict,
  ) {
    lat.value = _initialLat;
    lon.value = _initialLon;
    city.value = _initialCity;
    district.value = _initialDistrict;

    lat.addListener(_updateCanCompose);
    lon.addListener(_updateCanCompose);
    city.addListener(_updateCanCompose);
    district.addListener(_updateCanCompose);
  }

  final String _initialLat;
  final String _initialLon;
  final String _initialCity;
  final String _initialDistrict;

  final ValueNotifier<String> lat = ValueNotifier<String>('');
  final ValueNotifier<String> lon = ValueNotifier<String>('');
  final ValueNotifier<String> city = ValueNotifier<String>('');
  final ValueNotifier<String> district = ValueNotifier<String>('');

  final _canCompose = ValueNotifier<bool>(false);

  /// Whether all fields are filled and differ from their initial values.
  ValueListenable<bool> get canCompose => _canCompose;

  void _updateCanCompose() {
    final hasChanges =
        lat.value != _initialLat ||
        lon.value != _initialLon ||
        city.value != _initialCity ||
        district.value != _initialDistrict;

    final isComplete =
        lat.value.isNotEmpty &&
        lon.value.isNotEmpty &&
        city.value.isNotEmpty &&
        district.value.isNotEmpty;

    _canCompose.value = hasChanges && isComplete;
  }

  @override
  void dispose() {
    lat.removeListener(_updateCanCompose);
    lon.removeListener(_updateCanCompose);
    city.removeListener(_updateCanCompose);
    district.removeListener(_updateCanCompose);
    lat.dispose();
    lon.dispose();
    city.dispose();
    district.dispose();
    super.dispose();
  }
}
