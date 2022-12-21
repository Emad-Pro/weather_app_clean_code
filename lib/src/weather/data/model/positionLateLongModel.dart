import '../../domain/entitis/locationlatitudeLongitude.dart';

class PositionLateLongModel extends locationlatitudeLongitude {
  const PositionLateLongModel({required super.latitude, required super.longitude});
  factory PositionLateLongModel.fromJson(Map<String, dynamic> json) {
    return PositionLateLongModel(latitude: json['latitude'], longitude: json['longitude']);
  }
}
