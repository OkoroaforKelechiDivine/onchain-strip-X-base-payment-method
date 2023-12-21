class TvCableParam {
  final String serviceId;
  final String billersCode;
  final int amount;
  final String phone;
  final String subscriptionType;
  final String variationCode;

  TvCableParam({
    required this.serviceId,
    required this.billersCode,
    required this.amount,
    required this.phone,
    required this.subscriptionType,
    required this.variationCode,
  });

  factory TvCableParam.fromJson(Map<String, dynamic> json) => TvCableParam(
        serviceId: json["serviceID"],
        billersCode: json["billersCode"],
        amount: json["amount"],
        phone: json["phone"],
        subscriptionType: json["subscription_type"],
        variationCode: json["variation_code"],
      );

  Map<String, dynamic> toJson() => {
        "serviceID": serviceId,
        "billersCode": billersCode,
        "amount": amount,
        "phone": phone,
        "subscription_type": subscriptionType,
        "variation_code": variationCode,
      };
}
