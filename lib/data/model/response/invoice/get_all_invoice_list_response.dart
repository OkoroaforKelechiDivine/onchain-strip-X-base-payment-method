class GetInvoiceListRes {
  final String title;
  final bool paid;
  final DateTime dueDate;
  final String customer;
  final int id;
  final DateTime createdAt;
  final double totalAmount;

  GetInvoiceListRes({
    required this.title,
    required this.paid,
    required this.dueDate,
    required this.customer,
    required this.id,
    required this.createdAt,
    required this.totalAmount,
  });

  factory GetInvoiceListRes.fromJson(Map<String, dynamic> json) =>
      GetInvoiceListRes(
        title: json["Title"],
        paid: json["Paid"],
        dueDate: DateTime.parse(json["DueDate"]),
        customer: json["Customer"],
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        totalAmount: double.parse(json["TotalAmount"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Paid": paid,
        "DueDate": dueDate.toIso8601String(),
        "Customer": customer,
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "TotalAmount": totalAmount,
      };
}
