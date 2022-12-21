import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app_clean_code/src/weather/domain/entitis/locationlatitudeLongitude.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/checkLocationServerUseCase.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getDataWeatherForCast.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getDataWeatherWithLanLatUseCase.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getLocationServerUseCase.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getPermissionLocation.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getPositionLongLateUseCase.dart';

import '../../../../utils/enum.dart';
import '../../../domain/entitis/weatherForcastFiveDay.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetDataWeatherWithLanLatUseCase getDataWeatherWithLanLatUseCase;
  final GetPositionLongLateUseCase getPositionLongLateUseCase;
  final GetPermissionLocationUseCase getPermissionLocationUseCase;
  final GetDataWeatherForCastFiveDayUseCase getDataWeatherForCastFiveDayUseCase;
  final GetLocationServerUseCase getLocationServerUseCase;
  final CheckLocationServerUseCase checkLocationServerUseCase;
  WeatherBloc(
      {required this.getDataWeatherWithLanLatUseCase,
      required this.getPositionLongLateUseCase,
      required this.getPermissionLocationUseCase,
      required this.getDataWeatherForCastFiveDayUseCase,
      required this.getLocationServerUseCase,
      required this.checkLocationServerUseCase})
      : super(const WeatherState()) {
    on<GetDataWeatherWithLanLatEvent>(_getDataWeatherWithLanLat);
    on<GetPositionLongLatEvent>(_getPositionLongLat);
    on<GetPermissionLocationEvent>(_getPermissionLocation);
    on<GetWeatherForCastEvent>(_getWeatherForCast);
    on<CheckLocationServiceEvent>(_checkLocationService);
    on<GetLocationServiceEvent>(_getLocationService);
  }

  FutureOr<void> _getDataWeatherWithLanLat(
      GetDataWeatherWithLanLatEvent event, Emitter<WeatherState> emit) async {
    final resualt =
        await getDataWeatherWithLanLatUseCase.getData(late: event.late, long: event.long);
    return await resualt.fold(
        (l) => emit(state.copyWith(message: l.message, weatherDataState: RequestState.erorr)),
        (r) => emit(state.copyWith(weatherData: r, weatherDataState: RequestState.loaded)));
  }

  FutureOr<void> _getPositionLongLat(
      GetPositionLongLatEvent event, Emitter<WeatherState> emit) async {
    final result = await getPositionLongLateUseCase.getData();
    return emit(
        state.copyWith(positionLateLong: result, positionLateLongState: RequestState.loaded));
  }

  FutureOr<void> _getPermissionLocation(
      GetPermissionLocationEvent event, Emitter<WeatherState> emit) async {
    final result = await getPermissionLocationUseCase.getData();
    return emit(state.copyWith(getPermission: result, getPermissionState: RequestState.loaded));
  }

  FutureOr<void> _getWeatherForCast(
      GetWeatherForCastEvent event, Emitter<WeatherState> emit) async {
    final result =
        await getDataWeatherForCastFiveDayUseCase.getData(long: event.long, late: event.late);
    result.fold(
        (l) => emit(
            state.copyWith(forCastmessage: l.message, weatherDataForCastState: RequestState.erorr)),
        (r) => emit(state.copyWith(weatherForCastData: r, weatherDataState: RequestState.loaded)));
  }

  FutureOr<void> _checkLocationService(
      CheckLocationServiceEvent event, Emitter<WeatherState> emit) async {
    final result = await checkLocationServerUseCase.checkLocation();
    return emit(state.copyWith(checkLocationService: result));
  }

  FutureOr<void> _getLocationService(
      GetLocationServiceEvent event, Emitter<WeatherState> emit) async {
    final result = await getLocationServerUseCase.getLocation();
    return emit(state.copyWith(checkLocationService: result));
  }
}
