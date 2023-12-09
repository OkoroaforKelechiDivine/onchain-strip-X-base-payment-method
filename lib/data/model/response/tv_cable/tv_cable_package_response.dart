class TvCablePackageResponse {
  final String fixedPrice;
  final String name;
  final String variationAmount;
  final String variationCode;

  TvCablePackageResponse({
    required this.fixedPrice,
    required this.name,
    required this.variationAmount,
    required this.variationCode,
  });

  factory TvCablePackageResponse.fromJson(Map<String, dynamic> json) =>
      TvCablePackageResponse(
        fixedPrice: json["fixedPrice"],
        name: json["name"],
        variationAmount: json["variation_amount"],
        variationCode: json["variation_code"],
      );

  Map<String, dynamic> toJson() => {
        "fixedPrice": fixedPrice,
        "name": name,
        "variation_amount": variationAmount,
        "variation_code": variationCode,
      };
}
