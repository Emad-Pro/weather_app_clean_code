import 'package:equatable/equatable.dart';

class Sys extends Equatable {
  final int id;
  final String country;

  const Sys({required this.id, required this.country});
  @override
  // TODO: implement props
  List<Object?> get props => [id, country];
}
