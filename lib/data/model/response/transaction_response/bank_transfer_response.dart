class BankTransferResponse {
  final int? amount;
  final String? txnId;
  final String? sessionId;
  final String? reference;

  BankTransferResponse({
    this.amount,
    this.txnId,
    this.sessionId,
    this.reference,
  });

  factory BankTransferResponse.fromJson(Map<String, dynamic> json) =>
      BankTransferResponse(
        amount: json["amount"],
        txnId: json["txnId"],
        sessionId: json["sessionId"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "txnId": txnId,
        "sessionId": sessionId,
        "reference": reference,
      };
}
