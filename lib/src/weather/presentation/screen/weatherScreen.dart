import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:weather_app_clean_code/src/utils/services/service_locator.dart';
import 'package:weather_app_clean_code/src/weather/presentation/controller/bloc/weather_bloc.dart';

import '../widget/weatherWidget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: state.checkLocationService == true,
              builder: (context) => getWeatherData(),
              fallback: (context) {
                return Column(
                  children: [
                    SafeArea(
                        child: Center(
                            child: Column(
                      children: const [
                        Icon(Icons.gps_off),
                        Text("تحتاج الي تشغيل خدمات الموقع للحصول"),
                      ],
                    ))),
                    ElevatedButton(
                        onPressed: () {
                          getIt<WeatherBloc>().add(GetLocationServiceEvent());
                        },
                        child: const Text("GetPermission"))
                  ],
                );
              });
        },
      ),
    );
  }
}
