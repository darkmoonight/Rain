import 'package:flutter/material.dart';
import 'package:rain/core/utils/snackbar_overlay.dart';

/// Shows a global toast via [SnackBarOverlay].
void showSnackBar(
  String message, {
  bool isError = false,
  bool isInfo = false,
  VoidCallback? onPressed,
}) {
  SnackBarOverlay.instance.show(
    message,
    isError: isError,
    isInfo: isInfo,
    onPressed: onPressed,
  );
}
