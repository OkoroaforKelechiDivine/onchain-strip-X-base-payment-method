import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/pos_api.dart';
import 'package:pay_me_mobile/data/model/params/request_pos_account_param.dart';

class POSRepo {
  final _posApi = POSApi();

  Future<ApiResponse<String>> requestPOSAccount({
    required RequestPosAccountParam param,
  }) async {
    return _posApi.requestPOSAccount(param: param);
  }
}
