class AppResponse{
  final String?  token;

  AppResponse({
    this.token
  });

  factory AppResponse.fromJson(Map<String, dynamic> json) => AppResponse(token: json["token"]);

  Map<String, dynamic> toJson() => {
    "token": token
  };
}
