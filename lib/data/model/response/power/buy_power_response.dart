// To parse this JSON data, do
//
//     final buyPowerResponse = buyPowerResponseFromJson(jsonString);

import 'dart:convert';

BuyPowerResponse buyPowerResponseFromJson(String str) =>
    BuyPowerResponse.fromJson(json.decode(str));

String buyPowerResponseToJson(BuyPowerResponse data) =>
    json.encode(data.toJson());

class BuyPowerResponse {
  final String code;
  final Content content;
  final String responseDescription;
  final String requestId;
  final String amount;
  final TransactionDate transactionDate;
  final String purchasedCode;
  final String mainToken;
  final String mainTokenDescription;
  final int mainTokenUnits;
  final int mainTokenTax;
  final int mainsTokenAmount;
  final String bonusToken;
  final String bonusTokenDescription;
  final int bonusTokenUnits;
  final int bonusTokenTax;
  final int bonusTokenAmount;
  final String tariffIndex;
  final String debtDescription;

  BuyPowerResponse({
    required this.code,
    required this.content,
    required this.responseDescription,
    required this.requestId,
    required this.amount,
    required this.transactionDate,
    required this.purchasedCode,
    required this.mainToken,
    required this.mainTokenDescription,
    required this.mainTokenUnits,
    required this.mainTokenTax,
    required this.mainsTokenAmount,
    required this.bonusToken,
    required this.bonusTokenDescription,
    required this.bonusTokenUnits,
    required this.bonusTokenTax,
    required this.bonusTokenAmount,
    required this.tariffIndex,
    required this.debtDescription,
  });

  factory BuyPowerResponse.fromJson(Map<String, dynamic> json) =>
      BuyPowerResponse(
        code: json["code"],
        content: Content.fromJson(json["content"]),
        responseDescription: json["response_description"],
        requestId: json["requestId"],
        amount: json["amount"],
        transactionDate: TransactionDate.fromJson(json["transaction_date"]),
        purchasedCode: json["purchased_code"],
        mainToken: json["mainToken"],
        mainTokenDescription: json["mainTokenDescription"],
        mainTokenUnits: json["mainTokenUnits"],
        mainTokenTax: json["mainTokenTax"],
        mainsTokenAmount: json["mainsTokenAmount"],
        bonusToken: json["bonusToken"],
        bonusTokenDescription: json["bonusTokenDescription"],
        bonusTokenUnits: json["bonusTokenUnits"],
        bonusTokenTax: json["bonusTokenTax"],
        bonusTokenAmount: json["bonusTokenAmount"],
        tariffIndex: json["tariffIndex"],
        debtDescription: json["debtDescription"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "content": content.toJson(),
        "response_description": responseDescription,
        "requestId": requestId,
        "amount": amount,
        "transaction_date": transactionDate.toJson(),
        "purchased_code": purchasedCode,
        "mainToken": mainToken,
        "mainTokenDescription": mainTokenDescription,
        "mainTokenUnits": mainTokenUnits,
        "mainTokenTax": mainTokenTax,
        "mainsTokenAmount": mainsTokenAmount,
        "bonusToken": bonusToken,
        "bonusTokenDescription": bonusTokenDescription,
        "bonusTokenUnits": bonusTokenUnits,
        "bonusTokenTax": bonusTokenTax,
        "bonusTokenAmount": bonusTokenAmount,
        "tariffIndex": tariffIndex,
        "debtDescription": debtDescription,
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
  final int amount;
  final int convinienceFee;
  final String status;
  final String name;
  final String phone;
  final String email;
  final String type;
  final String createdAt;
  final String discount;
  final String giftcardId;
  final int totalAmount;
  final int commission;
  final String channel;
  final String platform;
  final String serviceVerification;
  final int quantity;
  final int unitPrice;
  final String uniqueElement;
  final String productName;

  Transactions({
    required this.amount,
    required this.convinienceFee,
    required this.status,
    required this.name,
    required this.phone,
    required this.email,
    required this.type,
    required this.createdAt,
    required this.discount,
    required this.giftcardId,
    required this.totalAmount,
    required this.commission,
    required this.channel,
    required this.platform,
    required this.serviceVerification,
    required this.quantity,
    required this.unitPrice,
    required this.uniqueElement,
    required this.productName,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        amount: json["amount"],
        convinienceFee: json["convinience_fee"],
        status: json["status"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        type: json["type"],
        createdAt: json["created_at"],
        discount: json["discount"],
        giftcardId: json["giftcard_id"],
        totalAmount: json["total_amount"],
        commission: json["commission"],
        channel: json["channel"],
        platform: json["platform"],
        serviceVerification: json["service_verification"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        uniqueElement: json["unique_element"],
        productName: json["product_name"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "convinience_fee": convinienceFee,
        "status": status,
        "name": name,
        "phone": phone,
        "email": email,
        "type": type,
        "created_at": createdAt,
        "discount": discount,
        "giftcard_id": giftcardId,
        "total_amount": totalAmount,
        "commission": commission,
        "channel": channel,
        "platform": platform,
        "service_verification": serviceVerification,
        "quantity": quantity,
        "unit_price": unitPrice,
        "unique_element": uniqueElement,
        "product_name": productName,
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
