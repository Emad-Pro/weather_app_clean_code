import 'package:equatable/equatable.dart';

class Cord extends Equatable {
  final double lon;
  final double lat;

  const Cord({required this.lon, required this.lat});
  @override
  // TODO: implement props
  List<Object?> get props => [lon, lat];
}
