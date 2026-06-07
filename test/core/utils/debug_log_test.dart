import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/debug_log.dart';

void main() {
  test('debugLogError does not throw in debug mode', () {
    debugLogError('test', StateError('boom'), StackTrace.current);
    expect(kDebugMode, isTrue);
  });
}
