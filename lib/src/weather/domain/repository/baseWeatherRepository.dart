import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';

import 'package:weather_app_clean_code/src/weather/domain/entitis/locationlatitudeLongitude.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weatherForcastFiveDay.dart';

abstract class BaseWeatherRepository {
  Future<Either<Faliure, Weather>> getNowWetherWithLanLat(
      {required double long, required double late});
  Future<Either<Faliure, WeatherForcastFiveDay>> getWeatherForcastFiveDay(
      {required double long, required double late});

  Future<locationlatitudeLongitude> getNowPositionLongLat();
  Future<bool> getPermissionData();
  Future<bool> checkLocationService();
  Future<bool> getLocationService();
}
