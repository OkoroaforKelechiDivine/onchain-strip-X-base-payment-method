import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/utilities/general_util.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_count_res.dart';
import 'package:stacked/stacked.dart';

class BusinessDetailViewModel extends BaseViewModel {
  bool isLoadingConsent = false;
  bool isLoadingBusinessCount = false;
  String link = "";
  TransactionCountResponse? transactionCountResponse;

  Future<void> getConsent({required String bvn, required String id}) async {
    isLoadingConsent = true;
    notifyListeners();
    final res = await businessRepo.getConsent(bvn: bvn, id: id);
    if (res.success) {
      link = res.data!;
      if (link.isNotEmpty) {
        launchUrlStart(url: link);
      }
      isLoadingConsent = false;
      notifyListeners();
      notifyListeners();
    } else {
      isLoadingConsent = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  Future<void> getTransactionCount(String id) async {
    isLoadingBusinessCount = true;
    notifyListeners();
    final res = await transactionRepo.getTransactionCount(id);
    if (res.success) {
      transactionCountResponse = res.data;
      isLoadingBusinessCount = false;
      notifyListeners();
      notifyListeners();
    } else {
      isLoadingBusinessCount = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
