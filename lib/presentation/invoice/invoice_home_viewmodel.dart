import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_all_invoice_list_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
import 'package:stacked/stacked.dart';

class InvoiceHomeViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool isLoadingInvoice = false;
  bool isLoadingCustomer = false;
  bool deletingInvoice = false;
  List<GetInvoiceListRes> invoiceList = [];
  List<GetCustomerRes> cusstomerList = [];
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();
  double startVerticalDragDetailsY = 0.0;
  double updateVerticalDragDetailsY = 0.0;
  ScrollController scrollController = ScrollController();
  bool showFullButton = true;

  Future<void> init() async {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset >= 50) {
      showFullButton = false;
      notifyListeners();
    } else {
      showFullButton = true;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
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
      invoiceList = res.data!.reversed.toList();
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
      cusstomerList = res.data!.reversed.toList();
      notifyListeners();
    } else {
      isLoadingCustomer = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  Future<void> deleteInvoice(String id) async {
    deletingInvoice = true;
    notifyListeners();
    final res = await invoiceRepo.deleteInvoice(id: id);
    if (res.success) {
      deletingInvoice = false;
      notifyListeners();
      snackbarService.success(message: "User Deleted Successfully");
      getInvoice();
      notifyListeners();
    } else {
      deletingInvoice = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }
}
