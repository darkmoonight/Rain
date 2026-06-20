import 'package:flutter_test/flutter_test.dart';
import 'package:rain/core/theme/color_palette.dart';

void main() {
  test('resolve falls back to default for unknown ids', () {
    expect(AppColorPalette.resolve('unknown'), AppColorPalette.defaultId);
    expect(AppColorPalette.resolve(null), AppColorPalette.defaultId);
  });

  test('each palette produces distinct light schemes', () {
    final purplePrimary = AppColorPalette.of('purple').lightScheme().primary;
    final bluePrimary = AppColorPalette.of('blue').lightScheme().primary;
    expect(purplePrimary, isNot(bluePrimary));
  });

  test('light schemes use Material You tonal surface roles', () {
    final scheme = AppColorPalette.of('purple').lightScheme();
    expect(scheme.surfaceContainerHighest, isNotNull);
    expect(scheme.tertiary, isNotNull);
  });

  test('catalog exposes 44 curated options', () {
    expect(AppColorPalette.choices, hasLength(44));
  });
}
