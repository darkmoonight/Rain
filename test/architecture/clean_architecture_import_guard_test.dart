import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Paths under lib/ that may import Isar persistence models (`db.dart`).
const _allowedDbImportPrefixes = <String>[
  'lib/data/',
  'lib/core/database/',
  'lib/core/bootstrap/',
  'lib/core/services/notification_isar_bridge.dart',
  'lib/core/services/home_widget_service.dart',
  'lib/core/services/widget_background_service.dart',
  'lib/core/settings/clock_skew_persistence.dart',
];

/// Paths that may import concrete `data/repositories/*` implementations.
const _allowedDataRepositoryImportPrefixes = <String>[
  'lib/data/',
  'lib/core/di/provider_refs.dart',
  'lib/core/settings/clock_skew_persistence.dart',
  'lib/core/services/widget_background_service.dart',
];

bool _allowsPrefix(String relativePath, List<String> allowed) {
  for (final prefix in allowed) {
    if (relativePath == prefix || relativePath.startsWith(prefix)) {
      return true;
    }
  }
  return false;
}

bool _isFeatureOrCore(String relativePath) =>
    relativePath.startsWith('lib/features/') ||
    relativePath.startsWith('lib/core/');

Iterable<String> _dartFilesUnderLib() sync* {
  final lib = Directory('lib');
  for (final entity in lib.listSync(recursive: true)) {
    if (entity is! File || !entity.path.endsWith('.dart')) continue;
    yield entity.path.replaceAll(r'\', '/');
  }
}

void main() {
  test('features and non-adapter core must not import data/models/db.dart', () {
    expect(Directory('lib').existsSync(), isTrue);

    final violations = <String>[];
    for (final relative in _dartFilesUnderLib()) {
      if (_allowsPrefix(relative, _allowedDbImportPrefixes)) continue;

      final content = File(relative).readAsStringSync();
      if (content.contains('package:rain/data/models/db.dart')) {
        violations.add(relative);
      }
    }

    expect(
      violations,
      isEmpty,
      reason: 'Unexpected db.dart imports:\n${violations.join('\n')}',
    );
  });

  test('features and non-adapter core must not import data/repositories/*', () {
    expect(Directory('lib').existsSync(), isTrue);

    final violations = <String>[];
    for (final relative in _dartFilesUnderLib()) {
      if (!_isFeatureOrCore(relative)) continue;
      if (_allowsPrefix(relative, _allowedDataRepositoryImportPrefixes)) {
        continue;
      }

      final content = File(relative).readAsStringSync();
      if (content.contains('package:rain/data/repositories/')) {
        violations.add(relative);
      }
    }

    expect(
      violations,
      isEmpty,
      reason: 'Unexpected data/repositories imports:\n${violations.join('\n')}',
    );
  });
}
