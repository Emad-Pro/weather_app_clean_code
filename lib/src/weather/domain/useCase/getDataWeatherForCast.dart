import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weatherForcastFiveDay.dart';
import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class GetDataWeatherForCastFiveDayUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  GetDataWeatherForCastFiveDayUseCase(this.baseWeatherRepository);
  Future<Either<Faliure, WeatherForcastFiveDay>> getData(
      {required double long, required double late}) async {
    return await baseWeatherRepository.getWeatherForcastFiveDay(late: late, long: long);
  }
}
