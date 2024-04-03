import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/create_business_param.dart';
import 'package:pay_me_mobile/data/model/response/business/create_business_response.dart';
import 'package:pay_me_mobile/data/model/response/business/get_all_business.dart';

class BusinessApi {
  final _apiService = ApiService(path: '/business');

  Future<ApiResponse<double>> getWalletBalance() async {
    try {
      final res = await _apiService.get(
        '/wallet_balance',
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..message = "Success"
        ..data = double.parse(res["message"].toString());
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<CreateBusinessRes>> createBusiness(
      {required CreateBusinessParam param}) async {
    try {
      final res = await _apiService.post(
        "/create",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..success = true
        ..data = CreateBusinessRes.fromJson(res["business"]);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<List<GetBusinessLisRes>>> getAllBusiness() async {
    try {
      final res = await _apiService.get(
        "/fetch_all",
      );
      return ApiResponse.fromJson(res)
        ..data = (res['business'] as List)
            .map((e) => GetBusinessLisRes.fromJson(e))
            .toList();
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }

  Future<ApiResponse<String>> getConsent(
      {required String bvn, required String id}) async {
    try {
      final res = await _apiService.get(
        '/get_consent',
        queryParams: {
          "bvn": bvn,
          "id": id,
          "user_type": "business",
        },
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
