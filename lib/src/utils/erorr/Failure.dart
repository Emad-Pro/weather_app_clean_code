// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {
  final String message;
  const Faliure(this.message);
  @override
  List<Object?> get props => [message];
}

class ServerFaliure extends Faliure {
  const ServerFaliure(super.message);
}

class LocaleFaliure extends Faliure {
  const LocaleFaliure(super.message);
}
