import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/request_pos_account_param.dart';

import 'base/api_response.dart';

class POSApi {
  final _apiService = ApiService(path: '/pos');

  Future<ApiResponse<String>> requestPOSAccount({
    required RequestPosAccountParam param,
  }) async {
    try {
      final res = await _apiService.post(
        "/request",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = res["message"];
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
