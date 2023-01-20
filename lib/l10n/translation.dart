import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ru_RU': {
          'start': 'Начать',
          'description':
              'Приложение погоды, которое предоставляет прогнозы в режиме реального времени, а также ежечасные, ежедневные и еженедельные прогнозы для любого местоположения.',
          'name': 'Погода',
          '': '',
        },
        'en_US': {
          'start': 'Get Started',
          'description':
              'Weather app that provides real-time forecasts, and hourly, daily and weekly forecasts for any location.',
          'name': 'Weather',
          '': '',
        },
      };
}
