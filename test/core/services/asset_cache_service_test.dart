import 'dart:io';

import '../../helpers/fake_path_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/services/asset_cache_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    installFakePathProvider();
  });

  group('AssetCacheService', () {
    late AssetCacheService service;

    setUp(() {
      service = AssetCacheService();
    });

    test('getLocalImagePath copies bundled icon to disk', () async {
      final path = await service.getLocalImagePath('cloud.png');

      expect(File(path).existsSync(), isTrue);
      expect(path, contains('widget_icons'));
      expect(path, endsWith('cloud.png'));
    });

    test('getLocalImagePath reuses cached file', () async {
      final first = await service.getLocalImagePath('cloud.png');
      final second = await service.getLocalImagePath('cloud.png');

      expect(second, first);
    });

    test('empty icon falls back to cloud.png', () async {
      final path = await service.getLocalImagePath('');

      expect(path, endsWith('cloud.png'));
      expect(File(path).existsSync(), isTrue);
    });
  });
}
