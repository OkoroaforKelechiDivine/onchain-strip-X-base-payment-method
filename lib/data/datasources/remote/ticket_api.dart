import 'package:pay_me_mobile/data/datasources/remote/base/api_failure.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/base/api_service.dart';
import 'package:pay_me_mobile/data/model/params/create_ticket_param.dart';
import 'package:pay_me_mobile/data/model/response/ticket/create_ticket_response.dart';

class TicketApi {
  final _apiService = ApiService(path: '/ticket');

  Future<ApiResponse<CreateTicketResponse>> createTicket(
      {required CreateTicketParam param}) async {
    try {
      final res = await _apiService.post(
        "/create",
        data: param.toJson(),
      );
      return ApiResponse.fromJson(res)
        ..data = CreateTicketResponse.fromJson(res['ticket']);
    } on ApiFailure catch (e) {
      return ApiResponse(success: false, message: e.message);
    }
  }
}
