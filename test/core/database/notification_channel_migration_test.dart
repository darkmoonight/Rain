import '../../helpers/isar_test_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/database/notification_channel_migration.dart';
import 'package:rain/data/models/db.dart';

void main() {
  late TestIsarContext ctx;

  setUp(() async {
    ctx = await openTestIsar();
  });

  group('performNotificationChannelMigrationIfNeeded', () {
    test('migrates legacy channel version and requests reschedule', () async {
      final settings = Settings()
        ..notificationChannelVersion = 0
        ..notifications = true;

      final result = await performNotificationChannelMigrationIfNeeded(
        ctx.isar,
        settings,
        deleteLegacyChannels: () async {},
      );

      expect(result.migrated, isTrue);
      expect(result.reschedule, isTrue);
      expect(
        settings.notificationChannelVersion,
        AppConstants.notificationChannelSchemaVersion,
      );
    });

    test('skips when schema is already current', () async {
      final settings = Settings()
        ..notificationChannelVersion =
            AppConstants.notificationChannelSchemaVersion
        ..notifications = true;

      final result = await performNotificationChannelMigrationIfNeeded(
        ctx.isar,
        settings,
        deleteLegacyChannels: () async {},
      );

      expect(result.migrated, isFalse);
      expect(result.reschedule, isFalse);
    });

    test(
      'does not request reschedule when notifications are disabled',
      () async {
        final settings = Settings()
          ..notificationChannelVersion = 0
          ..notifications = false;

        final result = await performNotificationChannelMigrationIfNeeded(
          ctx.isar,
          settings,
          deleteLegacyChannels: () async {},
        );

        expect(result.migrated, isTrue);
        expect(result.reschedule, isFalse);
      },
    );
  });
}
