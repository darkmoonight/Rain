import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/app.dart';
import 'package:rain/core/bootstrap/app_initializer.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/utils/debug_log.dart';

/// Entry point: bootstraps dependencies and runs [RainApp].
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugLogError('FlutterError', details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugLogError('PlatformDispatcher', error, stack);
    return true;
  };

  final bootstrap = await AppInitializer.initialize();
  runApp(
    ProviderScope(
      overrides: [bootstrapProvider.overrideWithValue(bootstrap)],
      child: RainApp(bootstrap: bootstrap),
    ),
  );
}
