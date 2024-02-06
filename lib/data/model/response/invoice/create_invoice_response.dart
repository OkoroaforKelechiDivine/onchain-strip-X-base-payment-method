class CreateCustomerResponse {
  final String message;

  CreateCustomerResponse({
    required this.message,
  });

  factory CreateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      CreateCustomerResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
