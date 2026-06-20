import 'package:dynamic_system_colors/dynamic_system_colors.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:rain/core/config/settings_catalog.dart';

// Matches tonal mapping in dynamic_system_colors (Android Material You).
// ignore_for_file: deprecated_member_use

/// One row in the color palette picker ([id] is stored in Isar settings).
class _PaletteEntry {
  const _PaletteEntry(this.id, this.seedArgb);

  final String id;
  final int seedArgb;
}

/// Built-in accent palettes when dynamic system colors are disabled.
///
/// Schemes use [CorePalette] (same as [dynamic_system_colors]) instead of
/// [ColorScheme.fromSeed]. To add a palette: register id + seed in [_catalog],
/// add `colorPalette<Id>` to every `assets/i18n/*.i18n.json`, then run slang.
class AppColorPalette {
  AppColorPalette._({required this.id, required this.seedColor});

  final String id;

  /// Tonal seed used to derive a full Material 3 [CorePalette].
  final Color seedColor;

  static const String defaultId = 'purple';
  static const String _labelPrefix = 'colorPalette';

  /// Ordered catalog (hue groups: violet → blue → green → yellow → red → neutral).
  static const List<_PaletteEntry> _catalog = [
    _PaletteEntry('purple', 0xFF6750A4),
    _PaletteEntry('violet', 0xFF7A449B),
    _PaletteEntry('lavender', 0xFF6B5B95),
    _PaletteEntry('lilac', 0xFF8E72A9),
    _PaletteEntry('orchid', 0xFF875692),
    _PaletteEntry('indigo', 0xFF3F5289),
    _PaletteEntry('blue', 0xFF0061A4),
    _PaletteEntry('azure', 0xFF005FA6),
    _PaletteEntry('cobalt', 0xFF2643A0),
    _PaletteEntry('sky', 0xFF006783),
    _PaletteEntry('cyan', 0xFF006874),
    _PaletteEntry('aqua', 0xFF00838F),
    _PaletteEntry('teal', 0xFF006A6A),
    _PaletteEntry('turquoise', 0xFF008577),
    _PaletteEntry('mint', 0xFF006B56),
    _PaletteEntry('jade', 0xFF00695C),
    _PaletteEntry('green', 0xFF386A20),
    _PaletteEntry('emerald', 0xFF006E3C),
    _PaletteEntry('forest', 0xFF2E6F40),
    _PaletteEntry('sage', 0xFF4A6356),
    _PaletteEntry('lime', 0xFF536F00),
    _PaletteEntry('olive', 0xFF556B2F),
    _PaletteEntry('amber', 0xFF7D5700),
    _PaletteEntry('yellow', 0xFF6F5F00),
    _PaletteEntry('gold', 0xFF8B6914),
    _PaletteEntry('orange', 0xFF9A4600),
    _PaletteEntry('peach', 0xFF9C6B43),
    _PaletteEntry('copper', 0xFF9C4323),
    _PaletteEntry('coral', 0xFFB44314),
    _PaletteEntry('red', 0xFFBA1A1A),
    _PaletteEntry('crimson', 0xFF8C1D40),
    _PaletteEntry('maroon', 0xFF6F0014),
    _PaletteEntry('wine', 0xFF722F47),
    _PaletteEntry('raspberry', 0xFF9C004A),
    _PaletteEntry('pink', 0xFF984062),
    _PaletteEntry('rose', 0xFF904A77),
    _PaletteEntry('magenta', 0xFF9A0284),
    _PaletteEntry('brown', 0xFF6D4C41),
    _PaletteEntry('sand', 0xFF7C6E4F),
    _PaletteEntry('slate', 0xFF5C6578),
    _PaletteEntry('charcoal', 0xFF49454F),
    _PaletteEntry('navy', 0xFF1E3A5F),
    _PaletteEntry('midnight', 0xFF1A1F3D),
    _PaletteEntry('grape', 0xFF6B4C9A),
  ];

  static final Map<String, AppColorPalette> _byId = {
    for (final entry in _catalog)
      entry.id: AppColorPalette._(
        id: entry.id,
        seedColor: Color(entry.seedArgb),
      ),
  };

  /// Persisted palette ids shown in settings.
  static List<String> get choices => _catalog.map((entry) => entry.id).toList();

  /// Normalizes unknown stored values to [defaultId].
  static String resolve(String? id) =>
      SettingsCatalog.resolve(id, choices, defaultId);

  /// Localized label for settings UI.
  static String label(String id) =>
      SettingsCatalog.label(id, choices, defaultId, _labelPrefix);

  /// Returns the palette for [id], falling back to [defaultId].
  static AppColorPalette of(String? id) => _byId[resolve(id)]!;

  /// Preview swatch — primary/tertiary gradient like dynamic themes.
  static Widget previewLeading(String id) {
    final scheme = of(id).lightScheme();
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [scheme.primary, scheme.tertiary],
        ),
      ),
    );
  }

  ColorScheme lightScheme() => _materialYouScheme(Brightness.light);

  ColorScheme darkScheme() => _materialYouScheme(Brightness.dark);

  ColorScheme _materialYouScheme(Brightness brightness) => CorePalette.of(
    seedColor.toARGB32(),
  ).toColorScheme(brightness: brightness);
}
