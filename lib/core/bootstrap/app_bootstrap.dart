import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

class AppBootstrap {
  const AppBootstrap({
    required this.isar,
    required this.settings,
    required this.locationCache,
    this.rescheduleForecastNotifications = false,
  });

  final Isar isar;
  final Settings settings;
  final LocationCache locationCache;

  final bool rescheduleForecastNotifications;
}
