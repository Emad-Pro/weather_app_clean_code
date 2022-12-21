import 'package:equatable/equatable.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

class WeatherForcastFiveDay extends Equatable {
  final List<WeatherList> weatherForCast;

  const WeatherForcastFiveDay({required this.weatherForCast});
  @override
  List<Object?> get props => [weatherForCast];
}

class WeatherList extends Equatable {
  final Main main;
  final Description weather;

  final Wind wind;
  final int visibility;

  final Sys sys;
  final String dtTxt;

  const WeatherList(
      {required this.main,
      required this.weather,
      required this.wind,
      required this.visibility,
      required this.sys,
      required this.dtTxt});
  @override
  List<Object?> get props => [];
}
