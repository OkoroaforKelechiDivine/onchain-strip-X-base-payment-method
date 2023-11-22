class User {
  String? firstName;
  String? lastName;
  String? middleName;
  String? gender;

  User({this.firstName, this.lastName, this.middleName, this.gender, });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    gender = json['gender'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['middle_name'] = middleName;
    data['gender'] = gender;
    return data;
  }
}
