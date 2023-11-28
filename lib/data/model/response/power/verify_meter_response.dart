class VerifyMeterResponse {
  final String code;
  final Content content;

  VerifyMeterResponse({
    required this.code,
    required this.content,
  });

  factory VerifyMeterResponse.fromJson(Map<String, dynamic> json) =>
      VerifyMeterResponse(
        code: json["code"],
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "content": content.toJson(),
      };
}

class Content {
  final String customerName;
  final int meterNumber;
  final String businessUnit;
  final String address;
  final String customerArrears;

  Content({
    required this.customerName,
    required this.meterNumber,
    required this.businessUnit,
    required this.address,
    required this.customerArrears,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        customerName: json["Customer_Name"],
        meterNumber: json["Meter_Number"],
        businessUnit: json["Business_Unit"],
        address: json["Address"],
        customerArrears: json["Customer_Arrears"],
      );

  Map<String, dynamic> toJson() => {
        "Customer_Name": customerName,
        "Meter_Number": meterNumber,
        "Business_Unit": businessUnit,
        "Address": address,
        "Customer_Arrears": customerArrears,
      };
}
