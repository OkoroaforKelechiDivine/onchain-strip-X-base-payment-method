class BankResponse {
  final int id;
  final String code;
  final String name;
  final String logo;
  final DateTime created;

  BankResponse({
    required this.id,
    required this.code,
    required this.name,
    required this.logo,
    required this.created,
  });

  factory BankResponse.fromJson(Map<String, dynamic> json) => BankResponse(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        logo: json["logo"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "logo": logo,
        "created": created.toIso8601String(),
      };
}
