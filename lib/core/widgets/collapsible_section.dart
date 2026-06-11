import 'package:flutter/material.dart';
import 'package:rain/core/constants/app_constants.dart';

/// Expandable card section with a shared chevron, color, and size animation.
class CollapsibleSection extends StatefulWidget {
  const CollapsibleSection({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
    this.headerPadding = cardHeaderPadding,
  });

  final Widget title;
  final Widget child;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry headerPadding;

  /// Header padding when this section is the direct child of a [Card].
  static const cardHeaderPadding = EdgeInsets.fromLTRB(
    AppConstants.spacingL,
    AppConstants.spacingM,
    AppConstants.spacingL,
    AppConstants.spacingM,
  );

  /// Body padding for grid/list content below the header inside a [Card].
  static const cardBodyPadding = EdgeInsets.fromLTRB(
    AppConstants.spacingL,
    AppConstants.spacingXL,
    AppConstants.spacingL,
    AppConstants.spacingS,
  );

  /// Vertical-only padding when the parent [Card] already applies horizontal inset.
  static const nestedHeaderPadding = EdgeInsets.symmetric(
    vertical: AppConstants.spacingM,
  );

  @override
  State<CollapsibleSection> createState() => _CollapsibleSectionState();
}

/// Drives expand/collapse via [AnimationController] and [SizeTransition].
class _CollapsibleSectionState extends State<CollapsibleSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeFactor;
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
    _controller = AnimationController(
      duration: AppConstants.longAnimation,
      vsync: this,
    );
    _sizeFactor = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    if (_expanded) {
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CollapsibleSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initiallyExpanded != widget.initiallyExpanded) {
      _expanded = widget.initiallyExpanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chevronColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: _toggle,
          child: Padding(
            padding: widget.headerPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: widget.title),
                _ExpandChevron(expanded: _expanded, color: chevronColor),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _sizeFactor,
          alignment: AlignmentDirectional.topStart,
          child: widget.child,
        ),
      ],
    );
  }
}

/// Fixed-size chevron that rotates when the section expands.
class _ExpandChevron extends StatelessWidget {
  const _ExpandChevron({required this.expanded, required this.color});

  final bool expanded;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.iconSizeLarge,
      height: AppConstants.iconSizeLarge,
      child: Center(
        child: AnimatedRotation(
          turns: expanded ? 0.5 : 0,
          duration: AppConstants.longAnimation,
          curve: Curves.easeInOut,
          child: Icon(
            Icons.expand_more,
            size: AppConstants.iconSizeLarge,
            color: color,
          ),
        ),
      ),
    );
  }
}
