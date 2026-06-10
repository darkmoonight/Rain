import 'package:intl/intl.dart';

/// Parses RFC 1123 HTTP dates like `Wed, 10 Jun 2026 10:07:24 GMT`.
DateTime? parseHttpDate(String? value) {
  if (value == null || value.isEmpty) return null;
  final cleaned = value.trim();
  if (!cleaned.endsWith(' GMT')) return DateTime.tryParse(cleaned)?.toUtc();
  try {
    return DateFormat(
      'EEE, dd MMM yyyy HH:mm:ss',
      'en_US',
    ).parseUtc(cleaned.substring(0, cleaned.length - 4));
  } catch (_) {
    return null;
  }
}

/// Seconds between [serverUtc] and the device clock (server − device).
int clockSkewSeconds(DateTime serverUtc) =>
    serverUtc.difference(DateTime.now().toUtc()).inSeconds;
