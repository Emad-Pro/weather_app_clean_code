import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class GetLocationServerUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  GetLocationServerUseCase(this.baseWeatherRepository);
  Future<bool> getLocation() {
    return baseWeatherRepository.getLocationService();
  }
}
