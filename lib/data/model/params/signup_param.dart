class SignUpParam {
  final String username;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String loginPin;
  final String businessAddress;
  final String businessName;
  final String state;
  final String dob;
  final String gender;
  final String? rcNumber;
  final String? incorporationDate;

  SignUpParam({
    required this.username,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.loginPin,
    required this.businessAddress,
    required this.businessName,
    required this.state,
    required this.dob,
    required this.gender,
    this.rcNumber,
    this.incorporationDate,
  });

  factory SignUpParam.fromJson(Map<String, dynamic> json) => SignUpParam(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        loginPin: json["login_pin"],
        businessAddress: json["business_address"],
        businessName: json["business_name"],
        state: json["state"],
        dob: json["dob"],
        gender: json["gender"],
        rcNumber: json["registration_number"],
        incorporationDate: json["registration_date"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "login_pin": loginPin,
        "business_address": businessAddress,
        "business_name": businessName,
        "state": state,
        "dob": dob,
        "gender": gender,
        "registration_number": rcNumber,
        "registration_date": incorporationDate,
      };
}
