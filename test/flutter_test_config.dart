import 'dart:async';

import 'helpers/isar_core_init.dart';
import 'helpers/isar_test_helper.dart';

/// Initializes Isar once per test isolate before any tests run.
Future<void> testExecutable(Future<void> Function() testMain) async {
  await initializeIsarCoreForTests();
  await testMain();
  await closeSharedTestIsar();
}
