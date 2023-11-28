class BuyAirtimeResponse {
  final String code;
  final String responseDescription;
  final String requestId;
  final String transactionId;
  final String amount;
  final TransactionDate transactionDate;
  final String purchasedCode;

  BuyAirtimeResponse({
    required this.code,
    required this.responseDescription,
    required this.requestId,
    required this.transactionId,
    required this.amount,
    required this.transactionDate,
    required this.purchasedCode,
  });

  factory BuyAirtimeResponse.fromJson(Map<String, dynamic> json) =>
      BuyAirtimeResponse(
        code: json["code"],
        responseDescription: json["response_description"],
        requestId: json["requestId"],
        transactionId: json["transactionId"],
        amount: json["amount"],
        transactionDate: TransactionDate.fromJson(json["transaction_date"]),
        purchasedCode: json["purchased_code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "response_description": responseDescription,
        "requestId": requestId,
        "transactionId": transactionId,
        "amount": amount,
        "transaction_date": transactionDate.toJson(),
        "purchased_code": purchasedCode,
      };
}

class TransactionDate {
  final DateTime date;
  final int timezoneType;
  final String timezone;

  TransactionDate({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  factory TransactionDate.fromJson(Map<String, dynamic> json) =>
      TransactionDate(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
