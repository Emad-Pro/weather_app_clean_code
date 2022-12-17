import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';
import 'package:weather_app_clean_code/src/weather/data/dataSource/remote/WeatherRemoteDataSource.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseWeatherRemoteDataSource baseWeatherRemoteDataSource;

  WeatherRepository(this.baseWeatherRemoteDataSource);
  @override
  Future<Either<Faliure, Weather>> getNowWetherWithLanLat() async {
    final result = await baseWeatherRemoteDataSource.getNowWetherWithLanLat();
    try {
      return Right(result);
    } on ServerException catch (falire) {
      return Left(ServerFaliure(falire.erorrMessageModel.statusMessage));
    }
  }
}
