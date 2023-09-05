import 'package:flutter/material.dart';
import 'package:get/get.dart';

final globalKey = GlobalKey<ScaffoldMessengerState>();

void showSnackBar({required String content, Function? onPressed}) {
  globalKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(content),
      action: onPressed != null
          ? SnackBarAction(
              label: 'settings'.tr,
              onPressed: () {
                onPressed();
              },
            )
          : null,
    ),
  );
}
