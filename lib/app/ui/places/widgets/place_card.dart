import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rain/app/controller/controller.dart';
import 'package:rain/app/ui/widgets/weather/status/status_weather.dart';
import 'package:rain/app/ui/widgets/weather/status/status_data.dart';
import 'package:timezone/standalone.dart' as tz;

class PlaceCard extends StatefulWidget {
  const PlaceCard({
    super.key,
    required this.time,
    required this.weather,
    required this.degree,
    required this.district,
    required this.city,
    required this.timezone,
    required this.timeDay,
    required this.timeNight,
    required this.timeDaily,
  });

  final List<String> time;
  final List<String> timeDay;
  final List<String> timeNight;
  final List<DateTime> timeDaily;
  final String district;
  final String city;
  final List<int> weather;
  final List<double> degree;
  final String timezone;

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  final statusWeather = StatusWeather();
  final statusData = StatusData();
  final weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    final currentTimeIndex = weatherController.getTime(
      widget.time,
      widget.timezone,
    );
    final currentDayIndex = weatherController.getDay(
      widget.timeDaily,
      widget.timezone,
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            _buildWeatherInfo(context, currentTimeIndex, currentDayIndex),
            const Gap(5),
            _buildWeatherImage(currentTimeIndex, currentDayIndex),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(
    BuildContext context,
    int currentTimeIndex,
    int currentDayIndex,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                statusData.getDegree(
                  widget.degree[currentTimeIndex].round().toInt(),
                ),
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(7),
              Text(
                statusWeather.getText(widget.weather[currentTimeIndex]),
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Gap(10),
          _buildLocationText(),
          const Gap(5),
          _buildCurrentTimeText(context),
        ],
      ),
    );
  }

  Widget _buildLocationText() {
    String locationText;

    if (widget.district.isEmpty) {
      locationText = widget.city;
    } else if (widget.city.isEmpty) {
      locationText = widget.district;
    } else if (widget.city == widget.district) {
      locationText = widget.city;
    } else {
      locationText = '${widget.city}, ${widget.district}';
    }

    return Text(
      locationText,
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildCurrentTimeText(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Text(
          '${'time'.tr}: ${statusData.getTimeFormatTz(tz.TZDateTime.now(tz.getLocation(widget.timezone)))}',
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        );
      },
    );
  }

  Widget _buildWeatherImage(int currentTimeIndex, int currentDayIndex) {
    return Image.asset(
      statusWeather.getImageNow(
        widget.weather[currentTimeIndex],
        widget.time[currentTimeIndex],
        widget.timeDay[currentDayIndex],
        widget.timeNight[currentDayIndex],
      ),
      scale: 6.5,
    );
  }
}
