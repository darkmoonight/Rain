import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/database/widget_color_migration.dart';
import 'package:rain/data/models/db.dart';

void main() {
  late TestIsarContext ctx;

  setUp(() async {
    ctx = await openTestIsar();
  });

  group('migrateWidgetThemeColorsIfNeeded', () {
    test('copies legacy colors to light and dark fields', () async {
      final settings = Settings()
        ..widgetBackgroundColor = '#AABBCC'
        ..widgetTextColor = '#112233';

      final migrated = await migrateWidgetThemeColorsIfNeeded(
        ctx.isar,
        settings,
      );

      expect(migrated, isTrue);
      expect(settings.widgetBackgroundColorLight, '#AABBCC');
      expect(settings.widgetBackgroundColorDark, '#AABBCC');
      expect(settings.widgetTextColorLight, '#112233');
      expect(settings.widgetTextColorDark, '#112233');
      expect(settings.widgetBackgroundColor, isNull);
      expect(settings.widgetTextColor, isNull);
    });

    test('returns false when no legacy colors exist', () async {
      final settings = Settings();

      final migrated = await migrateWidgetThemeColorsIfNeeded(
        ctx.isar,
        settings,
      );

      expect(migrated, isFalse);
    });
  });
}
