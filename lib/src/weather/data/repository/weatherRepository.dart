import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';
import 'package:weather_app_clean_code/src/weather/data/dataSource/locale/weatherLocaleDataSource.dart';
import 'package:weather_app_clean_code/src/weather/data/dataSource/remote/WeatherRemoteDataSource.dart';
import 'package:weather_app_clean_code/src/weather/data/model/weatherForcastFiveDayModel.dart';

import 'package:weather_app_clean_code/src/weather/domain/entitis/locationlatitudeLongitude.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weatherForcastFiveDay.dart';
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
  Future<Either<Faliure, WeatherForcastFiveDayModel>> getWeatherForcastFiveDay(
      {required double long, required double late}) async {
    final result =
        await baseWeatherRemoteDataSource.getNowWetherForCastFiveday(late: late, long: long);
    try {
      return Right(result);
    } on ServerException catch (falire) {
      return Left(ServerFaliure(falire.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<locationlatitudeLongitude> getNowPositionLongLat() async {
    return await baseLocaleDataSource.getCurrentPosition();
  }

  @override
  Future<bool> getPermissionData() async {
    return await baseLocaleDataSource.getLocationPermission();
  }

  @override
  Future<bool> checkLocationService() async {
    return await baseLocaleDataSource.checkLoctionService();
  }

  @override
  Future<bool> getLocationService() async {
    return await baseLocaleDataSource.getLoctionService();
  }
}
