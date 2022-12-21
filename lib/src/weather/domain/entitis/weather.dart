import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final Cord cord;
  final Description description;
  final Main main;
  final Wind wind;
  final Sys sys;
  final int timezone;
  final int id;
  final String cityName;
  final double visibility;

  const Weather(
      {required this.description,
      required this.cord,
      required this.main,
      required this.wind,
      required this.sys,
      required this.timezone,
      required this.id,
      required this.cityName,
      required this.visibility});
  @override
  List<Object?> get props =>
      [cord, main, wind, sys, timezone, id, cityName, description, visibility];
}

class Cord extends Equatable {
  final double lon;
  final double lat;

  const Cord({required this.lon, required this.lat});
  @override
  List<Object?> get props => [lon, lat];
}

class Description extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  const Description(
      {required this.id, required this.main, required this.description, required this.icon});

  @override
  List<Object?> get props => [id, main, description, icon];
}

class Main extends Equatable {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double pressure;
  final double humidity;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
      ];
}

class Sys extends Equatable {
  final int id;
  final String country;

  const Sys({required this.id, required this.country});
  @override
  List<Object?> get props => [id, country];
}

class Wind extends Equatable {
  final double speed;
  final double deg;

  const Wind({required this.speed, required this.deg});
  @override
  List<Object?> get props => [
        speed,
        deg,
      ];
}
