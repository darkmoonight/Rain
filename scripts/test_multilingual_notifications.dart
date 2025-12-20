import 'dart:io';

/// Test script to verify multilingual notification translations
void main() async {
  print('🌍 Testing Multilingual Notification Support...\n');
  
  final translationDir = Directory('lib/translation');
  final files = translationDir.listSync()
      .where((file) => file.path.endsWith('.dart') && !file.path.endsWith('translation.dart'))
      .cast<File>()
      .toList();

  // Key notification translation keys to check
  final requiredKeys = [
    'notification_severe_weather_title',
    'notification_rain_alert_title',
    'notification_wind_warning_title',
    'notification_temperature_extreme_title',
    'notification_outdoor_activity_title',
    'bring_umbrella',
    'check_radar',
    'view_forecast',
  ];

  int totalFiles = 0;
  int filesWithTranslations = 0;
  Map<String, List<String>> missingKeys = {};

  for (final file in files) {
    final fileName = file.path.split('/').last.replaceAll('.dart', '');
    totalFiles++;
    
    try {
      final content = await file.readAsString();
      
      // Check if file has notification translations
      bool hasNotificationKeys = false;
      List<String> missing = [];
      
      for (final key in requiredKeys) {
        if (content.contains("'$key'")) {
          hasNotificationKeys = true;
        } else {
          missing.add(key);
        }
      }
      
      if (hasNotificationKeys) {
        filesWithTranslations++;
        if (missing.isNotEmpty) {
          missingKeys[fileName] = missing;
        }
        print('✅ $fileName - Has notification translations (${requiredKeys.length - missing.length}/${requiredKeys.length} keys)');
      } else {
        print('❌ $fileName - Missing all notification translations');
        missingKeys[fileName] = requiredKeys;
      }
      
    } catch (e) {
      print('⚠️  Error reading $fileName: $e');
    }
  }
  
  print('\n📊 SUMMARY:');
  print('   Total language files: $totalFiles');
  print('   Files with notification translations: $filesWithTranslations');
  print('   Coverage: ${(filesWithTranslations / totalFiles * 100).toStringAsFixed(1)}%');
  
  if (missingKeys.isNotEmpty) {
    print('\n⚠️  FILES WITH MISSING KEYS:');
    missingKeys.forEach((fileName, keys) {
      print('   $fileName: ${keys.length} missing keys');
      if (keys.length <= 3) {
        print('     Missing: ${keys.join(', ')}');
      }
    });
  }
  
  // Test specific language examples
  print('\n🔍 TESTING SPECIFIC LANGUAGES:');
  await _testLanguageTranslations('en_us', 'English');
  await _testLanguageTranslations('hi_in', 'Hindi');
  await _testLanguageTranslations('ar_sa', 'Arabic');
  await _testLanguageTranslations('es_es', 'Spanish');
  await _testLanguageTranslations('de_de', 'German');
  
  if (filesWithTranslations == totalFiles) {
    print('\n🎉 SUCCESS: All language files have notification translations!');
    print('📱 Multilingual notifications are ready to use.');
  } else {
    print('\n⚠️  Some language files are missing notification translations.');
    print('   Run the add_smart_notification_translations.dart script to fix this.');
  }
}

Future<void> _testLanguageTranslations(String languageCode, String languageName) async {
  try {
    final file = File('lib/translation/$languageCode.dart');
    if (!await file.exists()) {
      print('   ❌ $languageName ($languageCode): File not found');
      return;
    }
    
    final content = await file.readAsString();
    
    // Check for key notification translations
    final testKeys = [
      'notification_severe_weather_title',
      'notification_rain_alert_title',
      'bring_umbrella',
    ];
    
    int foundKeys = 0;
    for (final key in testKeys) {
      if (content.contains("'$key'")) {
        foundKeys++;
      }
    }
    
    if (foundKeys == testKeys.length) {
      print('   ✅ $languageName ($languageCode): All test keys found');
      
      // Extract a sample translation to show it's working
      final match = RegExp(r"'notification_severe_weather_title':\s*'([^']+)'").firstMatch(content);
      if (match != null) {
        print('      Sample: "${match.group(1)}"');
      }
    } else {
      print('   ⚠️  $languageName ($languageCode): $foundKeys/${testKeys.length} test keys found');
    }
    
  } catch (e) {
    print('   ❌ $languageName ($languageCode): Error - $e');
  }
}