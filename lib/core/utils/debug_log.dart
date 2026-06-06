import 'package:flutter/foundation.dart';

/// Logs an error with optional stack trace in debug builds only.
void debugLogError(String context, Object error, [StackTrace? stackTrace]) {
  if (!kDebugMode) return;
  debugPrint('$context: $error');
  if (stackTrace != null) debugPrint(stackTrace.toString());
}
