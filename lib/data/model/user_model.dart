class User {
  final String? accountName;
  final String? accountNumber;
  final String? accountType;
  final String? business;
  final int? exp;
  final String? firstName;
  final bool? isDefaultPassword;
  final bool? isFirstLogin;
  final String? lastName;
  final List<String>? permissions;
  final String? role;
  final int? sub;
  final String? username;

  User({
    this.accountName,
    this.accountNumber,
    this.accountType,
    this.business,
    this.exp,
    this.firstName,
    this.isDefaultPassword,
    this.isFirstLogin,
    this.lastName,
    this.permissions,
    this.role,
    this.sub,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        accountType: json["account_type"],
        business: json["business"],
        exp: json["exp"],
        firstName: json["first_name"],
        isDefaultPassword: json["is_default_password"],
        isFirstLogin: json["is_first_login"],
        lastName: json["last_name"],
        permissions: List<String>.from(json["permissions"].map((x) => x)),
        role: json["role"],
        sub: json["sub"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "account_name": accountName,
        "account_number": accountNumber,
        "account_type": accountType,
        "business": business,
        "exp": exp,
        "first_name": firstName,
        "is_default_password": isDefaultPassword,
        "is_first_login": isFirstLogin,
        "last_name": lastName,
        "permissions": permissions != null
            ? List<dynamic>.from(permissions!.map((x) => x))
            : null,
        "role": role,
        "sub": sub,
        "username": username,
      };
}
