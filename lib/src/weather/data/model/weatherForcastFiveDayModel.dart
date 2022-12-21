import 'package:weather_app_clean_code/src/weather/data/model/weatherModel.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

import '../../domain/entitis/weatherForcastFiveDay.dart';

class WeatherForcastFiveDayModel extends WeatherForcastFiveDay {
  const WeatherForcastFiveDayModel({required super.weatherForCast});
  factory WeatherForcastFiveDayModel.fromJson(Map<String, dynamic> json) {
    List<WeatherList> weatherListitem = <WeatherList>[];
    json['list'].forEach((v) {
      weatherListitem.add(WeatherListModel.fromJson(v));
    });
    return WeatherForcastFiveDayModel(weatherForCast: weatherListitem);
  }
}

class WeatherListModel extends WeatherList {
  const WeatherListModel(
      {required super.main,
      required super.weather,
      required super.wind,
      required super.visibility,
      required super.sys,
      required super.dtTxt});
  factory WeatherListModel.fromJson(Map<String, dynamic> json) {
    return WeatherListModel(
        main: MainModel.fromJson(json['main']),
        weather: DescriptionModel.fromJson(json['weather'][0]),
        wind: WindModel.fromJson(json['wind']),
        visibility: json['visibility'],
        sys: SysModel.fromJson(json['sys']),
        dtTxt: json['dt_txt']);
  }
}
