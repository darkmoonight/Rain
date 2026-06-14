import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';

/// In-memory snapshot of user-facing app settings for UI and services.
class AppSettingsState {
  const AppSettingsState({
    this.amoledTheme = false,
    this.materialColor = false,
    this.roundDegree = false,
    this.largeElement = false,
    this.locale = const Locale('en', 'US'),
    this.timeRange = AppConstants.defaultNotificationIntervalHours,
    this.timeStart = AppConstants.defaultNotificationTimeStart,
    this.timeEnd = AppConstants.defaultNotificationTimeEnd,
    this.widgetBackgroundColorLight = '',
    this.widgetBackgroundColorDark = '',
    this.widgetTextColorLight = '',
    this.widgetTextColorDark = '',
  });

  final bool amoledTheme;
  final bool materialColor;
  final bool roundDegree;
  final bool largeElement;
  final Locale locale;
  final int timeRange;
  final String timeStart;
  final String timeEnd;
  final String widgetBackgroundColorLight;
  final String widgetBackgroundColorDark;
  final String widgetTextColorLight;
  final String widgetTextColorDark;

  /// Returns a copy with selectively replaced theme, locale, widget, and notification fields.
  AppSettingsState copyWith({
    bool? amoledTheme,
    bool? materialColor,
    bool? roundDegree,
    bool? largeElement,
    Locale? locale,
    int? timeRange,
    String? timeStart,
    String? timeEnd,
    String? widgetBackgroundColorLight,
    String? widgetBackgroundColorDark,
    String? widgetTextColorLight,
    String? widgetTextColorDark,
  }) => AppSettingsState(
    amoledTheme: amoledTheme ?? this.amoledTheme,
    materialColor: materialColor ?? this.materialColor,
    roundDegree: roundDegree ?? this.roundDegree,
    largeElement: largeElement ?? this.largeElement,
    locale: locale ?? this.locale,
    timeRange: timeRange ?? this.timeRange,
    timeStart: timeStart ?? this.timeStart,
    timeEnd: timeEnd ?? this.timeEnd,
    widgetBackgroundColorLight:
        widgetBackgroundColorLight ?? this.widgetBackgroundColorLight,
    widgetBackgroundColorDark:
        widgetBackgroundColorDark ?? this.widgetBackgroundColorDark,
    widgetTextColorLight: widgetTextColorLight ?? this.widgetTextColorLight,
    widgetTextColorDark: widgetTextColorDark ?? this.widgetTextColorDark,
  );
}
