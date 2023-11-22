class SignUpParam {
    final String username;
    final String password;
    final String firstName;
    final String lastName;
    final String email;
    final String business;
    final String role;

    SignUpParam({
        required this.username,
        required this.password,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.business,
        required this.role,
    });

    factory SignUpParam.fromJson(Map<String, dynamic> json) => SignUpParam(
        username: json["username"],
        password: json["password"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        business: json["business"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "business": business,
        "role": role,
    };
}
