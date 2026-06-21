import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Cooldown after a full forecast reschedule before background replenish runs.
///
/// Prevents [ensureForecastNotificationsScheduled] from re-adding stale slots
/// while a foreground cancel+schedule (settings change) is in flight.
///
/// 45 seconds covers typical cancel+schedule on slow devices plus a short
/// buffer so background replenish does not race with in-flight reschedule.
const forecastRescheduleReplenishCooldown = Duration(seconds: 45);

const _guardFileName = 'forecast_reschedule_guard.txt';

typedef GuardFileFactory = Future<File> Function();

GuardFileFactory? _guardFileFactory;
DateTime Function()? _now;

/// Overrides guard file location and clock for tests.
@visibleForTesting
void setForecastRescheduleGuardTestDependencies({
  GuardFileFactory? guardFileFactory,
  DateTime Function()? now,
}) {
  _guardFileFactory = guardFileFactory;
  _now = now;
}

/// Resets [setForecastRescheduleGuardTestDependencies] overrides.
@visibleForTesting
void resetForecastRescheduleGuardTestDependencies() {
  _guardFileFactory = null;
  _now = null;
}

DateTime _currentTime([DateTime? at]) => at ?? (_now?.call() ?? DateTime.now());

/// Guard file stores a single UTC epoch millis string from the last reschedule.
Future<File> _guardFile() async {
  if (_guardFileFactory != null) return _guardFileFactory!();
  final dir = await getApplicationSupportDirectory();
  return File('${dir.path}${Platform.pathSeparator}$_guardFileName');
}

/// Records that a full reschedule completed (main or background isolate).
Future<void> markForecastRescheduleCompleted([DateTime? at]) async {
  final millis = _currentTime(at).millisecondsSinceEpoch;
  try {
    await (await _guardFile()).writeAsString('$millis');
  } catch (_) {
    // Best-effort; replenish without guard on I/O failure.
  }
}

/// True when replenish should be skipped because a reschedule finished recently.
Future<bool> shouldSkipForecastReplenish({
  Duration cooldown = forecastRescheduleReplenishCooldown,
}) async {
  try {
    final file = await _guardFile();
    if (!await file.exists()) return false;
    final raw = await file.readAsString();
    final millis = int.tryParse(raw.trim());
    if (millis == null) return false;
    final elapsed = _currentTime().millisecondsSinceEpoch - millis;
    return elapsed >= 0 && elapsed < cooldown.inMilliseconds;
  } catch (_) {
    return false;
  }
}
