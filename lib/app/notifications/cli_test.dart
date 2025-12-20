import 'package:flutter/foundation.dart';
import 'package:rain/app/notifications/test_integration.dart';

/// Command line testing for Smart Notification System
class SmartNotificationCLITest {
  
  /// Run tests from command line or main function
  static Future<void> runCLITests() async {
    if (kDebugMode) {
      print('🚀 Smart Notification System - CLI Testing');
      print('=' * 50);
    }

    try {
      // Quick smoke test
      print('Running smoke test...');
      final smokeTestPassed = await SmartNotificationIntegrationTest.quickSmokeTest();
      
      if (smokeTestPassed) {
        print('✅ Smoke test PASSED');
        
        // Run full test
        print('\nRunning full integration test...');
        await SmartNotificationIntegrationTest.runFullTest();
        print('✅ Full test PASSED');
        
        print('\n🎉 All tests completed successfully!');
        print('📱 Smart Notification System is ready for use');
        
      } else {
        print('❌ Smoke test FAILED - check implementation');
      }
      
    } catch (e) {
      print('❌ CLI Test failed: $e');
    }
    
    if (kDebugMode) {
      print('=' * 50);
    }
  }
}

/// Add this to your main.dart for automatic testing during development
/// 
/// Example usage in main.dart:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await initializeApp();
///   
///   // Test smart notifications in debug mode
///   if (kDebugMode) {
///     await SmartNotificationCLITest.runCLITests();
///   }
///   
///   runApp(const MyApp());
/// }
/// ```