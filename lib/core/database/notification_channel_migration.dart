import 'package:isar_community/isar.dart';
import 'package:rain/core/bootstrap/background_bootstrap.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/data/models/db.dart';

/// Deletes legacy Android forecast channels and bumps [Settings.notificationChannelVersion].
///
/// Returns `reschedule: true` when migration ran and forecast notifications are
/// enabled — pending alarms must be replanned because channel ids changed.
Future<({bool migrated, bool reschedule})>
performNotificationChannelMigrationIfNeeded(
  Isar isar,
  Settings settings, {
  Future<void> Function()? deleteLegacyChannels,
}) async {
  if (settings.notificationChannelVersion >=
      AppConstants.notificationChannelSchemaVersion) {
    return (migrated: false, reschedule: false);
  }

  await (deleteLegacyChannels ?? deleteLegacyForecastNotificationChannels)();
  settings.notificationChannelVersion =
      AppConstants.notificationChannelSchemaVersion;
  await isar.writeTxn(() => isar.settings.put(settings));
  return (migrated: true, reschedule: settings.notifications);
}
