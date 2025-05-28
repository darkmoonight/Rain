import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:rain/main.dart';

class DailyCard extends StatefulWidget {
  const DailyCard({
    super.key,
    required this.timeDaily,
    required this.weathercodeDaily,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  final DateTime timeDaily;
  final int? weathercodeDaily;
  final double? temperature2MMax;
  final double? temperature2MMin;

  @override
  State<DailyCard> createState() => _DailyCardState();
}

class _DailyCardState extends State<DailyCard> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    if (widget.weathercodeDaily == null) {
      return Container();
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            _buildTemperatureInfo(context),
            const Gap(5),
            _buildWeatherImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildTemperatureInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${statusData.getDegree(widget.temperature2MMin?.round())} / ${statusData.getDegree(widget.temperature2MMax?.round())}',
            style: context.textTheme.titleLarge?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(5),
          _buildDateText(context),
          const Gap(5),
          _buildWeatherDescription(context),
        ],
      ),
    );
  }

  Widget _buildDateText(BuildContext context) {
    return Text(
      DateFormat.MMMMEEEEd(locale.languageCode).format(widget.timeDaily),
      style: context.textTheme.titleMedium?.copyWith(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildWeatherDescription(BuildContext context) {
    return Text(
      statusWeather.getText(widget.weathercodeDaily),
      style: context.textTheme.titleMedium?.copyWith(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildWeatherImage() {
    return Image.asset(
      statusWeather.getImageNowDaily(widget.weathercodeDaily),
      scale: 6.5,
    );
  }
}
