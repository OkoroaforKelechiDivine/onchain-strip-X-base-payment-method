class User {
  String? firstName;
  String? lastName;
  String? email;
  String? role;

  User({this.firstName, this.lastName, this.email, this.role, });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
