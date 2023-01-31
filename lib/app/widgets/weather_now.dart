import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeatherNow extends StatefulWidget {
  const WeatherNow({
    super.key,
    required this.weather,
    required this.degree,
  });
  final int weather;
  final double degree;

  @override
  State<WeatherNow> createState() => _WeatherNowState();
}

class _WeatherNowState extends State<WeatherNow> {
  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    String getImage() {
      switch (widget.weather) {
        case 0:
          return 'assets/images/01d.png';
        case 1:
        case 2:
        case 3:
          return 'assets/images/02d.png';
        case 45:
        case 48:
          return 'assets/images/50d.png';
        case 51:
        case 53:
        case 55:
        case 56:
        case 57:
        case 61:
        case 63:
        case 65:
        case 66:
        case 67:
        case 80:
        case 81:
        case 82:
          return 'assets/images/10d.png';
        case 71:
        case 73:
        case 75:
        case 77:
        case 85:
        case 86:
          return 'assets/images/13d.png';
        case 95:
        case 96:
        case 99:
          return 'assets/images/11d.png';
        default:
          return '';
      }
    }

    String getText() {
      switch (widget.weather) {
        case 0:
          return 'Чистое небо';
        case 1:
        case 2:
        case 3:
          return 'Облачно';
        case 45:
        case 48:
          return 'Туман';
        case 51:
        case 53:
        case 55:
        case 56:
        case 57:
        case 61:
        case 63:
        case 65:
        case 66:
        case 67:
        case 80:
        case 81:
        case 82:
          return 'Дождь';
        case 71:
        case 73:
        case 75:
        case 77:
        case 85:
        case 86:
          return 'Снег';
        case 95:
        case 96:
        case 99:
          return 'Гроза';
        default:
          return '';
      }
    }

    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage(getImage()),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: Column(
                children: [
                  GlowText(
                    '${widget.degree}',
                    style: context.theme.textTheme.displayLarge?.copyWith(
                      fontSize: 90,
                      fontWeight: FontWeight.w800,
                      height: 0.7,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    getText(),
                    style: context.theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat.MMMMEEEEd('${locale?.languageCode}').format(
                      DateTime.now(),
                    ),
                    style: context.theme.textTheme.labelLarge?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
