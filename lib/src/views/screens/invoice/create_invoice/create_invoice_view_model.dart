import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/create_invoice_param.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
import 'package:stacked/stacked.dart';

class CreateInvoiceViewModel extends BaseViewModel {
  TextEditingController customerNameTEC = TextEditingController();
  TextEditingController customerEmailAddressTEC = TextEditingController();
  TextEditingController invoiceTitleTEC = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController additionalNoteTEC = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final List<InvoiceItem> _items = [
    InvoiceItem(description: "", pricePerUnit: 0, quantity: 0)
  ];
  String selectedDiscountType = "Fixed";
  List<String> discountList = [
    "Fixed",
    "Percentage",
  ];

  String selectedTaxType = "Fixed";
  List<String> taxList = [
    "Fixed",
    "Percentage",
  ];
  GetCustomerRes? selectedCustomer;

  List<InvoiceItem> get items => _items;
  bool isSavingInvoice = false;
  double subtotal() {
    return _items.fold(0, (total, item) => total + item.amount);
  }

  double total() {
    return subtotal() - discountAmount() + taxAmount();
  }

  double discountAmount() {
    double discountValue =
        double.tryParse(discount.text.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;
    if (selectedDiscountType == "Fixed") {
      return discountValue;
    } else {
      return discountValue / 100 * subtotal();
    }
  }

  double taxAmount() {
    double taxValue =
        double.tryParse(tax.text.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0;
    if (selectedTaxType == "Fixed") {
      return taxValue;
    } else {
      return taxValue / 100 * subtotal();
    }
  }

  void selectCustomer(GetCustomerRes? val) {
    selectedCustomer = val;
    customerEmailAddressTEC.text = val?.email ?? "";
    notifyListeners();
  }

  // Call this method when the discount type or value changes
  void updateTotal(String value) {
    taxAmount();
    discountAmount();
    // Call this after updating the discount value
    notifyListeners();
  }

  // Call this method when the tax type or value changes
  void updateTax(String value) {
    // Parse and set the new tax value, if needed
    // ...
    // Call this after updating the tax value
    notifyListeners();
  }

  void addItem() {
    _items.add(InvoiceItem(description: "", pricePerUnit: 0, quantity: 0));
    notifyListeners();
  }

  void selectedDiscount(String value) {
    selectedDiscountType = value;
    notifyListeners();
  }

  void selectedTax(String value) {
    selectedTaxType = value;
    notifyListeners();
  }

  // Call this whenever an item is updated
  void onItemUpdated() {
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1971),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    notifyListeners();
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  Future<void> saveInvoice(int inVoiceNumber, Function onPop) async {
    isSavingInvoice = true;
    notifyListeners();
    final param = CreateInvoiceParam(
      additionalNote: additionalNoteTEC.text,
      invoiceNumber: inVoiceNumber.toString(),
      customer: selectedCustomer!.id,
      dueDate: DateTime.parse("${selectedDate.toLocal()}".split(' ')[0]),
      title: invoiceTitleTEC.text,
      items: _items,
      tax: taxAmount(),
      discount: discountAmount(),
      totalAmount: total(),
    );
    final res = await invoiceRepo.createInvoice(param: param);
    if (res.success) {
      isSavingInvoice = false;
      notifyListeners();
      snackbarService.success(
          message: res.data ?? "Invoice created successfully");
      onPop();
      navigationService.pop();
    } else {
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
    isSavingInvoice = false;
    notifyListeners();
  }
}
