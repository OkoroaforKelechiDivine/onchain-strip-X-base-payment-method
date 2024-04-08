import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/roles_api.dart';
import 'package:pay_me_mobile/data/model/params/create_role_param.dart';
import 'package:pay_me_mobile/data/model/params/update_role_param.dart';
import 'package:pay_me_mobile/data/model/response/user_management/create_role_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';

class RoleRepo {
  final _roleApi = RoleApi();

  Future<ApiResponse<List<GetRoleListRes>>> getAllRoles() async {
    return _roleApi.getAllRoles();
  }

  Future<ApiResponse<CreateRoleRes>> createRole(
      {required CreateRoleParam param}) async {
    return _roleApi.createRole(param: param);
  }

  Future<ApiResponse<String>> updateROle(
      {required UpdateRoleParam param, required String id}) async {
    return _roleApi.updateROle(param: param, id: id);
  }
}
