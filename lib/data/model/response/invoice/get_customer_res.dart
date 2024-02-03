class GetCustomerRes {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String state;

  GetCustomerRes({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.state,
  });

  factory GetCustomerRes.fromJson(Map<String, dynamic> json) => GetCustomerRes(
        id: json["ID"],
        name: json["Name"],
        phone: json["Phone"],
        email: json["Email"],
        address: json["Address"],
        state: json["State"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "Phone": phone,
        "Email": email,
        "Address": address,
        "State": state,
      };
}
