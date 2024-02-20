class GetAdminListRes {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final int businessId;
  final bool active;

  GetAdminListRes({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.businessId,
    required this.active,
  });

  factory GetAdminListRes.fromJson(Map<String, dynamic> json) =>
      GetAdminListRes(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        role: json["Role"],
        businessId: json["BusinessID"],
        active: json["Active"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Role": role,
        "BusinessID": businessId,
        "Active": active,
      };
}
