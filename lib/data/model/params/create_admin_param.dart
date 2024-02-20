class CreateAdminParam {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String role;

  CreateAdminParam({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.role,
  });

  factory CreateAdminParam.fromJson(Map<String, dynamic> json) =>
      CreateAdminParam(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        username: json["username"],
        role: json["Role"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "username": username,
        "Role": role,
      };
}
