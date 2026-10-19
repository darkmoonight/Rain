import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

/// Domain settings entity — no persistence annotations.
@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(false) bool onboard,
    @Default('system') String? theme,
    @Default(false) bool location,
    @Default(false) bool notifications,
    @Default(false) bool notificationSound,
    int? notificationWeekdaysMask,
    @Default(false) bool persistentNotification,
    @Default(false) bool materialColor,
    @Default('purple') String colorPalette,
    @Default(false) bool amoledTheme,
    @Default(false) bool roundDegree,
    @Default(false) bool largeElement,
    @Default(false) bool hideMap,
    String? widgetBackgroundColor,
    String? widgetTextColor,
    String? widgetBackgroundColorLight,
    String? widgetBackgroundColorDark,
    String? widgetTextColorLight,
    String? widgetTextColorDark,
    @Default('metric') String measurements,
    @Default('celsius') String degrees,
    @Default('kph') String wind,
    @Default('hPa') String pressure,
    @Default('24') String timeformat,
    @Default('ubuntu') String appFont,
    @Default('classic') String weatherIconTheme,
    @Default('european') String aqiStandard,
    String? language,
    int? timeRange,
    String? timeStart,
    String? timeEnd,
    @Default(0) int weatherCacheVersion,
    @Default(0) int notificationChannelVersion,
    @Default(0) int clockSkewSeconds,
  }) = _AppSettings;
}
