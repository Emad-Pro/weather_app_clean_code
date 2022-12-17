// ignore_for_file: file_names

import '../network/erorrMessageModel.dart';

class ServerException implements Exception {
  final ErorrMessageModel erorrMessageModel;

  const ServerException({required this.erorrMessageModel});
}
