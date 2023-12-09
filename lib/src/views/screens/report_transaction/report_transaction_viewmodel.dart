import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/data/model/params/create_ticket_param.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/di/locator.dart';

class ReportTransactionViewModel extends BaseViewModel {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isReporting = false;

  Future<void> init() async {}

  Future<void> reportTransaction(CreateTicketParam param) async {
    isReporting = true;
    notifyListeners();
    final res = await ticketRepo.createTicket(param: param);
    if (res.success) {
      snackbarService.success(message: "Successfully reported");
    } else {
      snackbarService.error(message: res.message!);
    }
    isReporting = false;
    notifyListeners();
  }
}
