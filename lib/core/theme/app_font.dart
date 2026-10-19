import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rain/core/config/settings_catalog.dart';

typedef _GoogleTextThemeBuilder = TextTheme Function([TextTheme?]);

/// One row in the app font picker ([id] is stored in Isar settings).
class _FontEntry {
  const _FontEntry.google(this.id, this._googleTextTheme) : _system = false;

  const _FontEntry.system(this.id) : _googleTextTheme = null, _system = true;

  final String id;
  final _GoogleTextThemeBuilder? _googleTextTheme;
  final bool _system;

  TextTheme apply(TextTheme base) {
    if (_system) {
      return base.apply(fontFamily: AppFont.platformFontFamily());
    }
    return _googleTextTheme!(base);
  }
}

/// Built-in app font choices (Google Fonts or platform default).
///
/// To add a font: register an id in [_catalog] (A–Z after [system]), add a
/// `font<Id>` display name to every `assets/i18n/*.i18n.json`, then run slang.
class AppFont {
  /// Private constructor; use static methods only.
  AppFont._();

  /// Ubuntu font id.
  static const String ubuntu = 'ubuntu';

  /// Platform system font id.
  static const String system = 'system';

  /// Default font id (current Rain look).
  static const String defaultId = ubuntu;

  static const String _labelPrefix = 'font';

  /// Ordered catalog: app default and platform default first, then A–Z.
  static final List<_FontEntry> _catalog = [
    const _FontEntry.google(ubuntu, GoogleFonts.ubuntuTextTheme),
    const _FontEntry.system(system),
    const _FontEntry.google('barlowCondensed', GoogleFonts.barlowCondensedTextTheme),
    const _FontEntry.google('comfortaa', GoogleFonts.comfortaaTextTheme),
    const _FontEntry.google('dmSans', GoogleFonts.dmSansTextTheme),
    const _FontEntry.google('figtree', GoogleFonts.figtreeTextTheme),
    const _FontEntry.google('firaSans', GoogleFonts.firaSansTextTheme),
    const _FontEntry.google('ibmPlexSans', GoogleFonts.ibmPlexSansTextTheme),
    const _FontEntry.google('inter', GoogleFonts.interTextTheme),
    const _FontEntry.google('josefinSans', GoogleFonts.josefinSansTextTheme),
    const _FontEntry.google('kanit', GoogleFonts.kanitTextTheme),
    const _FontEntry.google('lato', GoogleFonts.latoTextTheme),
    const _FontEntry.google('lexend', GoogleFonts.lexendTextTheme),
    const _FontEntry.google('manrope', GoogleFonts.manropeTextTheme),
    const _FontEntry.google('montserrat', GoogleFonts.montserratTextTheme),
    const _FontEntry.google('notoSans', GoogleFonts.notoSansTextTheme),
    const _FontEntry.google('nunito', GoogleFonts.nunitoTextTheme),
    const _FontEntry.google('openSans', GoogleFonts.openSansTextTheme),
    const _FontEntry.google('oswald', GoogleFonts.oswaldTextTheme),
    const _FontEntry.google('outfit', GoogleFonts.outfitTextTheme),
    const _FontEntry.google('playfairDisplay', GoogleFonts.playfairDisplayTextTheme),
    const _FontEntry.google('poppins', GoogleFonts.poppinsTextTheme),
    const _FontEntry.google('ptSans', GoogleFonts.ptSansTextTheme),
    const _FontEntry.google('quicksand', GoogleFonts.quicksandTextTheme),
    const _FontEntry.google('raleway', GoogleFonts.ralewayTextTheme),
    const _FontEntry.google('roboto', GoogleFonts.robotoTextTheme),
    const _FontEntry.google('rubik', GoogleFonts.rubikTextTheme),
    const _FontEntry.google('sourceSans3', GoogleFonts.sourceSans3TextTheme),
    const _FontEntry.google('spaceGrotesk', GoogleFonts.spaceGroteskTextTheme),
    const _FontEntry.google('workSans', GoogleFonts.workSansTextTheme),
  ];

  static final Map<String, _FontEntry> _byId = {
    for (final entry in _catalog) entry.id: entry,
  };

  /// Persisted font ids shown in settings.
  static List<String> get choices => _catalog.map((entry) => entry.id).toList();

  /// Normalizes unknown stored values to [defaultId].
  static String resolve(String? id) =>
      SettingsCatalog.resolve(id, choices, defaultId);

  /// Localized label for settings UI.
  static String label(String id) =>
      SettingsCatalog.label(id, choices, defaultId, _labelPrefix);

  /// Applies the selected font to [baseTheme].
  static TextTheme textTheme(String? id, TextTheme baseTheme) =>
      _byId[resolve(id)]!.apply(baseTheme);

  /// Platform system font from the engine, with OS-specific fallbacks.
  ///
  /// Material defaults bake in Roboto on Android; this uses the engine-reported
  /// family when available (OEM fonts) or generic platform families otherwise.
  @visibleForTesting
  static String platformFontFamily({String? engineFamily}) {
    final resolved = engineFamily ?? _engineSystemFontFamily;
    if (resolved != null && resolved.isNotEmpty) return resolved;

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => 'sans-serif',
      TargetPlatform.iOS => '.AppleSystemUIFont',
      TargetPlatform.macOS => '.AppleSystemUIFont',
      TargetPlatform.windows => 'Segoe UI',
      TargetPlatform.linux => 'Roboto',
      _ => 'Roboto',
    };
  }

  /// Engine-reported system font family, when available.
  static String? get _engineSystemFontFamily =>
      WidgetsBinding.instance.platformDispatcher.systemFontFamily;
}
