import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/roles_api.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';

class RoleRepo {
  final _roleApi = RoleApi();

  Future<ApiResponse<List<GetRoleListRes>>> getAllRoles() async {
    return _roleApi.getAllRoles();
  }
}
