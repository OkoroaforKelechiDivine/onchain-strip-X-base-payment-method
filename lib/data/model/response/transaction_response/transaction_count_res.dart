class TransactionCountResponse {
  final int failedTransactionsCount;
  final int successfulTransactionCount;
  final int totalTransactionAmount;
  final int totalTransactionCount;

  TransactionCountResponse({
    required this.failedTransactionsCount,
    required this.successfulTransactionCount,
    required this.totalTransactionAmount,
    required this.totalTransactionCount,
  });

  factory TransactionCountResponse.fromJson(Map<String, dynamic> json) =>
      TransactionCountResponse(
        failedTransactionsCount: json["FailedTransactionsCount"],
        successfulTransactionCount: json["SuccessfulTransactionCount"],
        totalTransactionAmount: json["TotalTransactionAmount"],
        totalTransactionCount: json["TotalTransactionCount"],
      );

  Map<String, dynamic> toJson() => {
        "FailedTransactionsCount": failedTransactionsCount,
        "SuccessfulTransactionCount": successfulTransactionCount,
        "TotalTransactionAmount": totalTransactionAmount,
        "TotalTransactionCount": totalTransactionCount,
      };
}
