/// A normalized city match returned from geocoding search.
class CitySearchResult {
  const CitySearchResult({
    required this.admin1,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  final String? admin1;
  final String? name;
  final double? latitude;
  final double? longitude;

  /// Whether both coordinates are present for map/navigation use.
  bool get hasCoordinates => latitude != null && longitude != null;
}
