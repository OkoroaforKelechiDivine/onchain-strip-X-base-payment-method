class BankTransferParam {
  final String fromAccount;
  final String fromClientId;
  final String fromClient;
  final String fromSavingsId;
  final String? fromBvn;
  final String toClientId;
  final String toClient;
  final String toSavingsId;
  final String toSession;
  final String toKyc;
  final String? toBvn;
  final String toAccount;
  final String toBank;
  final String amount;
  final String remark;
  final String transferType;

  BankTransferParam({
    required this.fromAccount,
    required this.fromClientId,
    required this.fromClient,
    required this.fromSavingsId,
    this.fromBvn,
    required this.toClientId,
    required this.toClient,
    required this.toSavingsId,
    required this.toSession,
    required this.toKyc,
    this.toBvn,
    required this.toAccount,
    required this.toBank,
    required this.amount,
    required this.remark,
    required this.transferType,
  });

  factory BankTransferParam.fromJson(Map<String, dynamic> json) =>
      BankTransferParam(
        fromAccount: json["fromAccount"],
        fromClientId: json["fromClientId"],
        fromClient: json["fromClient"],
        fromSavingsId: json["fromSavingsId"],
        fromBvn: json["fromBvn"],
        toClientId: json["toClientId"],
        toClient: json["toClient"],
        toSavingsId: json["toSavingsId"],
        toSession: json["toSession"],
        toKyc: json["toKyc"],
        toBvn: json["toBvn"],
        toAccount: json["toAccount"],
        toBank: json["toBank"],
        amount: json["amount"],
        remark: json["remark"],
        transferType: json["transferType"],
      );

  Map<String, dynamic> toJson() => {
        "fromAccount": fromAccount,
        "fromClientId": fromClientId,
        "fromClient": fromClient,
        "fromSavingsId": fromSavingsId,
        "fromBvn": fromBvn,
        "toClientId": toClientId,
        "toClient": toClient,
        "toSavingsId": toSavingsId,
        "toSession": toSession,
        "toKyc": toKyc,
        "toBvn": toBvn,
        "toAccount": toAccount,
        "toBank": toBank,
        "amount": amount,
        "remark": remark,
        "transferType": transferType,
      };
}
