class BankBeneficiaryListRes {
  final String fullName;
  final String bank;
  final String accountNumber;
  final String bankCode;
  final int userId;

  BankBeneficiaryListRes({
    required this.fullName,
    required this.bank,
    required this.accountNumber,
    required this.bankCode,
    required this.userId,
  });

  factory BankBeneficiaryListRes.fromJson(Map<String, dynamic> json) =>
      BankBeneficiaryListRes(
        fullName: json["FullName"],
        bank: json["Bank"],
        accountNumber: json["AccountNumber"],
        bankCode: json["BankCode"],
        userId: json["UserID"],
      );

  Map<String, dynamic> toJson() => {
        "FullName": fullName,
        "Bank": bank,
        "AccountNumber": accountNumber,
        "BankCode": bankCode,
        "UserID": userId,
      };
}
