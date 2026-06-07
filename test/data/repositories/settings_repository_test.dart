import '../../helpers/fixtures.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/repositories/settings_repository.dart';

void main() {
  late TestIsarContext ctx;
  late SettingsRepository repository;
  var savedCount = 0;

  setUp(() async {
    ctx = await openTestIsar();
    savedCount = 0;
    repository = SettingsRepository(ctx.isar, onSaved: () => savedCount++);
  });

  tearDown(() async {});

  group('SettingsRepository', () {
    test('getSettings returns defaults when empty', () async {
      final settings = await repository.getSettings();
      expect(settings.onboard, isFalse);
    });

    test('save persists settings and invokes onSaved', () async {
      final settings = onboardedSettings()..theme = 'dark';

      await repository.save(settings);

      expect(savedCount, 1);
      final loaded = await repository.getSettings();
      expect(loaded.theme, 'dark');
    });

    test('getLocationCache returns empty model when absent', () async {
      final location = await repository.getLocationCache();
      expect(location.city, isNull);
    });
  });
}
