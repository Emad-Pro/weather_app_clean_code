import 'package:geolocator/geolocator.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';
import 'package:weather_app_clean_code/src/weather/data/model/permisionModel.dart';

import 'package:weather_app_clean_code/src/weather/data/model/positionLateLongModel.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/permition.dart';
import 'package:weather_app_clean_code/src/weather/domain/entitis/positionLatLong.dart';

abstract class BaseLocaleDataSource {
  Future<GetPermissionModel> getLocationPermission();
  Future<PositionLateLong> getCurrentPosition();
}

class LocaleDataSource extends BaseLocaleDataSource {
  @override
  Future<GetPermissionModel> getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return GetPermissionModel.fromJson(false);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return GetPermissionModel.fromJson(false);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return GetPermissionModel.fromJson(false);
    }
    return GetPermissionModel.fromJson(true);
  }

  @override
  Future<PositionLateLong> getCurrentPosition() async {
    final Position position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.reduced);
    print(position.toJson());
    return PositionLateLongModel.fromJson(position.toJson());

    // if (!hasPermission) return;
  }
}
