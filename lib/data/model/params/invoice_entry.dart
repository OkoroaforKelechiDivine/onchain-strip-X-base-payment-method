class InvoiceItemEntry {
  String description = '';
  double quantity = 0;
  double price = 0;

  double get amount => quantity * price;
}
