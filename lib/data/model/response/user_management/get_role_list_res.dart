class GetRoleListRes {
  final int id;
  final String label;
  final String actions;

  GetRoleListRes({
    required this.id,
    required this.label,
    required this.actions,
  });

  factory GetRoleListRes.fromJson(Map<String, dynamic> json) => GetRoleListRes(
        id: json["ID"],
        label: json["label"],
        actions: json["actions"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "label": label,
        "actions": actions,
      };
}
