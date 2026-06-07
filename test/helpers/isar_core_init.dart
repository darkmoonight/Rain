import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:isar_community/isar.dart';

/// Initializes Isar Core for tests using [isar_community_flutter_libs] when available.
///
/// See [isar-community](https://github.com/isar-community) and
/// [isar_community pub docs](https://pub.dev/documentation/isar_community/latest/):
/// prefer a local `libisar` binary over `download: true` so parallel `flutter test`
/// runs do not race on HTTP downloads.
Future<void> initializeIsarCoreForTests() async {
  final localLib = await findBundledIsarLib();
  if (localLib != null) {
    await Isar.initializeIsarCore(libraries: {Abi.current(): localLib});
    return;
  }

  await Isar.initializeIsarCore(download: true);
}

/// Returns the path to `libisar` shipped in [isar_community_flutter_libs], if present.
Future<String?> findBundledIsarLib() async {
  final packageRoot = await _packageRoot('isar_community_flutter_libs');
  if (packageRoot == null) return null;

  final relative = _relativeLibPath();
  if (relative == null) return null;

  final path = '$packageRoot/$relative';
  return File(path).existsSync() ? path : null;
}

String? _relativeLibPath() {
  if (Platform.isLinux) return 'linux/libisar.so';
  if (Platform.isMacOS) return 'macos/libisar.dylib';
  if (Platform.isWindows) return 'windows/libisar.dll';
  return null;
}

Future<String?> _packageRoot(String packageName) async {
  final configFile = File('.dart_tool/package_config.json');
  if (!configFile.existsSync()) return null;

  final json =
      jsonDecode(configFile.readAsStringSync()) as Map<String, dynamic>;
  final packages = json['packages'] as List<dynamic>;
  for (final entry in packages) {
    final map = entry as Map<String, dynamic>;
    if (map['name'] == packageName) {
      final rootUri = map['rootUri'] as String;
      return Uri.parse(rootUri).toFilePath();
    }
  }
  return null;
}
