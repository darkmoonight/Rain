import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart' as tzmap;
import 'package:rain/data/models/db.dart';

/// Resolves the IANA timezone for a saved weather location.
class LocationTimezoneHelper {
  /// Maps coordinates to an IANA timezone id, or null when inputs are missing.
  static String? fromCoordinates(double? lat, double? lon) {
    if (lat == null || lon == null) return null;
    return tzmap.latLngToTimezoneString(lat, lon);
  }

  /// Picks the timezone used for hourly index and clock display.
  ///
  /// Open-Meteo hourly strings are location-local wall clock. When a stale
  /// cache stores the device timezone instead, index resolution drifts by the
  /// offset between device and location (e.g. 02:00 instead of 12:00 Moscow).
  /// Geographic lookup from [lat]/[lon] wins over a mismatched [cached] value.
  static String resolve({
    String? cached,
    required double? lat,
    required double? lon,
  }) {
    final fromCoords = fromCoordinates(lat, lon);
    if (cached == null || cached.isEmpty) {
      return fromCoords ?? 'UTC';
    }
    if (fromCoords != null && cached != fromCoords) {
      return fromCoords;
    }
    return cached;
  }

  /// Resolves the timezone for a main-weather or city-card row.
  static String forWeatherCard(WeatherCard card) =>
      resolve(cached: card.timezone, lat: card.lat, lon: card.lon);

  /// Writes [timezone] onto [card] when it differs from the resolved value.
  ///
  /// Returns `true` when the card was modified.
  static bool repairCardTimezone(WeatherCard card) {
    final timezone = forWeatherCard(card);
    if (card.timezone == timezone) return false;
    card.timezone = timezone;
    return true;
  }
}
