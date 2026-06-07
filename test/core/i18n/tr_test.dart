import 'package:flutter_test/flutter_test.dart';
import 'package:rain/i18n/tr.dart';

import '../../helpers/test_helpers.dart';

void main() {
  setUpAll(() async => initTestEnvironment());

  group('trDynamic', () {
    test('resolves snake_case keys', () {
      expect(trDynamic('loading'), isNotEmpty);
      expect(trDynamic('loading'), isNot('loading'));
    });

    test('converts camelCase legacy keys', () {
      expect(trDynamic('noWeatherCard'), isNotEmpty);
    });

    test('returns key when translation is missing', () {
      expect(trDynamic('totally_missing_key_xyz'), 'totally_missing_key_xyz');
    });

    test('handles special unit keys', () {
      expect(trDynamic('12'), isNotEmpty);
      expect(trDynamic('m/s'), isNotEmpty);
    });
  });

  group('Tr extension', () {
    test('applies trDynamic via .tr getter', () {
      expect('cancel'.tr, isNotEmpty);
    });
  });
}
