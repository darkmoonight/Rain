import 'package:isar_community/isar.dart';
import 'package:rain/data/models/db.dart';

/// Core runtime dependencies created during app startup.
class AppBootstrap {
  const AppBootstrap({
    required this.isar,
    required this.settings,
    required this.locationCache,
  });

  final Isar isar;
  final Settings settings;
  final LocationCache locationCache;
}
