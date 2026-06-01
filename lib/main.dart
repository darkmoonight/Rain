import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/app.dart';
import 'package:rain/core/bootstrap/app_initializer.dart';
import 'package:rain/core/di/provider_refs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bootstrap = await AppInitializer.initialize();
  runApp(
    ProviderScope(
      overrides: [bootstrapProvider.overrideWithValue(bootstrap)],
      child: RainApp(bootstrap: bootstrap),
    ),
  );
}
