import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/notification_reschedule_guard.dart';

void main() {
  late Directory tempDir;
  late File guardFile;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('rain_guard_test');
    guardFile = File('${tempDir.path}/forecast_reschedule_guard.txt');
    setForecastRescheduleGuardTestDependencies(
      guardFileFactory: () async => guardFile,
      now: () => DateTime.utc(2026, 6, 21, 12, 0),
    );
  });

  tearDown(() async {
    resetForecastRescheduleGuardTestDependencies();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test(
    'shouldSkipForecastReplenish is false when guard file is missing',
    () async {
      expect(await shouldSkipForecastReplenish(), isFalse);
    },
  );

  test('shouldSkipForecastReplenish is true inside cooldown window', () async {
    await markForecastRescheduleCompleted();

    expect(await shouldSkipForecastReplenish(), isTrue);
  });

  test('shouldSkipForecastReplenish is false after cooldown expires', () async {
    await markForecastRescheduleCompleted(DateTime.utc(2026, 6, 21, 11, 0));

    expect(await shouldSkipForecastReplenish(), isFalse);
  });

  test('markForecastRescheduleCompleted writes epoch millis', () async {
    final at = DateTime.utc(2026, 6, 21, 12, 0);
    await markForecastRescheduleCompleted(at);

    expect(await guardFile.readAsString(), '${at.millisecondsSinceEpoch}');
  });
}
