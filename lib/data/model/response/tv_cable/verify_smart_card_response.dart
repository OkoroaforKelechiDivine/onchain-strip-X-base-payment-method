class VerifySmartCardResponse {
  final String customerName;
  final String status;
  final String dueDate;
  final int customerNumber;
  final String customerType;
  final String currentBouquet;
  final String currentBouquetCode;
  final int renewalAmount;

  VerifySmartCardResponse({
    required this.customerName,
    required this.status,
    required this.dueDate,
    required this.customerNumber,
    required this.customerType,
    required this.currentBouquet,
    required this.currentBouquetCode,
    required this.renewalAmount,
  });

  factory VerifySmartCardResponse.fromJson(Map<String, dynamic> json) =>
      VerifySmartCardResponse(
        customerName: json["Customer_Name"],
        status: json["Status"],
        dueDate: json["DUE_DATE"],
        customerNumber: json["Customer_Number"],
        customerType: json["Customer_Type"],
        currentBouquet: json["Current_Bouquet"],
        currentBouquetCode: json["Current_Bouquet_Code"],
        renewalAmount: json["Renewal_Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Customer_Name": customerName,
        "Status": status,
        "DUE_DATE": dueDate,
        "Customer_Number": customerNumber,
        "Customer_Type": customerType,
        "Current_Bouquet": currentBouquet,
        "Current_Bouquet_Code": currentBouquetCode,
        "Renewal_Amount": renewalAmount,
      };
}
