import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';

class RoleApi {
  final _apiService = ApiService(path: '/role');

  Future<ApiResponse<List<GetRoleListRes>>> getAllRoles() async {
    try {
      final res = await _apiService.get(
        "/fetch",
      );
      return ApiResponse.fromJson(res)
        ..data = (res['role'] as List)
            .map((e) => GetRoleListRes.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
