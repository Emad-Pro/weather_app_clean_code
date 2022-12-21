import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_clean_code/src/weather/presentation/controller/bloc/weather_bloc.dart';

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
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<WeatherBloc>()..add(CheckLocationServiceEvent()),
          ),
        ],
        child: const WeatherScreen(),
      ),
    );
  }
}
