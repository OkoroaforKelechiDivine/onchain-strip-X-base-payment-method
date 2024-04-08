class UpdateRoleParam {
  final String label;
  final List<String> actions;

  UpdateRoleParam({
    required this.label,
    required this.actions,
  });

  factory UpdateRoleParam.fromJson(Map<String, dynamic> json) =>
      UpdateRoleParam(
        label: json["label"],
        actions: List<String>.from(json["actions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "actions": List<dynamic>.from(actions.map((x) => x)),
      };
}
