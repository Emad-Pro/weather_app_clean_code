import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Faliure, Weather>> getNowWetherWithLanLat();
}
