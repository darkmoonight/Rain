import 'package:rain/data/models/db.dart';
import 'package:rain/features/cities/application/cities_notifier.dart';
import 'package:rain/features/weather/application/main_weather_notifier.dart';
import 'fixtures.dart';

/// Main weather notifier with fixture data and no background init.
class LoadedMainWeatherNotifier extends MainWeatherNotifier {
  @override
  MainWeatherState build() => MainWeatherState(
    isLoading: false,
    mainWeather: weeklyMainWeatherCache(),
    location: sampleLocationCache(),
  );
}

/// Idle cities list without loading flags.
class IdleCitiesNotifier extends CitiesNotifier {
  @override
  CitiesState build() => const CitiesState(isLoading: false);
}

/// Cities notifier that skips network refresh on shell startup.
class NoOpCitiesNotifier extends CitiesNotifier {
  @override
  CitiesState build() => const CitiesState(isLoading: false);

  @override
  Future<void> refresh({bool all = true}) async {}
}

/// Loading main weather state for shimmer tests.
class LoadingMainWeatherNotifier extends MainWeatherNotifier {
  @override
  MainWeatherState build() => MainWeatherState(isLoading: true);
}

/// Empty forecast cache for offline/empty UI tests.
class EmptyMainWeatherNotifier extends MainWeatherNotifier {
  @override
  MainWeatherState build() =>
      MainWeatherState(isLoading: false, location: sampleLocationCache());
}

/// Cities notifier exposing a fixed card list.
class CitiesWithCardsNotifier extends CitiesNotifier {
  CitiesWithCardsNotifier(this.cards);

  final List<WeatherCard> cards;

  @override
  CitiesState build() => CitiesState(cards: cards, isLoading: false);

  @override
  Future<void> refresh({bool all = true}) async {}
}
