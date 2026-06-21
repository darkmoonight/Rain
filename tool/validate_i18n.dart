// ignore_for_file: avoid_printв динамическом режиме н

import 'dart:convert';
import 'dart:io';

/// Keys allowed to match [baseLocale] in every other locale.
const allowedEnglishI18nKeys = {
  'timeUnavailable',
  'discord',
  'telegram',
  'widget',
  'mi',
  'mph',
  'mm',
  'km',
  'hPa',
  'kph',
  'm/s',
  'mmHg',
  'celsius',
  'fahrenheit',
  'pm25',
  'pm10',
  'co',
  'no2',
  'so2',
  'ozone',
  'uvIndex',
  '12',
  '24',
  'W/m2',
  'fontBarlowCondensed',
  'fontBarlow',
  'fontComfortaa',
  'fontDMSans',
  'fontExo2',
  'fontFiraSans',
  'fontInter',
  'fontJost',
  'fontLato',
  'fontManrope',
  'fontMontserrat',
  'fontMulish',
  'fontNunito',
  'fontOpenSans',
  'fontOswald',
  'fontOutfit',
  'fontPlusJakartaSans',
  'fontPoppins',
  'fontQuicksand',
  'fontRaleway',
  'fontRoboto',
  'fontRubik',
  'fontSourceSans3',
  'fontUbuntu',
  'fontWorkSans',
  'fontDmSans',
  'fontFigtree',
  'fontIbmPlexSans',
  'fontJosefinSans',
  'fontKanit',
  'fontLexend',
  'fontNotoSans',
  'fontPlayfairDisplay',
  'fontPtSans',
  'fontSpaceGrotesk',
};

/// Whether [key] may legitimately match the base locale in translated files.
bool isAllowedEnglishI18nKey(String key) {
  if (allowedEnglishI18nKeys.contains(key)) return true;
  if (key.startsWith('font')) return true;
  if (key.startsWith('colorPalette')) return true;
  return false;
}

/// Validates i18n JSON files under [i18nDir].
///
/// Returns 1 when key parity fails or, with [failOnEnglish], when non-base
/// locales contain unexpected English copies of translatable keys.
int runValidateI18n({
  String i18nDir = 'assets/i18n',
  String baseLocale = 'en-US',
  bool reportEnglish = true,
  bool failOnEnglish = false,
}) {
  final baseFile = File('$i18nDir/$baseLocale.i18n.json');
  if (!baseFile.existsSync()) {
    stderr.writeln('Missing base locale: ${baseFile.path}');
    return 1;
  }

  final baseKeys = _loadKeys(baseFile);
  var failed = false;

  for (final entity in Directory(i18nDir).listSync().whereType<File>()) {
    if (!entity.path.endsWith('.i18n.json')) continue;
    final name = entity.uri.pathSegments.last.replaceAll('.i18n.json', '');
    final keys = _loadKeys(entity);

    final missing = baseKeys.difference(keys);
    final extra = keys.difference(baseKeys);
    if (missing.isNotEmpty || extra.isNotEmpty) {
      failed = true;
      print('$name: missing=${missing.length} extra=${extra.length}');
      if (missing.isNotEmpty) print('  missing: ${missing.take(5).join(', ')}');
      if (extra.isNotEmpty) print('  extra: ${extra.take(5).join(', ')}');
    }

    if (!reportEnglish || name == baseLocale) continue;

    final baseJson =
        jsonDecode(baseFile.readAsStringSync()) as Map<String, dynamic>;
    final localeJson =
        jsonDecode(entity.readAsStringSync()) as Map<String, dynamic>;
    final identical = <String>[];
    for (final key in baseKeys) {
      if (isAllowedEnglishI18nKey(key)) continue;
      if (localeJson[key] == baseJson[key]) identical.add(key);
    }
    if (identical.isNotEmpty) {
      print('$name: ${identical.length} keys identical to $baseLocale');
      for (final key in identical.take(10)) {
        print('  $key');
      }
      if (identical.length > 10) {
        print('  ...');
      }
      if (failOnEnglish) {
        failed = true;
      }
    }
  }

  if (failed) return 1;
  print('i18n validation passed (${baseKeys.length} keys)');
  return 0;
}

/// CLI entry point for i18n validation.
void main(List<String> args) {
  final code = runValidateI18n(
    reportEnglish: !args.contains('--no-english-check'),
    failOnEnglish: args.contains('--fail-on-english'),
  );
  if (code != 0) exit(code);
}

Set<String> _loadKeys(File file) {
  final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  return json.keys.toSet();
}
