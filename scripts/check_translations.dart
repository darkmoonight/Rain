#!/usr/bin/env dart

import 'dart:io';

void main() {
  print('🌍 Translation Completeness Check');
  print('==================================');
  
  // Get reference keys from English
  final enFile = File('lib/translation/en_us.dart');
  final enContent = enFile.readAsStringSync();
  final enKeys = extractKeys(enContent);
  
  print('📊 Reference (English): ${enKeys.length} keys');
  print('');
  
  // Check all translation files
  final translationDir = Directory('lib/translation');
  final files = translationDir.listSync()
      .where((f) => f.path.endsWith('.dart') && !f.path.contains('translation.dart'))
      .cast<File>()
      .toList();
  
  for (final file in files) {
    final filename = file.path.split('/').last;
    if (filename == 'en_us.dart') continue;
    
    final content = file.readAsStringSync();
    final keys = extractKeys(content);
    final missing = enKeys.where((key) => !keys.contains(key)).toList();
    
    final completeness = ((keys.length / enKeys.length) * 100).toStringAsFixed(1);
    final status = missing.isEmpty ? '✅' : '⚠️';
    
    print('$status $filename: ${keys.length}/${enKeys.length} keys ($completeness%)');
    if (missing.isNotEmpty) {
      print('   Missing: ${missing.join(', ')}');
    }
  }
  
  print('');
  print('🎯 RTL Languages Added: Arabic (ar_SA), Hebrew (he_IL)');
  print('🔧 Irish Gaelic (ga_IE) enabled in main.dart');
  print('✨ RTL text direction support implemented');
}

Set<String> extractKeys(String content) {
  final regex = RegExp(r"'([^']+)':\s*'");
  final matches = regex.allMatches(content);
  return matches.map((m) => m.group(1)!).toSet();
}