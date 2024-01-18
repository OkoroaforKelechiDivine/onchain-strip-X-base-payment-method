class RequestPosAccountParam {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String businessAddress;
  final String state;
  final String bvn;
  final String businessName;
  final String rcNumber;
  final String incorporationDate;

  RequestPosAccountParam({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.businessAddress,
    required this.state,
    required this.bvn,
    required this.businessName,
    required this.rcNumber,
    required this.incorporationDate,
  });

  factory RequestPosAccountParam.fromJson(Map<String, dynamic> json) =>
      RequestPosAccountParam(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        businessAddress: json["businessAddress"],
        state: json["state"],
        bvn: json["bvn"],
        businessName: json["businessName"],
        rcNumber: json["rcNumber"],
        incorporationDate: json["incorporationDate"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "businessAddress": businessAddress,
        "state": state,
        "bvn": bvn,
        "businessName": businessName,
        "rcNumber": rcNumber,
        "incorporationDate": incorporationDate,
      };
}
