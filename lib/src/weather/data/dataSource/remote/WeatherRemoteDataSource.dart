import 'package:dio/dio.dart';

import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';
import 'package:weather_app_clean_code/src/utils/erorr/erorrModel/erorrMessageModel.dart';
import 'package:weather_app_clean_code/src/utils/network/api_Constance.dart';
import 'package:weather_app_clean_code/src/weather/data/model/weatherForcastFiveDayModel.dart';

import 'package:weather_app_clean_code/src/weather/data/model/weatherModel.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<Weather> getNowWetherWithLanLat({required double late, required double long});
  Future<WeatherForcastFiveDayModel> getNowWetherForCastFiveday(
      {required double late, required double long});
}

class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource {
  @override
  Future<Weather> getNowWetherWithLanLat({required double late, required double long}) async {
    final response = await Dio().get(ApiConstance.urlWeather(late: late, long: long));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<WeatherForcastFiveDayModel> getNowWetherForCastFiveday(
      {required double late, required double long}) async {
    final response = await Dio().get(ApiConstance.urlWeatherForCastFiveDay(late: long, long: late));
    if (response.statusCode == 200) {
      return WeatherForcastFiveDayModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }
}
