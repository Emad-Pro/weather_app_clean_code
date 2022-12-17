import 'package:equatable/equatable.dart';

class ErorrMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErorrMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });
  factory ErorrMessageModel.fromJson(Map<String, dynamic> json) {
    return ErorrMessageModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success']);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, statusMessage, success];
}
