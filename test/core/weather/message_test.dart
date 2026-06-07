import '../../helpers/test_helpers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/weather/message.dart';

void main() {
  setUpAll(() async {
    await initTestEnvironment();
  });

  group('Message', () {
    final message = Message();

    group('getPressure', () {
      test('returns empty for null', () {
        expect(message.getPressure(null), '');
      });

      test('returns low below 1000', () {
        expect(message.getPressure(990), isNotEmpty);
      });

      test('returns high above 1020', () {
        expect(message.getPressure(1030), isNotEmpty);
      });

      test('returns normal between thresholds', () {
        expect(message.getPressure(1010), isNotEmpty);
      });
    });

    group('getUvIndex', () {
      test('returns empty for null', () {
        expect(message.getUvIndex(null), '');
      });

      test('maps UV ranges', () {
        expect(message.getUvIndex(1), isNotEmpty);
        expect(message.getUvIndex(4), isNotEmpty);
        expect(message.getUvIndex(7), isNotEmpty);
        expect(message.getUvIndex(9), isNotEmpty);
        expect(message.getUvIndex(12), isNotEmpty);
      });
    });

    group('getDirection', () {
      test('returns empty for null', () {
        expect(message.getDirection(null), '');
      });

      test('maps compass directions', () {
        expect(message.getDirection(0), isNotEmpty);
        expect(message.getDirection(45), isNotEmpty);
        expect(message.getDirection(90), isNotEmpty);
        expect(message.getDirection(135), isNotEmpty);
        expect(message.getDirection(180), isNotEmpty);
        expect(message.getDirection(225), isNotEmpty);
        expect(message.getDirection(270), isNotEmpty);
        expect(message.getDirection(315), isNotEmpty);
      });
    });
  });
}
