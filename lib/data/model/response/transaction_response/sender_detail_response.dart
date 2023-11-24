class SenderDetailsResponse {
  final String accountNo;
  final String accountBalance;
  final String accountId;
  final String client;
  final String clientId;
  final String savingsProductName;

  SenderDetailsResponse({
    this.accountNo = "1001589285",
    this.accountBalance = "1000000.000000",
    this.accountId = "158928",
    this.client = "PayMe",
    this.clientId = "142713",
    this.savingsProductName = "Corporate Current Account",
  });

  factory SenderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      SenderDetailsResponse(
        accountNo: json["accountNo"],
        accountBalance: json["accountBalance"],
        accountId: json["accountId"],
        client: json["client"],
        clientId: json["clientId"],
        savingsProductName: json["savingsProductName"],
      );

  Map<String, dynamic> toJson() => {
        "accountNo": accountNo,
        "accountBalance": accountBalance,
        "accountId": accountId,
        "client": client,
        "clientId": clientId,
        "savingsProductName": savingsProductName,
      };
}
