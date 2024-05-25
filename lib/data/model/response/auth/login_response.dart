class LoginResponse {
  String? token;

  LoginResponse({
    this.token,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = token;
    return data;
  }
}
