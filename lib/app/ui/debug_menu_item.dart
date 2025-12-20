import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/ui/test_smart_notifications_page.dart';

/// Debug menu item for Smart Notifications testing
class DebugMenuItem extends StatelessWidget {
  const DebugMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications_active),
      title: const Text('Test Smart Notifications'),
      subtitle: const Text('Test the intelligent notification system'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Get.to(() => const TestSmartNotificationsPage());
      },
    );
  }
}

/// Simple floating action button for quick access
class SmartNotificationTestFAB extends StatelessWidget {
  const SmartNotificationTestFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Get.to(() => const TestSmartNotificationsPage());
      },
      icon: const Icon(Icons.science),
      label: const Text('Test Smart Notifications'),
      backgroundColor: Colors.orange,
    );
  }
}