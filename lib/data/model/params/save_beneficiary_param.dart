class SaveBeneficiaryParam {
  final String fullname;
  final String bank;
  final String bankCode;
  final String accountNumber;
  final int userId;

  SaveBeneficiaryParam({
    required this.fullname,
    required this.bank,
    required this.bankCode,
    required this.accountNumber,
    required this.userId,
  });

  factory SaveBeneficiaryParam.fromJson(Map<String, dynamic> json) =>
      SaveBeneficiaryParam(
        fullname: json["fullname"],
        bank: json["bank"],
        bankCode: json["bankCode"],
        accountNumber: json["accountNumber"],
        userId: json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "bank": bank,
        "bankCode": bankCode,
        "accountNumber": accountNumber,
        "userID": userId,
      };
}
