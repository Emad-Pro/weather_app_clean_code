import 'erorrModel/erorrMessageModel.dart';
import 'erorrModel/erorrMessagePermisionModel.dart';

class ServerException implements Exception {
  final ErorrMessageModel erorrMessageModel;

  const ServerException({required this.erorrMessageModel});
}

class PermisionMessage implements Exception {
  final ErorrMessagePermisionModel erorrMessagePermisionModel;

  const PermisionMessage({required this.erorrMessagePermisionModel});
}
