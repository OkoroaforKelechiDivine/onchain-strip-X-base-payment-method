class InflowResponse {
  final String statusCode;
  final int amount;
  final String originatorAccountNumber;
  final String originatorAccountName;
  final String originatorBank;
  final String timeStamp;
  final String transactionStatus;
  final String statusDescription;
  final String transactionId;

  InflowResponse({
    required this.statusCode,
    required this.amount,
    required this.originatorAccountNumber,
    required this.originatorAccountName,
    required this.originatorBank,
    required this.timeStamp,
    required this.transactionStatus,
    required this.statusDescription,
    required this.transactionId,
  });

  factory InflowResponse.fromJson(Map<String, dynamic> json) => InflowResponse(
        statusCode: json["status_code"],
        amount: json["amount"],
        originatorAccountNumber: json["originator_account_number"],
        originatorAccountName: json["originator_account_name"],
        originatorBank: json["originator_bank"],
        timeStamp: json["time_stamp"],
        transactionStatus: json["transaction_status"],
        statusDescription: json["status_description"],
        transactionId: json["transaction_id"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "amount": amount,
        "originator_account_number": originatorAccountNumber,
        "originator_account_name": originatorAccountName,
        "originator_bank": originatorBank,
        "time_stamp": timeStamp,
        "transaction_status": transactionStatus,
        "status_description": statusDescription,
        "transaction_id": transactionId,
      };
}
