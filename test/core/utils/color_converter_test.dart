import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/color_converter.dart';

void main() {
  group('HexColor', () {
    test('fromHex parses 6-digit and hash-prefixed values', () {
      expect(HexColor.fromHex('FF0000'), const Color(0xFFFF0000));
      expect(HexColor.fromHex('#00FF00'), const Color(0xFF00FF00));
    });

    test('toHex round-trips ARGB values', () {
      const color = Color(0xFF112233);
      expect(HexColor.fromHex('112233'), color);
      expect(color.toHex(), '#ff112233');
      expect(color.toHex(leadingHashSign: false), 'ff112233');
    });
  });
}
