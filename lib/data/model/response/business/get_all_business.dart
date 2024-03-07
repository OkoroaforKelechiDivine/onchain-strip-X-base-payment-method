class GetBusinessLisRes {
  final int id;
  final DateTime createdAt;
  final String businessName;
  final String businessAddress;
  final String businessEmail;
  final String businessPhone;
  final bool registered;
  final String registrationNumber;
  final bool accredited;
  final bool active;
  final String brm;
  final String aggregator;
  final String businessType;
  final String accountNumber;
  final String accountName;
  final String consentUrl;
  final String username;
  final ContactPerson contactPerson;

  GetBusinessLisRes({
    required this.id,
    required this.createdAt,
    required this.businessName,
    required this.businessAddress,
    required this.businessEmail,
    required this.businessPhone,
    required this.registered,
    required this.registrationNumber,
    required this.accredited,
    required this.active,
    required this.brm,
    required this.aggregator,
    required this.businessType,
    required this.accountNumber,
    required this.accountName,
    required this.consentUrl,
    required this.username,
    required this.contactPerson,
  });

  factory GetBusinessLisRes.fromJson(Map<String, dynamic> json) =>
      GetBusinessLisRes(
        id: json["ID"],
        createdAt: DateTime.parse(json["createdAt"]),
        businessName: json["business_name"],
        businessAddress: json["business_address"],
        businessEmail: json["business_email"],
        businessPhone: json["business_phone"],
        registered: json["registered"],
        registrationNumber: json["registration_number"],
        accredited: json["accredited"],
        active: json["active"],
        brm: json["brm"],
        aggregator: json["aggregator"],
        businessType: json["businessType"],
        accountNumber: json["accountNumber"],
        accountName: json["AccountName"],
        consentUrl: json["consent_url"],
        username: json["username"],
        contactPerson: ContactPerson.fromJson(json["ContactPerson"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "createdAt": createdAt.toIso8601String(),
        "business_name": businessName,
        "business_address": businessAddress,
        "business_email": businessEmail,
        "business_phone": businessPhone,
        "registered": registered,
        "registration_number": registrationNumber,
        "accredited": accredited,
        "active": active,
        "brm": brm,
        "aggregator": aggregator,
        "businessType": businessType,
        "accountNumber": accountNumber,
        "AccountName": accountName,
        "consent_url": consentUrl,
        "username": username,
        "ContactPerson": contactPerson.toJson(),
      };
}

class ContactPerson {
  final String firstName;
  final String lastName;
  final String middleName;
  final String gender;
  final String dob;
  final String bvn;

  ContactPerson({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.gender,
    required this.dob,
    required this.bvn,
  });

  factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
        firstName: json["FirstName"],
        lastName: json["LastName"],
        middleName: json["MiddleName"],
        gender: json["Gender"],
        dob: json["Dob"],
        bvn: json["Bvn"],
      );

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "MiddleName": middleName,
        "Gender": gender,
        "Dob": dob,
        "Bvn": bvn,
      };
}
