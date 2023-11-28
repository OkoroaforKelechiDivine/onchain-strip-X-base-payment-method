import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/ticket_api.dart';
import 'package:pay_me_mobile/data/model/params/create_ticket_param.dart';
import 'package:pay_me_mobile/data/model/response/ticket/create_ticket_response.dart';

class TicketRepo {
  final _ticketApi = TicketApi();

  Future<ApiResponse<CreateTicketResponse>> createTicket(
      {required CreateTicketParam param}) async {
    return await _ticketApi.createTicket(param: param);
  }
}
