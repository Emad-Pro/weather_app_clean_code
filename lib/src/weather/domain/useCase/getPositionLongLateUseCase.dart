import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/positionLatLong.dart';
import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class GetPositionLongLateUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  GetPositionLongLateUseCase(this.baseWeatherRepository);
  Future<PositionLateLong> getData() async {
    return await baseWeatherRepository.getNowPositionLongLat();
  }
}
