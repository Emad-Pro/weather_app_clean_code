part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final Weather? weatherData;
  final RequestState weatherDataState;
  final String message;
  final locationlatitudeLongitude? positionLateLong;
  final RequestState positionLateLongState;
  final String positionLateLongMessage;
  final bool getPermission;
  final RequestState getPermissionState;
  final WeatherForcastFiveDay? weatherForCastData;
  final RequestState weatherDataForCastState;
  final String forCastmessage;
  final bool? checkLocationService;
  const WeatherState(
      {this.weatherData,
      this.weatherDataState = RequestState.loading,
      this.message = '',
      this.positionLateLong,
      this.positionLateLongState = RequestState.loading,
      this.positionLateLongMessage = '',
      this.getPermission = false,
      this.getPermissionState = RequestState.loading,
      this.forCastmessage = '',
      this.weatherForCastData,
      this.weatherDataForCastState = RequestState.loading,
      this.checkLocationService});
  WeatherState copyWith(
      {Weather? weatherData,
      RequestState? weatherDataState,
      String? message,
      locationlatitudeLongitude? positionLateLong,
      RequestState? positionLateLongState,
      String? positionLateLongMessage,
      bool? getPermission,
      RequestState? getPermissionState,
      WeatherForcastFiveDay? weatherForCastData,
      RequestState? weatherDataForCastState,
      String? forCastmessage,
      bool? checkLocationService}) {
    return WeatherState(
        weatherData: weatherData ?? this.weatherData,
        weatherDataState: weatherDataState ?? this.weatherDataState,
        message: message ?? this.message,
        positionLateLong: positionLateLong ?? this.positionLateLong,
        positionLateLongState: positionLateLongState ?? this.positionLateLongState,
        positionLateLongMessage: positionLateLongMessage ?? this.positionLateLongMessage,
        getPermission: getPermission ?? this.getPermission,
        getPermissionState: getPermissionState ?? this.getPermissionState,
        weatherForCastData: weatherForCastData ?? this.weatherForCastData,
        weatherDataForCastState: weatherDataForCastState ?? this.weatherDataForCastState,
        forCastmessage: forCastmessage ?? this.forCastmessage,
        checkLocationService: checkLocationService ?? this.checkLocationService);
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
        getPermissionState,
        forCastmessage,
        weatherDataForCastState,
        weatherForCastData,
        checkLocationService
      ];
}
