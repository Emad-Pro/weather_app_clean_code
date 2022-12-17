import 'package:equatable/equatable.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/cord.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/main.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/sys.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/wind.dart';

class Weather extends Equatable {
  final Cord cord;
  final Main main;
  final Wind wind;
  final Sys sys;
  final int timezone;
  final int id;
  final int cityName;

  const Weather(
      {required this.cord,
      required this.main,
      required this.wind,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.cityName});
  @override
  // TODO: implement props
  List<Object?> get props => [cord, main, wind, sys, timezone, id, cityName];
}
