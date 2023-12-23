import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_response.dart';
import 'package:stacked/stacked.dart';

class TransactionHistoryViewModel extends BaseViewModel {
  bool isLoadingTransaction = false;
  bool isTransactionError = false;
  List<TransactionResponse> transactionList = [];

  Future<void> init() async {
    await getTransactionList();
  }

  Future<void> getTransactionList() async {
    isLoadingTransaction = true;
    notifyListeners();
    final response = await transactionRepo.getTransactionList();
    if (response.success) {
      isLoadingTransaction = false;
      notifyListeners();
      transactionList = response.data!;
      transactionList = transactionList!.reversed.toList();
    } else {
      isTransactionError = true;
      isLoadingTransaction = false;
      notifyListeners();
      snackbarService.error(message: response.message!);
    }
    setBusy(false);
    notifyListeners();
  }
}
