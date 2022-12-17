import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';
import 'package:weather_app_clean_code/src/utils/network/api_Constance.dart';
import 'package:weather_app_clean_code/src/utils/network/erorrMessageModel.dart';
import 'package:weather_app_clean_code/src/weather/data/model/weatherModel.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<Weather> getNowWetherWithLanLat();
}

class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource {
  @override
  Future<Weather> getNowWetherWithLanLat() async {
    final response = await Dio().get(ApiConstance.url);
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }
}
