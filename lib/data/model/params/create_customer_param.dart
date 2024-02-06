class CreateCustomerParam {
  final String name;
  final String phone;
  final String email;
  final String state;
  final String address;

  CreateCustomerParam({
    required this.name,
    required this.phone,
    required this.email,
    required this.state,
    required this.address,
  });

  factory CreateCustomerParam.fromJson(Map<String, dynamic> json) =>
      CreateCustomerParam(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        state: json["state"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "state": state,
        "address": address,
      };
}
