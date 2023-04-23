import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rain/app/widgets/status.dart';
import 'package:rain/app/widgets/status_im_fa.dart';

class WeatherDaily extends StatefulWidget {
  const WeatherDaily({
    super.key,
    required this.date,
    required this.weather,
    required this.minDegree,
    required this.maxDegree,
  });
  final List<DateTime> date;
  final List<int> weather;
  final List<double> minDegree;
  final List<double> maxDegree;

  @override
  State<WeatherDaily> createState() => _WeatherDailyState();
}

class _WeatherDailyState extends State<WeatherDaily> {
  final locale = Get.locale;
  final status = Status();
  final statusImFa = StatusImFa();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (ctx, i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            DateFormat.EEEE(locale?.languageCode)
                                .format(widget.date[i]),
                            style: context.theme.textTheme.labelLarge,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                status.getImage7Day(widget.weather[i]),
                                scale: 3,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  status.getText(widget.weather[i]),
                                  style: context.theme.textTheme.labelLarge,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                statusImFa.getDegree(
                                    widget.minDegree[i].round().toInt()),
                                style: context.theme.textTheme.labelLarge,
                              ),
                              Text(
                                ' / ',
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                statusImFa.getDegree(
                                    widget.maxDegree[i].round().toInt()),
                                style: context.theme.textTheme.bodyMedium
                                    ?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          const Divider(),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'weatherMore'.tr,
                style: context.theme.textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
