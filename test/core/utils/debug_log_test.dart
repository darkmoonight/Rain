import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/utils/debug_log.dart';

void main() {
  test('debugLogError prints context and error in debug mode', () {
    final messages = <String>[];
    final previousDebugPrint = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) messages.add(message);
    };
    addTearDown(() => debugPrint = previousDebugPrint);

    debugLogError('Weather fetch', StateError('boom'));

    expect(messages.any((line) => line.contains('Weather fetch')), isTrue);
    expect(messages.any((line) => line.contains('boom')), isTrue);
  });
}
