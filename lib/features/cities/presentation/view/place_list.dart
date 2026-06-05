import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/core/widgets/async_state_views.dart';
import 'package:rain/core/widgets/text_form.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/features/cities/presentation/widgets/place_card_list.dart';

class PlaceList extends ConsumerStatefulWidget {
  const PlaceList({super.key});

  @override
  ConsumerState<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends ConsumerState<PlaceList> {
  final searchTasks = TextEditingController();
  String filter = '';

  @override
  void dispose() {
    searchTasks.dispose();
    super.dispose();
  }

  void applyFilter(String value) =>
      setState(() => filter = value.toLowerCase());

  void clearSearch() {
    searchTasks.clear();
    applyFilter('');
  }

  Future<void> _refreshAll() =>
      ref.read(citiesNotifierProvider.notifier).refresh(all: true);

  @override
  Widget build(BuildContext context) {
    final cities = ref.watch(citiesNotifierProvider);

    if (cities.isLoading && cities.cards.isEmpty) {
      return const LoadingStateView();
    }
    if (cities.loadError && cities.cards.isEmpty) {
      return ErrorRetryStateView(
        message: 'citiesLoadError'.tr,
        onRetry: () => _refreshAll(),
      );
    }
    if (cities.cards.isEmpty) {
      return EmptyMessageStateView(message: 'noWeatherCard'.tr);
    }

    return Column(
      children: [
        if (cities.isRefreshing) const LinearProgressIndicator(minHeight: 2),
        if (cities.loadError)
          MaterialBanner(
            content: Text('citiesLoadError'.tr),
            actions: [
              TextButton(onPressed: _refreshAll, child: Text('retry'.tr)),
            ],
          ),
        MyTextForm(
          labelText: 'search'.tr,
          type: TextInputType.text,
          icon: const Icon(IconsaxPlusLinear.search_normal_1, size: 20),
          variant: TextFieldVariant.card,
          controller: searchTasks,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          onChanged: applyFilter,
          iconButton: filter.isNotEmpty
              ? IconButton(
                  onPressed: clearSearch,
                  icon: const Icon(
                    IconsaxPlusLinear.close_circle,
                    color: Colors.grey,
                    size: 20,
                  ),
                )
              : null,
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: _refreshAll,
            child: PlaceCardList(searchCity: filter),
          ),
        ),
      ],
    );
  }
}
