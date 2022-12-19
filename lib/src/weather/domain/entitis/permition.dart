import 'package:equatable/equatable.dart';

class GetPermission extends Equatable {
  final bool permition;

  const GetPermission({required this.permition});

  @override
  List<Object?> get props => [permition];
}
