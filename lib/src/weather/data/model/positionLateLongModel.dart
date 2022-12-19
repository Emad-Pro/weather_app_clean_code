import '../../domain/entitis/positionLatLong.dart';

class PositionLateLongModel extends PositionLateLong {
  const PositionLateLongModel({required super.latitude, required super.longitude});
  factory PositionLateLongModel.fromJson(Map<String, dynamic> json) {
    return PositionLateLongModel(latitude: json['latitude'], longitude: json['latitude']);
  }
}
