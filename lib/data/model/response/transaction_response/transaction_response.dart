class TransactionResponse {
  final String? statusCode;
  final String? message;
  final int? amount;
  final String? accountNumber;
  final String? originatorAccountNumber;
  final String? originatorAccountName;
  final String? originatorBank;
  final String? transactionNarration;
  final String? timeStamp;
  final String? transactionStatus;
  final String? reference;
  final String? serialNumber;
  final String? cartType;
  final String? terminalId;
  final String? rrn;
  final String? transactionType;
  final String? pan;
  final String? statusDescription;
  final String? merchantId;
  final String? stan;
  final String? transactionDate;
  final String? cardExpiry;
  final String? sessionId;
  final String? transactionId;
  final String? balanceBeforeTransaction;
  final String? balanceAfterTransaction;

  TransactionResponse({
    this.statusCode,
    this.message,
    this.amount,
    this.accountNumber,
    this.originatorAccountNumber,
    this.originatorAccountName,
    this.originatorBank,
    this.transactionNarration,
    this.timeStamp,
    this.transactionStatus,
    this.reference,
    this.serialNumber,
    this.cartType,
    this.terminalId,
    this.rrn,
    this.transactionType,
    this.pan,
    this.statusDescription,
    this.merchantId,
    this.stan,
    this.transactionDate,
    this.cardExpiry,
    this.sessionId,
    this.transactionId,
    this.balanceBeforeTransaction,
    this.balanceAfterTransaction,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        statusCode: json["status_code"],
        message: json["message"],
        amount: json["amount"],
        accountNumber: json["account_number"],
        originatorAccountNumber: json["originator_account_number"],
        originatorAccountName: json["originator_account_name"],
        originatorBank: json["originator_bank"],
        transactionNarration: json["transaction_narration"],
        timeStamp: json["time_stamp"],
        transactionStatus: json["transaction_status"],
        reference: json["reference"],
        serialNumber: json["serial_number"],
        cartType: json["cart_type"],
        terminalId: json["terminal_id"],
        rrn: json["rrn"],
        transactionType: json["transaction_type"],
        pan: json["pan"],
        statusDescription: json["status_description"],
        merchantId: json["merchant_id"],
        stan: json["stan"],
        transactionDate: json["transaction_date"],
        cardExpiry: json["card_expiry"],
        sessionId: json["session_id"],
        transactionId: json["transaction_id"],
        balanceBeforeTransaction: json["balance_before_transaction"],
        balanceAfterTransaction: json["balance_after_transaction"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "amount": amount,
        "account_number": accountNumber,
        "originator_account_number": originatorAccountNumber,
        "originator_account_name": originatorAccountName,
        "originator_bank": originatorBank,
        "transaction_narration": transactionNarration,
        "time_stamp": timeStamp,
        "transaction_status": transactionStatus,
        "reference": reference,
        "serial_number": serialNumber,
        "cart_type": cartType,
        "terminal_id": terminalId,
        "rrn": rrn,
        "transaction_type": transactionType,
        "pan": pan,
        "status_description": statusDescription,
        "merchant_id": merchantId,
        "stan": stan,
        "transaction_date": transactionDate,
        "card_expiry": cardExpiry,
        "session_id": sessionId,
        "transaction_id": transactionId,
        "balance_before_transaction": balanceBeforeTransaction,
        "balance_after_transaction": balanceAfterTransaction,
      };
}
