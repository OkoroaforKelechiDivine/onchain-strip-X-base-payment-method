import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/business_api.dart';

class BusinessRepo {
  final _businessApi = BusinessApi();

  Future<ApiResponse<double>> getWalletBalance() async {
    return _businessApi.getWalletBalance();
  }
}
