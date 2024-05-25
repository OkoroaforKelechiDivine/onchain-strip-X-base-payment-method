class LoginParam {
  String? phoneNumber;
  String? username;
  String password;

  LoginParam({
    this.phoneNumber,
    this.username,
    required this.password,
  });

  factory LoginParam.fromJson(Map<String, dynamic> json) => LoginParam(
        phoneNumber: json["phone_number"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (phoneNumber != null) data["phone_number"] = phoneNumber;
    if (username != null) data["username"] = username;
    data["password"] = password;
    return data;
  }
}
