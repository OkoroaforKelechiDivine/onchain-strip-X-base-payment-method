import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_all_invoice_list_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
import 'package:stacked/stacked.dart';

class InvoiceHomeViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool isLoadingInvoice = false;
  bool isLoadingCustomer = false;
  List<GetInvoiceListRes> invoiceList = [];
  List<GetCustomerRes> cusstomerList = [];

  Future<void> init() async {
    await getInvoice();
    await getCustomers();
  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> getInvoice() async {
    isLoadingInvoice = true;
    notifyListeners();
    final res = await invoiceRepo.getAllInvoice();
    if (res.success) {
      isLoadingInvoice = false;
      notifyListeners();
      invoiceList = res.data!;
      notifyListeners();
    } else {
      isLoadingInvoice = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  Future<void> getCustomers() async {
    isLoadingCustomer = true;
    notifyListeners();
    final res = await invoiceRepo.getAllCustomer();
    if (res.success) {
      isLoadingCustomer = false;
      notifyListeners();
      cusstomerList = res.data!;
      notifyListeners();
    } else {
      isLoadingCustomer = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
