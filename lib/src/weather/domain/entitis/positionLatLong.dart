import 'package:equatable/equatable.dart';

class PositionLateLong extends Equatable {
  final double latitude;
  final double longitude;

  const PositionLateLong({required this.latitude, required this.longitude});
  @override
  List<Object?> get props => [latitude, longitude];
}
