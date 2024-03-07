import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/business_api.dart';
import 'package:pay_me_mobile/data/model/params/create_business_param.dart';
import 'package:pay_me_mobile/data/model/response/business/create_business_response.dart';
import 'package:pay_me_mobile/data/model/response/business/get_all_business.dart';

class BusinessRepo {
  final _businessApi = BusinessApi();

  Future<ApiResponse<double>> getWalletBalance() async {
    return _businessApi.getWalletBalance();
  }

  Future<ApiResponse<List<GetBusinessLisRes>>> getAllBusiness() async {
    return _businessApi.getAllBusiness();
  }

  Future<ApiResponse<CreateBusinessRes>> createBusiness(
      {required CreateBusinessParam param}) async {
    return _businessApi.createBusiness(param: param);
  }
}
