class CreateRoleParam {
  final String label;
  final List<String> actions;

  CreateRoleParam({
    required this.label,
    required this.actions,
  });

  factory CreateRoleParam.fromJson(Map<String, dynamic> json) =>
      CreateRoleParam(
        label: json["Label"],
        actions: List<String>.from(json["Actions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Label": label,
        "Actions": List<dynamic>.from(actions.map((x) => x)),
      };
}
