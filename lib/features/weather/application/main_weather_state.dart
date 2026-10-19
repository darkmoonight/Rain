
import 'package:rain/domain/entities/entities.dart';
/// One-shot user-facing feedback for the main weather tab (shown as a snackbar).
class MainWeatherUserMessage {
  const MainWeatherUserMessage(this.key, {this.isError = false});

  /// Slang / `.tr` message key.
  final String key;
  final bool isError;
}

/// Immutable state for the main weather tab and its cached location.
class MainWeatherState {
  /// Creates state with optional cache, location, and selected time indices.
  MainWeatherState({
    this.isLoading = true,
    WeatherForecast? mainWeather,
    GeoPlace? location,
    this.hourOfDay = 0,
    this.dayOfNow = 0,
    this.userMessage,
    this.userMessageId = 0,
  }) : mainWeather = mainWeather ?? WeatherForecast(),
       location = location ?? GeoPlace();

  final bool isLoading;
  final WeatherForecast mainWeather;
  final GeoPlace location;
  final int hourOfDay;
  final int dayOfNow;

  /// Pending snackbar payload; consumed by the presentation layer.
  final MainWeatherUserMessage? userMessage;

  /// Monotonic id so identical messages still trigger [ref.listen].
  final int userMessageId;

  /// Returns the cached city label, or an empty string when unset.
  String get city => location.city ?? '';

  /// City or district label for widgets and notifications.
  String get locationLabel => location.displayLabel;

  /// Returns the cached district label, or an empty string when unset.
  String get district => location.district ?? '';

  /// Returns a copy with selectively replaced forecast and index fields.
  MainWeatherState copyWith({
    bool? isLoading,
    WeatherForecast? mainWeather,
    GeoPlace? location,
    int? hourOfDay,
    int? dayOfNow,
    MainWeatherUserMessage? userMessage,
    int? userMessageId,
    bool clearUserMessage = false,
  }) => MainWeatherState(
    isLoading: isLoading ?? this.isLoading,
    mainWeather: mainWeather ?? this.mainWeather,
    location: location ?? this.location,
    hourOfDay: hourOfDay ?? this.hourOfDay,
    dayOfNow: dayOfNow ?? this.dayOfNow,
    userMessage: clearUserMessage
        ? null
        : (userMessage ?? this.userMessage),
    userMessageId: userMessageId ?? this.userMessageId,
  );
}

