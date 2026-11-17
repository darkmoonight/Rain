import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Cooldown around a full forecast reschedule before background replenish runs.
///
/// [NotificationService.rescheduleForWeather] stamps this guard at the **start**
/// of cancel+schedule (and again in `finally`) so Workmanager /
/// [ensureForecastNotificationsScheduled] on another isolate skips while
/// reschedule is in flight — `_rescheduleInFlight` is isolate-local only.
///
/// 45 seconds covers typical cancel+schedule on slow devices plus a short
/// buffer after completion.
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

/// Records that a full reschedule started or finished (main or background isolate).
///
/// Called at the start of cancel+schedule and again when it finishes so the
/// cooldown covers the in-flight window across isolates.
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
