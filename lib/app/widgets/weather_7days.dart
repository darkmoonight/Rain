import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Weather7Days extends StatefulWidget {
  const Weather7Days({
    super.key,
    required this.date,
    required this.weather,
    required this.minDegree,
    required this.maxDegree,
  });
  final String date;
  final int weather;
  final double minDegree;
  final double maxDegree;

  @override
  State<Weather7Days> createState() => _Weather7DaysState();
}

class _Weather7DaysState extends State<Weather7Days> {
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

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 115,
            child: Text(
              widget.date,
              style: context.theme.textTheme.labelLarge,
            ),
          ),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  getImage(),
                  scale: 3,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    getText(),
                    style: context.theme.textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${widget.minDegree}',
                  style: context.theme.textTheme.labelLarge,
                ),
                const SizedBox(width: 5),
                Text(
                  '${widget.maxDegree}',
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
