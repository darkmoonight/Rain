import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/main.dart';

class Now extends StatefulWidget {
  const Now({
    super.key,
    required this.weather,
    required this.degree,
    required this.time,
    required this.timeDay,
    required this.timeNight,
    required this.tempMax,
    required this.tempMin,
    required this.feels,
  });

  final String time;
  final String timeDay;
  final String timeNight;
  final int weather;
  final double degree;
  final double tempMax;
  final double tempMin;
  final double feels;

  @override
  State<Now> createState() => _NowState();
}

class _NowState extends State<Now> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();

  @override
  Widget build(BuildContext context) {
    return largeElement
        ? _buildLargeElementLayout(context)
        : _buildCompactElementLayout(context);
  }

  Widget _buildLargeElementLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(15),
          _buildWeatherImage(200),
          _buildTemperatureText(context, widget.degree, 90),
          Text(
            statusWeather.getText(widget.weather),
            style: context.textTheme.titleLarge,
          ),
          const Gap(5),
          _buildDateText(context),
        ],
      ),
    );
  }

  Widget _buildCompactElementLayout(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          bottom: 18,
          left: 25,
          right: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDateText(context),
                  const Gap(5),
                  Text(
                    statusWeather.getText(widget.weather),
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
                  ),
                  _buildFeelsLikeText(context),
                  const Gap(30),
                  _buildTemperatureCompactText(context, widget.degree),
                  const Gap(5),
                  _buildMinMaxTemperatureText(context),
                ],
              ),
            ),
            _buildWeatherImage(140),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherImage(double height) {
    return Image(
      image: AssetImage(
        statusWeather.getImageNow(
          widget.weather,
          widget.time,
          widget.timeDay,
          widget.timeNight,
        ),
      ),
      fit: BoxFit.fill,
      height: height,
    );
  }

  Widget _buildTemperatureText(
    BuildContext context,
    double degree,
    double? fontSize,
  ) {
    return Text(
      '${roundDegree ? degree.round() : degree}',
      style: context.textTheme.displayLarge?.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        shadows: const [Shadow(blurRadius: 15, offset: Offset(5, 5))],
      ),
    );
  }

  Widget _buildTemperatureCompactText(BuildContext context, double degree) {
    return Text(
      statusData.getDegree(roundDegree ? widget.degree.round() : widget.degree),
      style: context.textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildDateText(BuildContext context) {
    return Text(
      DateFormat.MMMMEEEEd(
        locale.languageCode,
      ).format(DateTime.parse(widget.time)),
      style: context.textTheme.labelLarge?.copyWith(color: Colors.grey),
    );
  }

  Widget _buildFeelsLikeText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('feels'.tr, style: context.textTheme.bodyMedium),
        Text(' • ', style: context.textTheme.bodyMedium),
        Text(
          statusData.getDegree(widget.feels.round()),
          style: context.textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildMinMaxTemperatureText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          statusData.getDegree((widget.tempMax.round())),
          style: context.textTheme.labelLarge,
        ),
        Text(' / ', style: context.textTheme.labelLarge),
        Text(
          statusData.getDegree((widget.tempMin.round())),
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}
