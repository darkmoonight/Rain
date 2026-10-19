import '../../helpers/fixtures.dart';
import 'package:rain/domain/entities/entities.dart';
import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/data/mappers/domain_mapper.dart';
import 'package:rain/data/repositories/settings_repository.dart';
import 'package:rain/domain/repositories/settings_repository.dart';

void main() {
  late TestIsarContext ctx;
  late SettingsRepository repository;
  var savedCount = 0;

  setUp(() async {
    ctx = await openTestIsar();
    savedCount = 0;
    repository = IsarSettingsRepository(ctx.isar, onSaved: () => savedCount++);
  });

  tearDown(() async {});

  group('SettingsRepository', () {
    test('getSettings returns defaults when empty', () async {
      final settings = await repository.getSettings();
      expect(settings.onboard, isFalse);
    });

    test('save persists settings and invokes onSaved', () async {
      final settings = DomainMapper.settingsToDomain(
        onboardedSettings(),
      ).copyWith(theme: 'dark');

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
