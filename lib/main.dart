import 'package:flutter/material.dart';

import 'package:weather_app_clean_code/src/weather/presentation/screen/weatherScreen.dart';

import 'src/utils/services/service_locator.dart';

void main() async {
  ServiceLocator().init();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}
