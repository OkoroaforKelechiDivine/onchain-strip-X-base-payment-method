import 'package:pay_me_mobile/core/utilities/general_util.dart';

class TransactionResponse {
  final String? statusCode;
  final int? amount;
  final String? originatorAccountNumber;
  final String? originatorAccountName;
  final String? originatorBank;
  final String? beneficiaryAccountNumber;
  final String? beneficiaryAccountName;
  final String? beneficiaryBank;
  final DateTime? timeStamp;
  final String? transactionNarration;
  final String? transactionStatus;
  final String? cardType;
  final String? terminalId;
  final String? rrn;
  final String? transactionType;
  final String? pan;
  final String? statusDescription;
  final String? stan;
  final String? transactionDate;
  final String? cardExpiry;
  final String? transactionId;
  final String? purchaseCode;
  final String? businessName;

  TransactionResponse({
    required this.statusCode,
    required this.amount,
    required this.originatorAccountNumber,
    required this.originatorAccountName,
    required this.originatorBank,
    required this.beneficiaryAccountNumber,
    required this.beneficiaryAccountName,
    required this.beneficiaryBank,
    required this.timeStamp,
    required this.transactionNarration,
    required this.transactionStatus,
    required this.cardType,
    required this.terminalId,
    required this.rrn,
    required this.transactionType,
    required this.pan,
    required this.statusDescription,
    required this.stan,
    required this.transactionDate,
    required this.cardExpiry,
    required this.transactionId,
    required this.purchaseCode,
    required this.businessName,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        statusCode: json["status_code"],
        amount: json["amount"],
        originatorAccountNumber: json["originator_account_number"],
        originatorAccountName: json["originator_account_name"],
        originatorBank: json["originator_bank"],
        beneficiaryAccountNumber: json["beneficiary_account_number"],
        beneficiaryAccountName: json["beneficiary_account_name"],
        beneficiaryBank: json["beneficiary_bank"],
        timeStamp: parseDateTime(json["time_stamp"].toString()),
        transactionNarration: json["transaction_narration"],
        transactionStatus: json["transaction_status"],
        cardType: json["card_type"],
        terminalId: json["terminal_id"],
        rrn: json["rrn"],
        transactionType: json["transaction_type"],
        pan: json["pan"],
        statusDescription: json["status_description"],
        stan: json["stan"],
        transactionDate: json["transaction_date"],
        cardExpiry: json["card_expiry"],
        transactionId: json["transaction_id"],
        purchaseCode: json["purchase_code"],
        businessName: json["business_name"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "amount": amount,
        "originator_account_number": originatorAccountNumber,
        "originator_account_name": originatorAccountName,
        "originator_bank": originatorBank,
        "beneficiary_account_number": beneficiaryAccountNumber,
        "beneficiary_account_name": beneficiaryAccountName,
        "beneficiary_bank": beneficiaryBank,
        "time_stamp": timeStamp != null ? timeStamp!.toIso8601String() : null,
        "transaction_narration": transactionNarration,
        "transaction_status": transactionStatus,
        "card_type": cardType,
        "terminal_id": terminalId,
        "rrn": rrn,
        "transaction_type": transactionType,
        "pan": pan,
        "status_description": statusDescription,
        "stan": stan,
        "transaction_date": transactionDate,
        "card_expiry": cardExpiry,
        "transaction_id": transactionId,
        "purchase_code": purchaseCode,
        "business_name": businessName,
      };
}
