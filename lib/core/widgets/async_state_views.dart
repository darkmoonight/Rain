import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/i18n/tr.dart';

/// Centered loading indicator with localized status text.
class LoadingStateView extends StatelessWidget {
  const LoadingStateView({super.key});

  /// Builds the centered loading spinner and status text.
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text('loading'.tr),
      ],
    ),
  );
}

/// Error state with message and a retry action.
class ErrorRetryStateView extends StatelessWidget {
  const ErrorRetryStateView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  /// Builds the error message and retry button.
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(IconsaxPlusLinear.warning_2, size: 48, color: Colors.grey),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: onRetry,
          icon: const Icon(IconsaxPlusLinear.refresh),
          label: Text('retry'.tr),
        ),
      ],
    ),
  );
}

/// Empty state with optional illustration and message.
class EmptyMessageStateView extends StatelessWidget {
  const EmptyMessageStateView({
    super.key,
    required this.message,
    this.imageAsset = 'assets/icons/City.png',
  });

  final String message;
  final String imageAsset;

  /// Builds the empty-state illustration and message.
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageAsset, scale: 6),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
}
