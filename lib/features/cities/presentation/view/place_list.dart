import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:rain/core/di/providers.dart';
import 'package:rain/i18n/tr.dart';
import 'package:rain/features/cities/presentation/widgets/place_card_list.dart';
import 'package:rain/core/widgets/text_form.dart';

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

  @override
  Widget build(BuildContext context) {
    final cities = ref.watch(citiesNotifierProvider);

    if (cities.isLoading) return _buildLoadingState(context);
    if (cities.cards.isEmpty) return _buildEmptyState(context);
    return _buildListView(context);
  }

  Widget _buildLoadingState(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text('loading'.tr),
      ],
    ),
  );

  Widget _buildEmptyState(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/icons/City.png', scale: 6),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text(
            'noWeatherCard'.tr,
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

  Widget _buildListView(BuildContext context) => Column(
    children: [
      MyTextForm(
        labelText: 'search'.tr,
        type: TextInputType.text,
        icon: const Icon(IconsaxPlusLinear.search_normal_1, size: 20),
        variant: TextFieldVariant.card,
        controller: searchTasks,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        onChanged: applyFilter,
        iconButton: searchTasks.text.isNotEmpty
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
          onRefresh: () =>
              ref.read(citiesNotifierProvider.notifier).refresh(all: true),
          child: PlaceCardList(searchCity: filter),
        ),
      ),
    ],
  );
}
