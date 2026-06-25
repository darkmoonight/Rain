import 'dart:ui';

/// Hex string conversion helpers for [Color] values.
extension HexColor on Color {
  /// Parses a `#RRGGBB` or `RRGGBB` hex string into a [Color].
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Returns this color as an `#AARRGGBB` hex string.
  String toHex({bool leadingHashSign = true}) {
    final argb = toARGB32();
    final a = (argb >> 24) & 0xFF;
    final r = (argb >> 16) & 0xFF;
    final g = (argb >> 8) & 0xFF;
    final b = argb & 0xFF;

    return '${leadingHashSign ? '#' : ''}'
        '${a.toRadixString(16).padLeft(2, '0')}'
        '${r.toRadixString(16).padLeft(2, '0')}'
        '${g.toRadixString(16).padLeft(2, '0')}'
        '${b.toRadixString(16).padLeft(2, '0')}';
  }

  /// Whether the color is fully transparent.
  bool get isFullyTransparent => a == 0;

  /// Alpha channel as a 0–255 integer.
  int get alphaChannel => (a * 255.0).round().clamp(0, 255);

  /// Returns a six-digit `RRGGBB` hex string without alpha.
  String toRgbHex() {
    final r = (this.r * 255.0).round().clamp(0, 255);
    final g = (this.g * 255.0).round().clamp(0, 255);
    final b = (this.b * 255.0).round().clamp(0, 255);
    return '${r.toRadixString(16).padLeft(2, '0')}'
            '${g.toRadixString(16).padLeft(2, '0')}'
            '${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  /// Parses a six-digit RGB hex string, preserving [alpha] when provided.
  static Color? tryFromRgbHex(String text, {int alpha = 0xFF}) {
    final normalized = text.replaceAll('#', '').trim();
    if (normalized.length != 6) return null;

    final value = int.tryParse(normalized, radix: 16);
    if (value == null) return null;

    return Color.fromARGB(
      alpha,
      (value >> 16) & 0xFF,
      (value >> 8) & 0xFF,
      value & 0xFF,
    );
  }
}
