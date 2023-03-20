import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/widgets/card.dart';
import 'package:rain/app/widgets/create_card_weather.dart';

class CardWeather extends StatefulWidget {
  const CardWeather({super.key});

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  bool _showFab = true;
  final duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Dismissible(
              key: const ValueKey(1),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                child: const Padding(
                  padding: EdgeInsets.only(
                    right: 15,
                  ),
                  child: Icon(
                    Iconsax.trash,
                    color: Colors.red,
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor:
                          context.theme.colorScheme.primaryContainer,
                      title: Text(
                        "deletedCardWeather".tr,
                        style: context.theme.textTheme.titleLarge,
                      ),
                      content: Text("deletedCardWeatherQuery".tr,
                          style: context.theme.textTheme.titleMedium),
                      actions: [
                        TextButton(
                            onPressed: () => Get.back(result: false),
                            child: Text("cancel".tr,
                                style: context.theme.textTheme.titleMedium
                                    ?.copyWith(color: Colors.blueAccent))),
                        TextButton(
                            onPressed: () => Get.back(result: true),
                            child: Text("delete".tr,
                                style: context.theme.textTheme.titleMedium
                                    ?.copyWith(color: Colors.red))),
                      ],
                    );
                  },
                );
              },
              onDismissed: (DismissDirection direction) {},
              child: const CardDescWeather(),
            );
          },
        ),
      ),
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                enableDrag: false,
                backgroundColor: context.theme.colorScheme.secondaryContainer,
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const CreateWeatherCard();
                },
              );
            },
            backgroundColor: context.theme.colorScheme.tertiaryContainer,
            child: const Icon(Iconsax.add),
          ),
        ),
      ),
    );
  }
}
