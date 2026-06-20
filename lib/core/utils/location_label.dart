import 'package:rain/data/models/db.dart';

/// True when [value] contains non-whitespace text.
bool hasNonEmptyLocationText(String? value) =>
    value != null && value.trim().isNotEmpty;

/// True when [location] has coordinates and at least one human-readable label.
bool hasResolvedLocation(LocationCache location) =>
    location.lat != null &&
    location.lon != null &&
    (hasNonEmptyLocationText(location.city) ||
        hasNonEmptyLocationText(location.district));

/// Returns the first trimmed non-empty string from [values].
String firstNonEmptyLocationLabel(List<String?> values) {
  for (final value in values) {
    final trimmed = value?.trim();
    if (trimmed != null && trimmed.isNotEmpty) return trimmed;
  }
  return '';
}

/// Builds a display label from city and district, omitting duplicates.
String formatLocationLabel(String? city, String? district) {
  final c = city ?? '';
  final d = district ?? '';
  if (d.isEmpty) return c;
  if (c.isEmpty) return d;
  if (c == d) return c;
  return '$c, $d';
}
