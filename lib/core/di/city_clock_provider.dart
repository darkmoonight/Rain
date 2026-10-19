import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Shared wall-clock tick for city cards (avoids per-card 1 Hz streams).
///
/// Emits immediately, then every 30 seconds so temperature indices and clocks
/// stay roughly in sync without N rebuilds per second.
final cityWallClockTickProvider = StreamProvider<DateTime>((ref) async* {
  yield DateTime.now();
  yield* Stream<DateTime>.periodic(
    const Duration(seconds: 30),
    (_) => DateTime.now(),
  );
});
