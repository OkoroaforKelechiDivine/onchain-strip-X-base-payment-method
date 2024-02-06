class SingleCustomerResponse {
  final Customer customer;

  SingleCustomerResponse({
    required this.customer,
  });

  factory SingleCustomerResponse.fromJson(Map<String, dynamic> json) =>
      SingleCustomerResponse(
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer.toJson(),
      };
}

class Customer {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String state;

  Customer({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.state,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        name: json["Name"],
        phone: json["Phone"],
        email: json["Email"],
        address: json["Address"],
        state: json["State"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "Name": name,
        "Phone": phone,
        "Email": email,
        "Address": address,
        "State": state,
      };
}
