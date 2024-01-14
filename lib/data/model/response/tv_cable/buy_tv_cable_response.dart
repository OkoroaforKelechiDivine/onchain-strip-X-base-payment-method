class TvCableResponse {
  final String code;
  final Content content;
  final String responseDescription;
  final String requestId;
  final String amount;
  final TransactionDate transactionDate;
  final String purchasedCode;

  TvCableResponse({
    required this.code,
    required this.content,
    required this.responseDescription,
    required this.requestId,
    required this.amount,
    required this.transactionDate,
    required this.purchasedCode,
  });

  factory TvCableResponse.fromJson(Map<String, dynamic> json) =>
      TvCableResponse(
        code: json["code"],
        content: Content.fromJson(json["content"]),
        responseDescription: json["response_description"],
        requestId: json["requestId"],
        amount: json["amount"],
        transactionDate: TransactionDate.fromJson(json["transaction_date"]),
        purchasedCode: json["purchased_code"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "content": content.toJson(),
        "response_description": responseDescription,
        "requestId": requestId,
        "amount": amount,
        "transaction_date": transactionDate.toJson(),
        "purchased_code": purchasedCode,
      };
}

class Content {
  final Transactions transactions;

  Content({
    required this.transactions,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        transactions: Transactions.fromJson(json["transactions"]),
      );

  Map<String, dynamic> toJson() => {
        "transactions": transactions.toJson(),
      };
}

class Transactions {
  final String status;
  final String channel;
  final String transactionId;
  final String method;
  final String platform;
  final int isApi;
  final dynamic discount;
  final int customerId;
  final String email;
  final String phone;
  final String type;
  final int convinienceFee;
  final int commission;
  final int amount;
  final int quantity;
  final int unitPrice;
  final String updatedAt;
  final String createdAt;
  final int id;

  Transactions({
    required this.status,
    required this.channel,
    required this.transactionId,
    required this.method,
    required this.platform,
    required this.isApi,
    required this.discount,
    required this.customerId,
    required this.email,
    required this.phone,
    required this.type,
    required this.convinienceFee,
    required this.commission,
    required this.amount,
    required this.quantity,
    required this.unitPrice,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        status: json["status"],
        channel: json["channel"],
        transactionId: json["transactionId"],
        method: json["method"],
        platform: json["platform"],
        isApi: json["is_api"],
        discount: json["discount"],
        customerId: json["customer_id"],
        email: json["email"],
        phone: json["phone"],
        type: json["type"],
        convinienceFee: json["convinience_fee"],
        commission: json["commission"],
        amount: json["amount"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "channel": channel,
        "transactionId": transactionId,
        "method": method,
        "platform": platform,
        "is_api": isApi,
        "discount": discount,
        "customer_id": customerId,
        "email": email,
        "phone": phone,
        "type": type,
        "convinience_fee": convinienceFee,
        "commission": commission,
        "amount": amount,
        "quantity": quantity,
        "unit_price": unitPrice,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
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
