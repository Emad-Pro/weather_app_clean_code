import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';
import 'package:weather_app_clean_code/src/weather/data/dataSource/locale/weatherLocaleDataSource.dart';
import 'package:weather_app_clean_code/src/weather/data/dataSource/remote/WeatherRemoteDataSource.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/permition.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/positionLatLong.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseWeatherRemoteDataSource baseWeatherRemoteDataSource;
  final BaseLocaleDataSource baseLocaleDataSource;
  WeatherRepository(this.baseWeatherRemoteDataSource, this.baseLocaleDataSource);
  @override
  Future<Either<Faliure, Weather>> getNowWetherWithLanLat(
      {required double long, required double late}) async {
    final result = await baseWeatherRemoteDataSource.getNowWetherWithLanLat(late: late, long: long);
    try {
      return Right(result);
    } on ServerException catch (falire) {
      return Left(ServerFaliure(falire.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<PositionLateLong> getNowPositionLongLat() async {
    return baseLocaleDataSource.getCurrentPosition();
  }

  @override
  Future<GetPermission> getPermissionData() async {
    return await baseLocaleDataSource.getLocationPermission();
  }
}
