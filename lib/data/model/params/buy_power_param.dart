class BuyPowerParam {
  final String serviceId;
  final String billersCode;
  final String variationCode;
  final int amount;
  final String phone;

  BuyPowerParam({
    required this.serviceId,
    required this.billersCode,
    required this.variationCode,
    required this.amount,
    required this.phone,
  });

  factory BuyPowerParam.fromJson(Map<String, dynamic> json) => BuyPowerParam(
        serviceId: json["serviceID"],
        billersCode: json["billersCode"],
        variationCode: json["variation_code"],
        amount: json["amount"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "serviceID": serviceId,
        "billersCode": billersCode,
        "variation_code": variationCode,
        "amount": amount,
        "phone": phone,
      };
}
