import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';

/// Card wrapper for a horizontal [ScrollablePositionedList] of hourly columns.
class HourlyStripCard extends StatelessWidget {
  const HourlyStripCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: AppConstants.cardBottomMargin),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.cardPaddingHorizontal,
        vertical: AppConstants.cardPaddingVertical,
      ),
      child: SizedBox(
        height: AppConstants.hourlyWidgetHeight,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) =>
              notification.metrics.axis == Axis.horizontal,
          child: child,
        ),
      ),
    ),
  );
}

/// Divider between hourly columns in [HourlyStripCard].
class HourlyStripSeparator extends StatelessWidget {
  const HourlyStripSeparator({super.key});

  @override
  Widget build(BuildContext context) => VerticalDivider(
    width: AppConstants.cardPaddingHorizontal,
    indent: AppConstants.hourlySeparatorIndent,
    endIndent: AppConstants.hourlySeparatorIndent,
  );
}

/// One selectable hourly column inside [HourlyStripCard].
class HourlyStripTile extends StatelessWidget {
  const HourlyStripTile({
    super.key,
    required this.selected,
    required this.onTap,
    required this.child,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppConstants.hourlyItemMarginVertical,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.hourlyItemPaddingHorizontal,
        vertical: AppConstants.hourlyItemPaddingVertical,
      ),
      decoration: BoxDecoration(
        color: selected
            ? Theme.of(context).colorScheme.secondaryContainer
            : Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusXLarge),
      ),
      child: child,
    ),
  );
}
