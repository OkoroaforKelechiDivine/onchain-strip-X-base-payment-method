import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/create_role_param.dart';
import 'package:pay_me_mobile/data/model/params/update_role_param.dart';
import 'package:pay_me_mobile/data/model/response/user_management/create_role_res.dart';
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

  Future<ApiResponse<CreateRoleRes>> createRole(
      {required CreateRoleParam param}) async {
    try {
      final res = await _apiService.post(
        "/create",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = CreateRoleRes.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> updateROle(
      {required UpdateRoleParam param, required String id}) async {
    try {
      final res = await _apiService.put(
        "/update/$id",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
