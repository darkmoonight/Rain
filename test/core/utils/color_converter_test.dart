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

    test('isFullyTransparent is true only for zero alpha', () {
      expect(const Color(0x00000000).isFullyTransparent, isTrue);
      expect(const Color(0xFF000000).isFullyTransparent, isFalse);
    });

    test('toRgbHex returns uppercase six-digit RGB', () {
      expect(const Color(0xFF1A2B3C).toRgbHex(), '1A2B3C');
    });

    test('alphaChannel returns 0-255 alpha', () {
      expect(const Color(0x801A2B3C).alphaChannel, 128);
      expect(const Color(0xFF1A2B3C).alphaChannel, 255);
      expect(const Color(0x001A2B3C).alphaChannel, 0);
    });

    test('tryFromRgbHex parses valid input and preserves alpha', () {
      expect(HexColor.tryFromRgbHex('#1A2B3C'), const Color(0xFF1A2B3C));
      expect(
        HexColor.tryFromRgbHex('1A2B3C', alpha: 128),
        const Color(0x801A2B3C),
      );
      expect(HexColor.tryFromRgbHex('GGGGGG'), isNull);
      expect(HexColor.tryFromRgbHex('12345'), isNull);
    });
  });
}
