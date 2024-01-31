class SingleInvoiceResponse {
  final String additionalNote;
  final DateTime createdAt;
  final String customerAddress;
  final String customerName;
  final String customerPhone;
  final dynamic discount;
  final DateTime dueDate;
  final List<Item> items;
  final dynamic tax;
  final String title;
  final double totalAmount;

  SingleInvoiceResponse({
    required this.additionalNote,
    required this.createdAt,
    required this.customerAddress,
    required this.customerName,
    required this.customerPhone,
    required this.discount,
    required this.dueDate,
    required this.items,
    required this.tax,
    required this.title,
    required this.totalAmount,
  });

  factory SingleInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      SingleInvoiceResponse(
        additionalNote: json["AdditionalNote"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        customerAddress: json["CustomerAddress"],
        customerName: json["CustomerName"],
        customerPhone: json["CustomerPhone"],
        discount: json["Discount"],
        dueDate: DateTime.parse(json["DueDate"]),
        items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
        tax: json["Tax"],
        title: json["Title"],
        totalAmount: json["TotalAmount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "AdditionalNote": additionalNote,
        "CreatedAt": createdAt.toIso8601String(),
        "CustomerAddress": customerAddress,
        "CustomerName": customerName,
        "CustomerPhone": customerPhone,
        "Discount": discount,
        "DueDate": dueDate.toIso8601String(),
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
        "Tax": tax,
        "Title": title,
        "TotalAmount": totalAmount,
      };
}

class Item {
  final String description;
  final int quantity;
  final double pricePerUnit;
  final double amount;
  final int invoiceId;

  Item({
    required this.description,
    required this.quantity,
    required this.pricePerUnit,
    required this.amount,
    required this.invoiceId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        description: json["Description"],
        quantity: json["Quantity"],
        pricePerUnit: json["PricePerUnit"].toDouble(),
        amount: json["Amount"].toDouble(),
        invoiceId: json["InvoiceID"],
      );

  Map<String, dynamic> toJson() => {
        "Description": description,
        "Quantity": quantity,
        "PricePerUnit": pricePerUnit,
        "Amount": amount,
        "InvoiceID": invoiceId,
      };
}
