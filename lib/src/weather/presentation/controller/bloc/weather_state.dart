part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final Weather? weatherData;
  final RequestState weatherDataState;
  final String message;
  final PositionLateLong? positionLateLong;
  final RequestState positionLateLongState;
  final String positionLateLongMessage;
  final GetPermission? getPermission;
  final RequestState getPermissionState;

  const WeatherState(
      {this.weatherData,
      this.weatherDataState = RequestState.loading,
      this.message = '',
      this.positionLateLong,
      this.positionLateLongState = RequestState.loading,
      this.positionLateLongMessage = '',
      this.getPermission,
      this.getPermissionState = RequestState.loading});
  WeatherState copyWith({
    Weather? weatherData,
    RequestState? weatherDataState,
    String? message,
    PositionLateLong? positionLateLong,
    RequestState? positionLateLongState,
    String? positionLateLongMessage,
    GetPermission? getPermission,
    RequestState? getPermissionState,
  }) {
    return WeatherState(
      weatherData: weatherData ?? this.weatherData,
      weatherDataState: weatherDataState ?? this.weatherDataState,
      message: message ?? this.message,
      positionLateLong: positionLateLong ?? this.positionLateLong,
      positionLateLongState: positionLateLongState ?? this.positionLateLongState,
      positionLateLongMessage: positionLateLongMessage ?? this.positionLateLongMessage,
      getPermission: getPermission ?? this.getPermission,
      getPermissionState: getPermissionState ?? this.getPermissionState,
    );
  }

  @override
  List<Object?> get props => [
        weatherData,
        weatherDataState,
        message,
        positionLateLongMessage,
        positionLateLong,
        positionLateLongState,
        getPermission,
        getPermissionState
      ];
}
