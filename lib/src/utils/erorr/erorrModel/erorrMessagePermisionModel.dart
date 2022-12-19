import 'package:equatable/equatable.dart';

class ErorrMessagePermisionModel extends Equatable {
  final String message;

  const ErorrMessagePermisionModel({required this.message});
  factory ErorrMessagePermisionModel.fromJson(Map<String, dynamic> json) {
    return ErorrMessagePermisionModel(message: json['message']);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
