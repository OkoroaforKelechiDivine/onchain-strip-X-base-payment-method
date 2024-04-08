class CreateRoleRes {
  final String actions;
  final String role;
  final int roleId;

  CreateRoleRes({
    required this.actions,
    required this.role,
    required this.roleId,
  });

  factory CreateRoleRes.fromJson(Map<String, dynamic> json) => CreateRoleRes(
        actions: json["actions"],
        role: json["role"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "actions": actions,
        "role": role,
        "role_id": roleId,
      };
}
