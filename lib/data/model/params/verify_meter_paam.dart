class VerifyMeterParam {
  final int billersCode;
  final String serviceId;
  final String type;

  VerifyMeterParam({
    required this.billersCode,
    required this.serviceId,
    required this.type,
  });

  factory VerifyMeterParam.fromJson(Map<String, dynamic> json) =>
      VerifyMeterParam(
        billersCode: json["billersCode"],
        serviceId: json["serviceID"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "billersCode": billersCode,
        "serviceID": serviceId,
        "type": type,
      };
}
