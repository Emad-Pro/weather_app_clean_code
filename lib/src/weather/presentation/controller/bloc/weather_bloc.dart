import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/permition.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/positionLatLong.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/weather.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getDataWeatherWithLanLatUseCase.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getPermissionLocation.dart';
import 'package:weather_app_clean_code/src/weather/domain/useCase/getPositionLongLateUseCase.dart';

import '../../../../utils/enum.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetDataWeatherWithLanLatUseCase getDataWeatherWithLanLatUseCase;
  final GetPositionLongLateUseCase getPositionLongLateUseCase;
  final GetPermissionLocationUseCase getPermissionLocationUseCase;
  WeatherBloc(
      {required this.getDataWeatherWithLanLatUseCase,
      required this.getPositionLongLateUseCase,
      required this.getPermissionLocationUseCase})
      : super(const WeatherState()) {
    on<GetDataWeatherWithLanLatEvent>(_getDataWeatherWithLanLat);
    on<GetPositionLongLatEvent>(_getPositionLongLat);
    on<GetPermissionLocationEvent>(_getPermissionLocation);
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
}
