import 'package:equatable/equatable.dart';

class locationlatitudeLongitude extends Equatable {
  final double latitude;
  final double longitude;

  const locationlatitudeLongitude({required this.latitude, required this.longitude});
  @override
  List<Object?> get props => [latitude, longitude];
}
