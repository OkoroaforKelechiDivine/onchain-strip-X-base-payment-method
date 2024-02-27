import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/create_admin_param.dart';
import 'package:pay_me_mobile/data/model/params/update_admin_param.dart';
import 'package:pay_me_mobile/data/model/response/ticket/create_ticket_response.dart';
import 'package:pay_me_mobile/data/model/response/user_management/create_admin_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_admin_list_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_single_admin.dart';

class AdminApi {
  final _apiService = ApiService(path: '/admin');

  Future<ApiResponse<List<GetAdminListRes>>> getAllAdmin() async {
    try {
      final res = await _apiService.get(
        "/fetch_all",
      );
      return ApiResponse.fromJson(res)
        ..data = (res['admins'] as List)
            .map((e) => GetAdminListRes.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<CreateAdminRes>> createAdmin(
      {required CreateAdminParam param}) async {
    try {
      final res = await _apiService.post(
        "/create",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = CreateAdminRes.fromJson(res);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> updateAdmin(
      {required UpdateAdminParam param, required String id}) async {
    try {
      final res = await _apiService.put(
        "/update/$id",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = res['message'];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<GetSingleAdminRes>> getSingleAdmin(
      {required String id}) async {
    try {
      final res = await _apiService.get(
        "/fetch/$id",
      );
      return ApiResponse.fromJson(res)
        ..data = GetSingleAdminRes.fromJson(res["message"]);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> deleteAdmin({required String name}) async {
    try {
      final res = await _apiService.delete(
        "/delete/$name",
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = res['message'];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
