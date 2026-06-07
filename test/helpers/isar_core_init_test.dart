import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'isar_core_init.dart';

void main() {
  test(
    'findBundledIsarLib resolves isar_community_flutter_libs binary',
    () async {
      final path = await findBundledIsarLib();
      if (path == null) {
        markTestSkipped('Bundled Isar lib not available on this platform');
        return;
      }

      expect(File(path).existsSync(), isTrue);
      expect(path, contains('isar_community_flutter_libs'));
      expect(
        path,
        anyOf(
          endsWith('libisar.so'),
          endsWith('libisar.dylib'),
          endsWith('libisar.dll'),
        ),
      );
    },
  );
}
