import 'package:weather_app_clean_code/src/weather/data/dataSource/locale/weatherLocaleDataSource.dart';

import 'package:weather_app_clean_code/src/weather/domain/repository/baseWeatherRepository.dart';

class GetPermissionLocationUseCase {
  final BaseWeatherRepository baseWeatherRepository;

  GetPermissionLocationUseCase(this.baseWeatherRepository);
  Future<bool> getData() async {
    return await baseWeatherRepository.getPermissionData();
  }
}
