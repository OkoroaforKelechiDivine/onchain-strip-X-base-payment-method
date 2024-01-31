import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/params/invoice_entry.dart';
import 'package:stacked/stacked.dart';

class CreateInvoiceViewModel extends BaseViewModel {
  TextEditingController customerNameTEC = TextEditingController();
  TextEditingController customerEmailAddressTEC = TextEditingController();
  TextEditingController invoiceTitleTEC = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController tax = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<InvoiceItemEntry> _items = [InvoiceItemEntry()];

  List<InvoiceItemEntry> get items => _items;

  void addItem() {
    _items.add(InvoiceItemEntry());
    notifyListeners();
  }

  double get subtotal => _items.fold(0, (total, item) => total + item.amount);

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
}
