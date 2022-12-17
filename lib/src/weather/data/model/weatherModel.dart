import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel(
      {required super.cord,
      required super.main,
      required super.wind,
      required super.sys,
      required super.timezone,
      required super.id,
      required super.cityName});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cord: json['code'],
        main: json['main'],
        wind: json['main'],
        sys: json['sys'],
        timezone: json['time'],
        id: json['id'],
        cityName: json['name']);
  }
}
