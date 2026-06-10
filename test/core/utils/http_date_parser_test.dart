import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/http_date_parser.dart';

void main() {
  test('parseHttpDate reads RFC 1123 GMT timestamps', () {
    final parsed = parseHttpDate('Wed, 10 Jun 2026 10:07:24 GMT');
    expect(parsed, isNotNull);
    expect(parsed!.year, 2026);
    expect(parsed.month, 6);
    expect(parsed.day, 10);
    expect(parsed.hour, 10);
    expect(parsed.minute, 7);
  });
}
