import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';

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
}
