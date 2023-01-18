import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rain/app/data/weather.dart';
import 'package:rain/app/modules/home.dart';
import 'package:rain/app/widgets/button.dart';
import 'package:rain/main.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/weather.png',
                    scale: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'name'.tr,
                    style: context.theme.textTheme.headline1
                        ?.copyWith(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'description'.tr,
                      style: context.theme.primaryTextTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: MyTextButton(
                buttonName: 'start'.tr,
                onTap: () async {
                  settings.onboard = true;
                  isar.writeTxn(() async => isar.settings.put(settings));
                  Get.off(
                    () => const HomePage(),
                    transition: Transition.downToUp,
                  );
                },
                bgColor: context.theme.primaryColor,
                textColor: context.theme.dividerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
