import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';

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
    this.widgetBackgroundColor = '',
    this.widgetTextColor = '',
  });

  final bool amoledTheme;
  final bool materialColor;
  final bool roundDegree;
  final bool largeElement;
  final Locale locale;
  final int timeRange;
  final String timeStart;
  final String timeEnd;
  final String widgetBackgroundColor;
  final String widgetTextColor;

  AppSettingsState copyWith({
    bool? amoledTheme,
    bool? materialColor,
    bool? roundDegree,
    bool? largeElement,
    Locale? locale,
    int? timeRange,
    String? timeStart,
    String? timeEnd,
    String? widgetBackgroundColor,
    String? widgetTextColor,
  }) => AppSettingsState(
    amoledTheme: amoledTheme ?? this.amoledTheme,
    materialColor: materialColor ?? this.materialColor,
    roundDegree: roundDegree ?? this.roundDegree,
    largeElement: largeElement ?? this.largeElement,
    locale: locale ?? this.locale,
    timeRange: timeRange ?? this.timeRange,
    timeStart: timeStart ?? this.timeStart,
    timeEnd: timeEnd ?? this.timeEnd,
    widgetBackgroundColor: widgetBackgroundColor ?? this.widgetBackgroundColor,
    widgetTextColor: widgetTextColor ?? this.widgetTextColor,
  );
}
