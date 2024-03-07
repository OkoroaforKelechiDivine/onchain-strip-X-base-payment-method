class CreateBusinessParam {
  final String businessName;
  final String businessAddress;
  final String businessEmail;
  final String businessPhone;
  final bool registered;
  final String? registrationNumber;
  final String? registrationDate;
  final String businessType;
  final String firstname;
  final String lastname;
  final String middlename;
  final String username;
  final String dob;
  final String gender;
  final String bvn;

  CreateBusinessParam({
    required this.businessName,
    required this.businessAddress,
    required this.businessEmail,
    required this.businessPhone,
    required this.registered,
    this.registrationNumber,
    this.registrationDate,
    required this.businessType,
    required this.firstname,
    required this.lastname,
    required this.middlename,
    required this.username,
    required this.dob,
    required this.gender,
    required this.bvn,
  });

  factory CreateBusinessParam.fromJson(Map<String, dynamic> json) =>
      CreateBusinessParam(
        businessName: json["business_name"],
        businessAddress: json["business_address"],
        businessEmail: json["business_email"],
        businessPhone: json["business_phone"],
        registered: json["registered"],
        registrationNumber: json["registration_number"],
        registrationDate: json["registration_date"],
        businessType: json["business_type"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        middlename: json["middlename"],
        username: json["username"],
        dob: json["dob"],
        gender: json["gender"],
        bvn: json["bvn"],
      );

  Map<String, dynamic> toJson() => {
        "business_name": businessName,
        "business_address": businessAddress,
        "business_email": businessEmail,
        "business_phone": businessPhone,
        "registered": registered,
        "registration_number": registrationNumber,
        "registration_date": registrationDate,
        "business_type": businessType,
        "firstname": firstname,
        "lastname": lastname,
        "middlename": middlename,
        "username": username,
        "dob": dob,
        "gender": gender,
        "bvn": bvn,
      };
}
