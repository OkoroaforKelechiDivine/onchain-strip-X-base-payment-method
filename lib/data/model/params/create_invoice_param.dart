class CreateInvoiceParam {
  final String title;
  final String additionalNote;
  final List<InvoiceItem> items;
  final int customer;
  final DateTime dueDate;

  CreateInvoiceParam({
    required this.title,
    required this.additionalNote,
    required this.items,
    required this.customer,
    required this.dueDate,
  });

  factory CreateInvoiceParam.fromJson(Map<String, dynamic> json) =>
      CreateInvoiceParam(
        title: json["title"],
        additionalNote: json["additionalNote"],
        items: List<InvoiceItem>.from(
            json["items"].map((x) => InvoiceItem.fromJson(x))),
        customer: json["customer"],
        dueDate: DateTime.parse(json["dueDate"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "additionalNote": additionalNote,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "customer": customer,
        "dueDate":
            "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
      };
}

class InvoiceItem {
  String description;
  int quantity;
  double pricePerUnit;
  double get amount => quantity * pricePerUnit;

  InvoiceItem({
    required this.description,
    required this.quantity,
    required this.pricePerUnit,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
        description: json["description"],
        quantity: json["quantity"],
        pricePerUnit: json["price_per_unit"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "quantity": quantity,
        "price_per_unit": pricePerUnit,
      };
}
