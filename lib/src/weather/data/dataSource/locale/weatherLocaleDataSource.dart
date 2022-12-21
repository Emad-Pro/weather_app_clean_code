import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_clean_code/src/utils/erorr/Exception.dart';

import 'package:weather_app_clean_code/src/weather/data/model/positionLateLongModel.dart';

import 'package:weather_app_clean_code/src/weather/domain/entitis/locationlatitudeLongitude.dart';

abstract class BaseLocaleDataSource {
  Future<bool> getLocationPermission();
  Future<bool> checkLoctionService();
  Future<bool> getLoctionService();
  Future<locationlatitudeLongitude> getCurrentPosition();
}

class LocaleDataSource extends BaseLocaleDataSource {
  @override
  Future<bool> checkLoctionService() async {
    bool serviceLocation = await Geolocator.isLocationServiceEnabled();
    if (!serviceLocation) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> getLocationPermission() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> getLoctionService() async {
    bool serviceLocation = await Geolocator.isLocationServiceEnabled();

    if (!serviceLocation) {
      await Geolocator.openLocationSettings();
      serviceLocation = await Geolocator.isLocationServiceEnabled();
      if (serviceLocation) {
        return true;
      }
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<locationlatitudeLongitude> getCurrentPosition() async {
    final Position position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(position.toJson());
    return PositionLateLongModel.fromJson(position.toJson());
  }
}
