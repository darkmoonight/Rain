import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SnackBarOverlay {
  static final SnackBarOverlay instance = SnackBarOverlay();

  final ValueNotifier<SnackBarData?> snackBarNotifier = ValueNotifier(null);

  void show(
    String message, {
    bool isError = false,
    bool isInfo = false,
    VoidCallback? onPressed,
  }) {
    snackBarNotifier.value = SnackBarData(
      message: message,
      isError: isError,
      isInfo: isInfo,
      onPressed: onPressed,
      timestamp: DateTime.now(),
    );
  }

  void hide() {
    snackBarNotifier.value = null;
  }
}

class SnackBarData {
  final String message;
  final bool isError;
  final bool isInfo;
  final VoidCallback? onPressed;
  final DateTime timestamp;

  SnackBarData({
    required this.message,
    required this.isError,
    required this.isInfo,
    this.onPressed,
    required this.timestamp,
  });
}

class SnackBarOverlayWidget extends StatelessWidget {
  const SnackBarOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SnackBarData?>(
      valueListenable: SnackBarOverlay.instance.snackBarNotifier,
      builder: (context, data, child) {
        if (data != null) {
          return _ToastOverlay(key: ValueKey(data.timestamp), data: data);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ToastOverlay extends StatefulWidget {
  const _ToastOverlay({super.key, required this.data});

  final SnackBarData data;

  @override
  State<_ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<_ToastOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  static const _animationDuration = Duration(milliseconds: 300);
  static const _displayDuration = Duration(milliseconds: 2500);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(
      widget.data.onPressed != null ? _displayDuration * 2 : _displayDuration,
      () {
        if (mounted) {
          _controller.reverse().then((_) {
            if (mounted) {
              SnackBarOverlay.instance.hide();
            }
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Color backgroundColor;
    Color textColor;
    IconData icon;

    if (widget.data.isError) {
      backgroundColor = colorScheme.errorContainer;
      textColor = colorScheme.onErrorContainer;
      icon = IconsaxPlusBold.close_circle;
    } else if (widget.data.isInfo) {
      backgroundColor = colorScheme.secondaryContainer;
      textColor = colorScheme.onSecondaryContainer;
      icon = IconsaxPlusBold.info_circle;
    } else {
      backgroundColor = colorScheme.primaryContainer;
      textColor = colorScheme.onPrimaryContainer;
      icon = IconsaxPlusBold.tick_circle;
    }

    final children = <Widget>[
      Icon(icon, color: textColor, size: 24),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          widget.data.message,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ];

    if (widget.data.onPressed != null) {
      children.addAll([
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {
            _controller.reverse().then((_) {
              if (mounted) {
                SnackBarOverlay.instance.hide();
              }
            });
            widget.data.onPressed!();
          },
          style: TextButton.styleFrom(
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          child: Text(
            'settings'.tr,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ]);
    }

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: children),
            ),
          ),
        ),
      ),
    );
  }
}
