
class EnterPasscodeResponse {
  final String?  token;

  EnterPasscodeResponse({
    this.token
  });

  factory EnterPasscodeResponse.fromJson(Map<String, dynamic> json) => EnterPasscodeResponse(token: json["token"]);

  Map<String, dynamic> toJson() => {
    "token": token
  };
}
