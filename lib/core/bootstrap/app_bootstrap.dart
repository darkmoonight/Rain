import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

/// Immutable startup context created during app initialization.
class AppBootstrap {
  const AppBootstrap({
    required this.isar,
    required this.settings,
    required this.locationCache,
    this.rescheduleForecastNotifications = false,
  });

  /// Local database opened before the first frame.
  final Isar isar;

  /// Persisted user settings loaded at startup.
  final Settings settings;

  /// Last known location used for the initial weather request.
  final LocationCache locationCache;

  /// Whether forecast notifications should be rescheduled on this launch.
  final bool rescheduleForecastNotifications;
}
