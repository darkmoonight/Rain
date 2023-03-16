import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rain/app/widgets/card.dart';

class CardWeather extends StatefulWidget {
  const CardWeather({super.key});

  @override
  State<CardWeather> createState() => _CardWeatherState();
}

class _CardWeatherState extends State<CardWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                    backgroundColor: context.theme.colorScheme.primaryContainer,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
