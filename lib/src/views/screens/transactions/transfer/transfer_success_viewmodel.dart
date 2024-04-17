import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/save_beneficiary_param.dart';
import 'package:stacked/stacked.dart';

class TransferSuccessViewmodel extends BaseViewModel {
  bool isLoading = false;
  Future<void> saveBeneficiary(SaveBeneficiaryParam beneficiary) async {
    isLoading = true;
    notifyListeners();
    final res = await authRepo.saveBeneficiary(beneficiary: beneficiary);
    if (res.success) {
      isLoading = false;
      notifyListeners();
      snackbarService.success(message: "Added to Beneficiary");
    } else {
      isLoading = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
