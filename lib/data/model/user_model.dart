class User {
  final String accountName;
  final String accountNumber;
  final String accountType;
  final String address;
  final String business;
  final int exp;
  final String firstName;
  final bool isFirstLogin;
  final bool isTransactionPinSet;
  final String lastName;
  final dynamic permissions;
  final String phoneNumber;
  final String role;
  final int sub;
  final int tier;
  final String username;

  User({
    required this.accountName,
    required this.accountNumber,
    required this.accountType,
    required this.address,
    required this.business,
    required this.exp,
    required this.firstName,
    required this.isFirstLogin,
    required this.isTransactionPinSet,
    required this.lastName,
    required this.permissions,
    required this.phoneNumber,
    required this.role,
    required this.sub,
    required this.tier,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        accountType: json["account_type"],
        address: json["address"],
        business: json["business"],
        exp: json["exp"],
        firstName: json["first_name"],
        isFirstLogin: json["is_first_login"],
        isTransactionPinSet: json["is_transaction_pin_set"],
        lastName: json["last_name"],
        permissions: json["permissions"] != null
            ? List<String>.from(json["permissions"].map((x) => x))
            : [],
        phoneNumber: json["phone_number"],
        role: json["role"],
        sub: json["sub"],
        tier: json["tier"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "account_name": accountName,
        "account_number": accountNumber,
        "account_type": accountType,
        "address": address,
        "business": business,
        "exp": exp,
        "first_name": firstName,
        "is_first_login": isFirstLogin,
        "is_transaction_pin_set": isTransactionPinSet,
        "last_name": lastName,
        "permissions": permissions != null
            ? List<dynamic>.from(permissions!.map((x) => x))
            : null,
        "phone_number": phoneNumber,
        "role": role,
        "sub": sub,
        "tier": tier,
        "username": username,
      };
}
