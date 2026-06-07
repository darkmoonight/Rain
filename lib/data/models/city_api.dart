/// Root response from the Open-Meteo geocoding search endpoint.
class CityApi {
  CityApi({required this.results});

  List<Result> results;

  /// Deserializes a [CityApi] from a JSON map.
  factory CityApi.fromJson(Map<String, dynamic> json) => CityApi(
    results: json['results'] == null
        ? List<Result>.empty()
        : List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
  );
}

/// A single city match within a geocoding search response.
class Result {
  Result({
    required this.admin1,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  String admin1;
  String name;
  double latitude;
  double longitude;

  /// Deserializes a [Result] from a JSON map.
  factory Result.fromJson(Map<String, dynamic> json) => Result(
    admin1: json['admin1'] ?? '',
    name: json['name'],
    latitude: json['latitude'],
    longitude: json['longitude'],
  );
}
