import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';

const _lastRefreshAtKey = 'last_background_refresh_at';
const _lastRefreshErrorKey = 'last_background_refresh_error';

/// Persists the result of the latest background widget refresh for diagnostics.
Future<void> recordBackgroundRefreshResult({
  required bool success,
  String? error,
}) async {
  final now = DateTime.now().toUtc().toIso8601String();
  try {
    await HomeWidget.saveWidgetData(_lastRefreshAtKey, now);
    if (error == null || error.isEmpty) {
      await HomeWidget.saveWidgetData<String>(_lastRefreshErrorKey, null);
    } else {
      await HomeWidget.saveWidgetData(_lastRefreshErrorKey, error);
    }
  } catch (e, st) {
    logBackgroundError('recordBackgroundRefreshResult', e, st);
  }

  if (success) {
    debugPrint('RainBackground: refresh succeeded at $now');
  } else {
    debugPrint('RainBackground: refresh failed at $now — $error');
  }
}

/// Reads the last background refresh timestamp written by WorkManager.
Future<DateTime?> readLastBackgroundRefreshAt() async {
  try {
    final raw = await HomeWidget.getWidgetData<String>(_lastRefreshAtKey);
    if (raw == null || raw.isEmpty) return null;
    return DateTime.tryParse(raw);
  } catch (e, st) {
    logBackgroundError('readLastBackgroundRefreshAt', e, st);
    return null;
  }
}

/// Reads the last background refresh error message, if any.
Future<String?> readLastBackgroundRefreshError() async {
  try {
    return await HomeWidget.getWidgetData<String>(_lastRefreshErrorKey);
  } catch (e, st) {
    logBackgroundError('readLastBackgroundRefreshError', e, st);
    return null;
  }
}
