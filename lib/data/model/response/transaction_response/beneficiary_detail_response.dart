class BeneficiaryDetailResponse {
  final String name;
  final String clientId;
  final String bvn;
  final Account account;
  final String status;
  final String currency;
  final String bank;

  BeneficiaryDetailResponse({
    required this.name,
    required this.clientId,
    required this.bvn,
    required this.account,
    required this.status,
    required this.currency,
    required this.bank,
  });

  factory BeneficiaryDetailResponse.fromJson(Map<String, dynamic> json) =>
      BeneficiaryDetailResponse(
        name: json["name"],
        clientId: json["clientId"],
        bvn: json["bvn"],
        account: Account.fromJson(json["account"]),
        status: json["status"],
        currency: json["currency"],
        bank: json["bank"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "clientId": clientId,
        "bvn": bvn,
        "account": account.toJson(),
        "status": status,
        "currency": currency,
        "bank": bank,
      };
}

class Account {
  final String number;
  final String id;

  Account({
    required this.number,
    required this.id,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        number: json["number"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "id": id,
      };
}
