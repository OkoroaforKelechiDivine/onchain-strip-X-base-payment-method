class LoginResponse{
  final String?  token;

  LoginResponse({
    this.token
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(token: json["token"]);

  Map<String, dynamic> toJson() => {
    "token": token
  };
}

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
