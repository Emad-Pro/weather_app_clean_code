import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class CheckLocationServerUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  CheckLocationServerUseCase(this.baseWeatherRepository);
  Future<bool> checkLocation() {
    return baseWeatherRepository.checkLocationService();
  }
}
