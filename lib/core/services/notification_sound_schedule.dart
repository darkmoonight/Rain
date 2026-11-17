import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

/// Persists the last forecast schedule sound preference and channel id.
///
/// Survives cold starts so [NotificationService.ensureForecastNotificationsScheduled]
/// can force a full reschedule when [AppSettings.notificationSound] or the active
/// sound channel id disagrees with pending alarms.
///
/// File format: `0` / `1` (legacy) or `0|` / `1|RainForecastSoundV3b`.
const _soundScheduleFileName = 'forecast_sound_schedule.txt';

/// Last recorded schedule: sound on/off and optional sound channel id.
class ScheduledNotificationSoundState {
  const ScheduledNotificationSoundState({
    required this.withSound,
    this.channelId,
  });

  final bool withSound;

  /// Sound channel used when [withSound] was true; null for silent or legacy rows.
  final String? channelId;
}

typedef SoundScheduleFileFactory = Future<File> Function();

SoundScheduleFileFactory? _soundScheduleFileFactory;

/// Overrides the sound-schedule file location for tests.
@visibleForTesting
void setNotificationSoundScheduleTestDependencies({
  SoundScheduleFileFactory? fileFactory,
}) {
  _soundScheduleFileFactory = fileFactory;
}

/// Resets [setNotificationSoundScheduleTestDependencies] overrides.
@visibleForTesting
void resetNotificationSoundScheduleTestDependencies() {
  _soundScheduleFileFactory = null;
}

Future<File> _soundScheduleFile() async {
  if (_soundScheduleFileFactory != null) return _soundScheduleFileFactory!();
  final dir = await getApplicationSupportDirectory();
  return File('${dir.path}${Platform.pathSeparator}$_soundScheduleFileName');
}

/// Parses a raw schedule line into state, or null if unreadable.
@visibleForTesting
ScheduledNotificationSoundState? parseScheduledNotificationSound(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  final parts = trimmed.split('|');
  final flag = parts[0];
  final bool withSound;
  if (flag == '1') {
    withSound = true;
  } else if (flag == '0') {
    withSound = false;
  } else {
    return null;
  }

  String? channelId;
  if (parts.length > 1) {
    final id = parts.sublist(1).join('|').trim();
    if (id.isNotEmpty) channelId = id;
  }
  return ScheduledNotificationSoundState(
    withSound: withSound,
    channelId: channelId,
  );
}

/// Last scheduled sound state, or null if never recorded / unreadable.
Future<ScheduledNotificationSoundState?>
readScheduledNotificationSoundState() async {
  try {
    final file = await _soundScheduleFile();
    if (!await file.exists()) return null;
    return parseScheduledNotificationSound(await file.readAsString());
  } catch (_) {
    return null;
  }
}

/// Last scheduled sound preference, or null if never recorded / unreadable.
Future<bool?> readScheduledNotificationSound() async {
  return (await readScheduledNotificationSoundState())?.withSound;
}

/// Records that forecast slots were scheduled with [withSound] (and optional channel).
Future<void> writeScheduledNotificationSound(
  bool withSound, {
  String? channelId,
}) async {
  try {
    final flag = withSound ? '1' : '0';
    final value = (channelId != null && channelId.isNotEmpty)
        ? '$flag|$channelId'
        : flag;
    await (await _soundScheduleFile()).writeAsString(value);
  } catch (_) {
    // Best-effort; ensure may top-up until the next successful write.
  }
}

/// Clears the persisted sound schedule flag (e.g. after cancelling all forecast).
Future<void> clearScheduledNotificationSound() async {
  try {
    final file = await _soundScheduleFile();
    if (await file.exists()) await file.delete();
  } catch (_) {
    // Best-effort.
  }
}
