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
      body: BlocProvider.value(
        value: getIt<WeatherBloc>()..add(GetPermissionLocationEvent()),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
                condition: state.getPermission != null && state.getPermission!.permition == true,
                builder: (context) => getWeatherPermission(),
                fallback: (context) {
                  return Column(
                    children: [
                      SafeArea(
                          child: Center(
                              child: Column(
                        children: const [
                          Icon(Icons.gps_off),
                          Text("You need location permissions to get weather information"),
                        ],
                      ))),
                      ElevatedButton(
                          onPressed: () {
                            getIt<WeatherBloc>().add(GetPermissionLocationEvent());
                          },
                          child: const Text("GetPermission"))
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
