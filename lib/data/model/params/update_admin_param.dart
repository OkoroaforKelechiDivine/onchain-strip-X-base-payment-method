class UpdateAdminParam {
  final String firstName;
  final String lastName;
  final String role;

  UpdateAdminParam({
    required this.firstName,
    required this.lastName,
    required this.role,
  });

  factory UpdateAdminParam.fromJson(Map<String, dynamic> json) =>
      UpdateAdminParam(
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["Role"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "Role": role,
      };
}
