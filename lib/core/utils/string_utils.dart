/// Uppercases the first character for UI labels (e.g. weekday names from intl).
String capitalizeFirst(String value) {
  if (value.isEmpty) return value;
  return value[0].toUpperCase() + value.substring(1);
}
