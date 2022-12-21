part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetDataWeatherWithLanLatEvent extends WeatherEvent {
  final double long;
  final double late;

  const GetDataWeatherWithLanLatEvent({required this.late, required this.long});
}

class GetPermissionLocationEvent extends WeatherEvent {}

class GetPositionLongLatEvent extends WeatherEvent {}

class CheckLocationServiceEvent extends WeatherEvent {}

class GetLocationServiceEvent extends WeatherEvent {}

class GetWeatherForCastEvent extends WeatherEvent {
  final double long;
  final double late;

  const GetWeatherForCastEvent({required this.long, required this.late});
}
