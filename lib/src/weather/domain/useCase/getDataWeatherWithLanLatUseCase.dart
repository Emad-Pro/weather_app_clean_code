import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class GetDataWeatherWithLanLatUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  GetDataWeatherWithLanLatUseCase(this.baseWeatherRepository);
  Future<Either<Faliure, Weather>> getData({required double long, required double late}) async {
    return await baseWeatherRepository.getNowWetherWithLanLat(late: late, long: long);
  }
}
