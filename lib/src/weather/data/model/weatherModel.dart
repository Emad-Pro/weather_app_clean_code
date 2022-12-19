import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.description,
    required super.cord,
    required super.main,
    required super.wind,
    required super.sys,
    required super.timezone,
    required super.id,
    required super.cityName,
    required super.visibility,
  });
  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WeatherModel(
        description: DescriptionModel.fromJson(
          json['weather'][0],
        ),
        cord: CordModel.fromJson(
          json['coord'],
        ),
        main: MainModel.fromJson(
          json['main'],
        ),
        wind: WindModel.fromJson(
          json['wind'],
        ),
        sys: SysModel.fromJson(
          json['sys'],
        ),
        timezone: json['timezone'],
        id: json['id'],
        cityName: json['name'],
        visibility: json['visibility'].toDouble());
  }
}

class CordModel extends Cord {
  const CordModel({
    required super.lon,
    required super.lat,
  });
  factory CordModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CordModel(
      lon: json['lon'],
      lat: json['lat'],
    );
  }
}

class DescriptionModel extends Description {
  const DescriptionModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });
  factory DescriptionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DescriptionModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class MainModel extends Main {
  const MainModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
  });
  factory MainModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MainModel(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'].toDouble(),
    );
  }
}

class SysModel extends Sys {
  const SysModel({
    required super.id,
    required super.country,
  });
  factory SysModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return SysModel(
      id: json['sunrise'] ?? 0,
      country: json['country'],
    );
  }
}

class WindModel extends Wind {
  const WindModel({
    required super.speed,
    required super.deg,
  });
  factory WindModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WindModel(
      speed: json['speed'].toDouble(),
      deg: json['deg'].toDouble(),
    );
  }
}
