import 'package:flutter/material.dart';
import 'package:rain/i18n/tr.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rain/core/di/provider_refs.dart';
import 'package:rain/core/weather/status_data.dart';

/// Card showing sunrise and sunset times for the selected day.
class SunsetSunrise extends ConsumerWidget {
  const SunsetSunrise({
    super.key,
    required this.timeSunrise,
    required this.timeSunset,
  });

  final String timeSunrise;
  final String timeSunset;

  /// Builds the sunrise and sunset times card for the selected day.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusData = StatusData(settings: ref.watch(settingsProvider));
    final textTheme = Theme.of(context).textTheme;
    final titleSmall = textTheme.titleSmall;
    final titleLarge = textTheme.titleLarge;

    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            _buildSunTimeColumn(
              context,
              'sunrise'.tr,
              statusData.getTimeFormat(timeSunrise),
              'assets/images/sunrise.png',
              titleSmall,
              titleLarge,
            ),
            _buildSunTimeColumn(
              context,
              'sunset'.tr,
              statusData.getTimeFormat(timeSunset),
              'assets/images/sunset.png',
              titleSmall,
              titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds one labeled sun-time column with [imagePath] and formatted [time].
  Widget _buildSunTimeColumn(
    BuildContext context,
    String label,
    String time,
    String imagePath,
    TextStyle? labelStyle,
    TextStyle? timeStyle,
  ) => Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(label, style: labelStyle, overflow: TextOverflow.ellipsis),
              Text(time, style: timeStyle),
            ],
          ),
        ),
        Flexible(child: Image.asset(imagePath, scale: 10)),
      ],
    ),
  );
}
