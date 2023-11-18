class User {
  String? firstName;
  String? lastName;
  String? middleName;
  String? gender;

  User({this.firstName, this.lastName, this.middleName, this.gender, });

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middle_name'];
    gender = json['gender'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middle_name'] = middleName;
    data['gender'] = gender;
    return data;
  }
}
