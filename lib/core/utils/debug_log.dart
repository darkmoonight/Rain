import 'package:flutter/foundation.dart';

void debugLogError(String context, Object error, [StackTrace? stackTrace]) {
  if (!kDebugMode) return;
  debugPrint('$context: $error');
  if (stackTrace != null) debugPrint(stackTrace.toString());
}
