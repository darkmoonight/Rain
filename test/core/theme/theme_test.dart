import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/theme/theme.dart';

void main() {
  group('theme tokens', () {
    test('color schemes use expected brightness', () {
      expect(colorSchemeLight.brightness, Brightness.light);
      expect(colorSchemeDark.brightness, Brightness.dark);
    });

    test('palette constants are defined', () {
      expect(lightColor, Colors.white);
      expect(darkColor, const Color.fromRGBO(30, 30, 30, 1));
      expect(oledColor, Colors.black);
    });

    test('base themes enable Material 3', () {
      expect(baseLight.useMaterial3, isTrue);
      expect(baseDark.useMaterial3, isTrue);
    });
  });
}
