import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/notifications/test_integration.dart';
import 'package:rain/app/controller/controller.dart';

/// Debug page for testing Smart Notification System
class TestSmartNotificationsPage extends StatefulWidget {
  const TestSmartNotificationsPage({super.key});

  @override
  State<TestSmartNotificationsPage> createState() => _TestSmartNotificationsPageState();
}

class _TestSmartNotificationsPageState extends State<TestSmartNotificationsPage> {
  String _testResults = 'Ready to test Smart Notifications...';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Notifications Test'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Smart Notification System Test',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Test the intelligent notification system with various scenarios.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Test Buttons
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _runQuickTest,
              icon: const Icon(Icons.flash_on),
              label: const Text('Quick Smoke Test'),
            ),
            const SizedBox(height: 8),
            
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _runQuick1MinTest,
              icon: const Icon(Icons.timer),
              label: const Text('Quick 1-Minute Test'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _runFullTest,
              icon: const Icon(Icons.science),
              label: const Text('Full Integration Test'),
            ),
            const SizedBox(height: 8),
            
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _testWithRealData,
              icon: const Icon(Icons.cloud),
              label: const Text('Test with Real Weather Data'),
            ),
            const SizedBox(height: 8),
            
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _testWeatherController,
              icon: const Icon(Icons.thermostat),
              label: const Text('Test Weather Controller Integration'),
            ),
            
            const SizedBox(height: 16),
            
            // Results Display
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.terminal),
                          const SizedBox(width: 8),
                          Text(
                            'Test Results',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: _isLoading
                              ? const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(height: 16),
                                      Text('Running tests...'),
                                    ],
                                  ),
                                )
                              : Text(
                                  _testResults,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    fontSize: 12,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _runQuick1MinTest() async {
    setState(() {
      _isLoading = true;
      _testResults = 'Running 1-minute notification test...\n';
    });

    try {
      final controller = Get.find<WeatherController>();
      await controller.testSmartNotificationsQuick();
      setState(() {
        _testResults += '🚀 1-Minute test STARTED!\n';
        _testResults += '⏰ Notifications will appear within 1 minute\n';
        _testResults += '📱 Check your device notifications!\n';
        _testResults += '🔔 Smart weather insights coming soon...\n';
      });
    } catch (e) {
      setState(() {
        _testResults += '❌ 1-Minute test ERROR: $e\n';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _runQuickTest() async {
    setState(() {
      _isLoading = true;
      _testResults = 'Running quick smoke test...\n';
    });

    try {
      final success = await SmartNotificationIntegrationTest.quickSmokeTest();
      setState(() {
        _testResults += success 
            ? '✅ Quick test PASSED - System is working!\n'
            : '❌ Quick test FAILED - Check console for details\n';
      });
    } catch (e) {
      setState(() {
        _testResults += '❌ Quick test ERROR: $e\n';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _runFullTest() async {
    setState(() {
      _isLoading = true;
      _testResults = 'Running full integration test...\n';
    });

    try {
      await SmartNotificationIntegrationTest.runFullTest();
      setState(() {
        _testResults += '✅ Full integration test PASSED!\n';
        _testResults += '📊 All components working correctly\n';
      });
    } catch (e) {
      setState(() {
        _testResults += '❌ Full test ERROR: $e\n';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testWithRealData() async {
    setState(() {
      _isLoading = true;
      _testResults = 'Testing with real weather data...\n';
    });

    try {
      await SmartNotificationIntegrationTest.testWithRealWeatherDataQuick();
      setState(() {
        _testResults += '🚀 Quick real data test started!\n';
        _testResults += '⏰ Notifications will appear within 1 minute\n';
        _testResults += '📱 Check your device notifications!\n';
      });
    } catch (e) {
      setState(() {
        _testResults += '❌ Real data test ERROR: $e\n';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _testWeatherController() async {
    setState(() {
      _isLoading = true;
      _testResults = 'Testing WeatherController integration...\n';
    });

    try {
      final controller = Get.find<WeatherController>();
      await controller.testSmartNotifications();
      setState(() {
        _testResults += '✅ WeatherController test PASSED!\n';
        _testResults += '🔔 Smart notifications scheduled\n';
      });
    } catch (e) {
      setState(() {
        _testResults += '❌ WeatherController test ERROR: $e\n';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}