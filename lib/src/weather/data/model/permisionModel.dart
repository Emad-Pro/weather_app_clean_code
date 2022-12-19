import '../../domain/entitis/permition.dart';

class GetPermissionModel extends GetPermission {
  const GetPermissionModel({required super.permition});
  factory GetPermissionModel.fromJson(bool json) {
    return GetPermissionModel(permition: json);
  }
}
