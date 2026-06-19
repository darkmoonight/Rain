import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Summary row for one OSS dependency on the license screen.
class PackageLicenseInfo {
  const PackageLicenseInfo({
    required this.packageName,
    required this.paragraphCount,
  });

  final String packageName;
  final int paragraphCount;
}

final Map<String, String> _packageLicenseTextCache = {};

/// Drops cached license texts when the license screen closes.
void clearPackageLicenseCaches() => _packageLicenseTextCache.clear();

/// Clears in-memory license caches (tests only).
@visibleForTesting
void clearPackageLicenseCachesForTest() => clearPackageLicenseCaches();

/// Plain text from [LicenseEntry] paragraphs.
String licenseParagraphsText(Iterable<LicenseParagraph> paragraphs) =>
    paragraphs.map((paragraph) => paragraph.text).join('\n\n');

/// Yields to the UI thread while scanning [LicenseRegistry].
Future<void> _yieldToUi(int processed, {required int every}) async {
  if (processed % every == 0) {
    await Future<void>.delayed(Duration.zero);
  }
}

/// Loads package names and paragraph counts from [LicenseRegistry].
Future<List<PackageLicenseInfo>> loadPackageLicenses() async {
  await Future<void>.delayed(Duration.zero);

  final paragraphCounts = <String, int>{};
  var processed = 0;

  await for (final entry in LicenseRegistry.licenses) {
    for (final package in entry.packages) {
      paragraphCounts[package] =
          (paragraphCounts[package] ?? 0) + entry.paragraphs.length;
    }
    processed++;
    await _yieldToUi(processed, every: 50);
  }

  return paragraphCounts.entries
      .map(
        (entry) => PackageLicenseInfo(
          packageName: entry.key,
          paragraphCount: entry.value,
        ),
      )
      .toList()
    ..sort(
      (a, b) =>
          a.packageName.toLowerCase().compareTo(b.packageName.toLowerCase()),
    );
}

/// Loads full license text for one [packageName], with in-memory caching.
Future<String> loadPackageLicenseText(String packageName) async {
  final cached = _packageLicenseTextCache[packageName];
  if (cached != null) return cached;

  await Future<void>.delayed(Duration.zero);
  final buffer = StringBuffer();
  var processed = 0;

  await for (final entry in LicenseRegistry.licenses) {
    if (!entry.packages.contains(packageName)) continue;

    if (buffer.isNotEmpty) {
      buffer.write('\n\n');
    }
    buffer.write(licenseParagraphsText(entry.paragraphs));

    processed++;
    await _yieldToUi(processed, every: 25);
  }

  final text = buffer.toString();
  _packageLicenseTextCache[packageName] = text;
  return text;
}

/// OSS package list for [AppLicensePage].
final packageLicensesProvider =
    FutureProvider.autoDispose<List<PackageLicenseInfo>>((ref) async {
      ref.onDispose(clearPackageLicenseCaches);
      await Future<void>.delayed(Duration.zero);
      return loadPackageLicenses();
    });
