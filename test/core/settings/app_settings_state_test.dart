import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/settings/app_settings_state.dart';

void main() {
  group('AppSettingsState.copyWith', () {
    const initial = AppSettingsState(
      amoledTheme: false,
      materialColor: true,
      roundDegree: false,
      largeElement: true,
      locale: Locale('en', 'US'),
      timeRange: 3,
      timeStart: '08:00',
      timeEnd: '22:00',
      widgetBackgroundColor: '#111111',
      widgetTextColor: '#FFFFFF',
    );

    test('preserves unchanged fields', () {
      final copy = initial.copyWith(amoledTheme: true);
      expect(copy.amoledTheme, isTrue);
      expect(copy.materialColor, isTrue);
      expect(copy.locale, initial.locale);
      expect(copy.timeStart, '08:00');
    });

    test('replaces notification and widget fields', () {
      final copy = initial.copyWith(
        timeRange: 6,
        timeStart: '09:00',
        timeEnd: '21:00',
        widgetBackgroundColor: '#000000',
        widgetTextColor: '#EEEEEE',
      );
      expect(copy.timeRange, 6);
      expect(copy.timeStart, '09:00');
      expect(copy.timeEnd, '21:00');
      expect(copy.widgetBackgroundColor, '#000000');
      expect(copy.widgetTextColor, '#EEEEEE');
    });
  });
}
