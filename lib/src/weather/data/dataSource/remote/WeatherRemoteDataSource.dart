import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';
import 'package:weather_app_clean_code/src/utils/erorr/erorrModel/erorrMessageModel.dart';
import 'package:weather_app_clean_code/src/utils/network/api_Constance.dart';

import 'package:weather_app_clean_code/src/weather/data/model/weatherModel.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

import '../../../../utils/erorr/erorrModel/erorrMessagePermisionModel.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<Weather> getNowWetherWithLanLat({required double late, required double long});
}

class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource {
  @override
  Future<Weather> getNowWetherWithLanLat({required double late, required double long}) async {
    final response = await Dio().get(ApiConstance.url(late: late, long: long));
    if (response.statusCode == 200) {
      print(response.data);
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }
}
