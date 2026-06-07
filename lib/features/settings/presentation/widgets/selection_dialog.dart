import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/constants/app_constants.dart';
import 'package:rain/core/utils/navigation_helper.dart';
import 'package:rain/core/utils/responsive_utils.dart';

/// Shows a modal list for picking one value from [items].
Future<T?> showSelectionDialog<T>({
  required BuildContext context,
  required String title,
  required IconData icon,
  required List<T> items,
  required T currentValue,
  required String Function(T) itemBuilder,
  required void Function(T) onSelected,
  bool enableSearch = false,
}) async {
  return NavigationHelper.showAppDialog<T>(
    context: context,
    child: SelectionDialog<T>(
      title: title,
      icon: icon,
      items: items,
      currentValue: currentValue,
      itemBuilder: itemBuilder,
      onSelected: onSelected,
      enableSearch: enableSearch,
    ),
  );
}

/// Searchable or plain list dialog for a single-choice setting.
class SelectionDialog<T> extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<T> items;
  final T currentValue;
  final String Function(T) itemBuilder;
  final void Function(T) onSelected;
  final bool enableSearch;

  const SelectionDialog({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
    required this.currentValue,
    required this.itemBuilder,
    required this.onSelected,
    required this.enableSearch,
  });

  /// Creates the state for [SelectionDialog].
  @override
  State<SelectionDialog<T>> createState() => _SelectionDialogState<T>();
}

// --- SelectionDialogState ---

/// State for [SelectionDialog] managing search filtering and list display.
class _SelectionDialogState<T> extends State<SelectionDialog<T>> {
  late List<T> _filteredItems;
  final _searchController = TextEditingController();

  /// Initializes the item list and a search-controller listener that triggers rebuilds.
  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _searchController.addListener(() => setState(() {}));
  }

  /// Disposes the search text controller.
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Filters displayed items by the search query.
  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items.where((item) {
          final itemText = widget.itemBuilder(item).toLowerCase();
          return itemText.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  /// Builds the selection dialog with optional search and item list.
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isMobile = ResponsiveUtils.isMobile(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : AppConstants.maxDialogWidth,
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusXXLarge,
            ),
            side: BorderSide(
              color: colorScheme.outlineVariant.withValues(alpha: 0.3),
              width: AppConstants.borderWidthThin,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context, colorScheme),
              if (widget.enableSearch) _buildSearchField(context, colorScheme),
              Flexible(
                child: _filteredItems.isEmpty
                    ? _buildEmptyState(context, colorScheme)
                    : _buildItemsList(context, colorScheme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the dialog header with icon and title.
  Widget _buildHeader(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.spacingXXL),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppConstants.spacingM),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(
                AppConstants.borderRadiusMedium,
              ),
            ),
            child: Icon(
              widget.icon,
              size: AppConstants.iconSizeLarge,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: AppConstants.spacingL),
          Expanded(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
                fontSize: ResponsiveUtils.getResponsiveFontSize(context, 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the optional search text field.
  Widget _buildSearchField(BuildContext context, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.spacingXXL,
        0,
        AppConstants.spacingXXL,
        AppConstants.spacingL,
      ),
      child: TextField(
        controller: _searchController,
        onChanged: _filterItems,
        decoration: InputDecoration(
          hintText: 'search'.tr,
          hintStyle: TextStyle(
            color: colorScheme.onSurfaceVariant,
            fontSize: ResponsiveUtils.getResponsiveFontSize(context, 13),
          ),
          prefixIcon: Icon(
            IconsaxPlusLinear.search_normal_1,
            color: colorScheme.onSurfaceVariant,
            size: 18,
          ),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    IconsaxPlusLinear.close_circle,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    _searchController.clear();
                    _filterItems('');
                  },
                )
              : null,
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// Builds the empty state when no items match the search.
  Widget _buildEmptyState(BuildContext context, ColorScheme colorScheme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingXXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              IconsaxPlusLinear.search_status,
              size: 64,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppConstants.spacingL),
            Text(
              'noResults'.tr,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the scrollable list of selectable items.
  Widget _buildItemsList(BuildContext context, ColorScheme colorScheme) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _filteredItems.length,
      padding: const EdgeInsets.only(bottom: AppConstants.spacingL),
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        final isSelected = item == widget.currentValue;

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingXXL,
            vertical: AppConstants.spacingXS,
          ),
          title: Text(
            widget.itemBuilder(item),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? colorScheme.primary : colorScheme.onSurface,
              fontSize: ResponsiveUtils.getResponsiveFontSize(context, 15),
            ),
          ),
          trailing: isSelected
              ? Icon(
                  IconsaxPlusBold.tick_circle,
                  color: colorScheme.primary,
                  size: AppConstants.iconSizeMedium,
                )
              : null,
          onTap: () {
            widget.onSelected(item);
            NavigationHelper.back(context, result: item);
          },
        );
      },
    );
  }
}
