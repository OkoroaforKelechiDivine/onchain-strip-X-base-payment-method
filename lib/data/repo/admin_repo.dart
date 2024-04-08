import 'package:pay_me_mobile/data/datasources/remote/admin_api.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/model/params/create_admin_param.dart';
import 'package:pay_me_mobile/data/model/params/update_admin_param.dart';
import 'package:pay_me_mobile/data/model/response/user_management/create_admin_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_admin_list_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_single_admin.dart';

class AdminRepo {
  final _adminApi = AdminApi();

  Future<ApiResponse<List<GetAdminListRes>>> getAllAdmin() async {
    return _adminApi.getAllAdmin();
  }

  Future<ApiResponse<CreateAdminRes>> createAdmin(
      {required CreateAdminParam param}) async {
    return _adminApi.createAdmin(param: param);
  }

  Future<ApiResponse<String>> deleteAdmin({required String name}) async {
    return _adminApi.deleteAdmin(name: name);
  }

  Future<ApiResponse<String>> updateAdmin(
      {required UpdateAdminParam param, required String id}) async {
    return _adminApi.updateAdmin(param: param, id: id);
  }

  Future<ApiResponse<GetSingleAdminRes>> getSingleAdmin(
      {required String id}) async {
    return _adminApi.getSingleAdmin(id: id);
  }
}
