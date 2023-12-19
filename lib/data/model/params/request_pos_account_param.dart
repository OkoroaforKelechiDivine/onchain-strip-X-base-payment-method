class RequestPosAccountParam {
  String firstName;
  String lastName;
  String email;
  String phone;
  String businessAddress;
  String state;
  String requestType;

  RequestPosAccountParam({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.businessAddress,
    required this.state,
    required this.requestType,
  });

  factory RequestPosAccountParam.fromJson(Map<String, dynamic> json) =>
      RequestPosAccountParam(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        businessAddress: json["businessAddress"],
        state: json["state"],
        requestType: json["requestType"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "businessAddress": businessAddress,
        "state": state,
        "requestType": requestType,
      };
}
