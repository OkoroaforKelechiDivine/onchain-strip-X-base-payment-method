import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/create_admin_param.dart';
import 'package:pay_me_mobile/data/model/response/ticket/create_ticket_response.dart';
import 'package:pay_me_mobile/data/model/response/user_management/create_admin_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_admin_list_res.dart';

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
}
