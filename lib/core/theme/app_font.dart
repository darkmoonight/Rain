import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rain/i18n/tr.dart';

/// Built-in app font choices (Google Fonts or platform default).
class AppFont {
  AppFont._();

  static const String ubuntu = 'ubuntu';
  static const String system = 'system';
  static const String roboto = 'roboto';
  static const String barlowCondensed = 'barlowCondensed';
  static const String inter = 'inter';
  static const String openSans = 'openSans';

  /// Persisted font ids shown in settings.
  static const List<String> choices = [
    ubuntu,
    system,
    roboto,
    barlowCondensed,
    inter,
    openSans,
  ];

  /// Default font id (current Rain look).
  static const String defaultId = ubuntu;

  static final Map<String, TextTheme Function(TextTheme)> _textThemes = {
    system: (base) => base,
    roboto: GoogleFonts.robotoTextTheme,
    barlowCondensed: GoogleFonts.barlowCondensedTextTheme,
    inter: GoogleFonts.interTextTheme,
    openSans: GoogleFonts.openSansTextTheme,
    ubuntu: GoogleFonts.ubuntuTextTheme,
  };

  static final Map<String, String> _labelKeys = {
    system: 'fontSystem',
    roboto: 'fontRoboto',
    barlowCondensed: 'fontBarlowCondensed',
    inter: 'fontInter',
    openSans: 'fontOpenSans',
    ubuntu: 'fontUbuntu',
  };

  /// Normalizes unknown stored values to [defaultId].
  static String resolve(String? id) => choices.contains(id) ? id! : defaultId;

  /// Localized label for settings UI.
  static String label(String id) => _labelKeys[resolve(id)]!.tr;

  /// Applies the selected font to [baseTheme].
  static TextTheme textTheme(String? id, TextTheme baseTheme) =>
      _textThemes[resolve(id)]!(baseTheme);
}
