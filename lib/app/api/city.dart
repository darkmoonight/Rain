class CityApi {
  CityApi({
    required this.results,
  });

  List<Result> results;

  factory CityApi.fromJson(Map<String, dynamic> json) => CityApi(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );
}

class Result {
  Result({
    this.country,
    this.state,
    this.city,
    required this.lon,
    required this.lat,
  });

  String? country;
  String? state;
  String? city;
  double lon;
  double lat;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        country: json["country"],
        state: json["state"],
        city: json["city"],
        lon: json["lon"],
        lat: json["lat"],
      );
}
