class CreateBusinessRes {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? businessName;
  final String? businessAddress;
  final String? businessEmail;
  final String? businessPhone;
  final bool? registered;
  final String? registrationNumber;
  final bool? accredited;
  final bool? active;
  final int? brmId;
  final int? aggregatorId;
  final String? businessType;
  final String? accountNumber;
  final String? accountName;
  final ContactPerson? contactPerson;
  final TransactionFee? transactionFee;
  final dynamic role;
  final dynamic outlet;

  CreateBusinessRes({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.businessName,
    required this.businessAddress,
    required this.businessEmail,
    required this.businessPhone,
    required this.registered,
    required this.registrationNumber,
    required this.accredited,
    required this.active,
    required this.brmId,
    required this.aggregatorId,
    required this.businessType,
    required this.accountNumber,
    required this.accountName,
    required this.contactPerson,
    required this.transactionFee,
    required this.role,
    required this.outlet,
  });

  factory CreateBusinessRes.fromJson(Map<String, dynamic> json) =>
      CreateBusinessRes(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        businessName: json["BusinessName"],
        businessAddress: json["BusinessAddress"],
        businessEmail: json["BusinessEmail"],
        businessPhone: json["BusinessPhone"],
        registered: json["Registered"],
        registrationNumber: json["RegistrationNumber"],
        accredited: json["Accredited"],
        active: json["Active"],
        brmId: json["BrmID"],
        aggregatorId: json["AggregatorID"],
        businessType: json["BusinessType"],
        accountNumber: json["AccountNumber"],
        accountName: json["AccountName"],
        contactPerson: ContactPerson.fromJson(json["ContactPerson"]),
        transactionFee: TransactionFee.fromJson(json["TransactionFee"]),
        role: json["Role"],
        outlet: json["Outlet"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "BusinessName": businessName,
        "BusinessAddress": businessAddress,
        "BusinessEmail": businessEmail,
        "BusinessPhone": businessPhone,
        "Registered": registered,
        "RegistrationNumber": registrationNumber,
        "Accredited": accredited,
        "Active": active,
        "BrmID": brmId,
        "AggregatorID": aggregatorId,
        "BusinessType": businessType,
        "AccountNumber": accountNumber,
        "AccountName": accountName,
        "ContactPerson": contactPerson?.toJson(),
        "TransactionFee": transactionFee?.toJson(),
        "Role": role,
        "Outlet": outlet,
      };
}

class ContactPerson {
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? gender;
  final String? dob;
  final String? idType;
  final String? bvn;
  final String? idNumber;

  ContactPerson({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.gender,
    required this.dob,
    required this.idType,
    required this.bvn,
    required this.idNumber,
  });

  factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
        firstName: json["FirstName"],
        lastName: json["LastName"],
        middleName: json["MiddleName"],
        gender: json["Gender"],
        dob: json["Dob"],
        idType: json["IdType"],
        bvn: json["Bvn"],
        idNumber: json["IdNumber"],
      );

  Map<String, dynamic> toJson() => {
        "FirstName": firstName,
        "LastName": lastName,
        "MiddleName": middleName,
        "Gender": gender,
        "Dob": dob,
        "IdType": idType,
        "Bvn": bvn,
        "IdNumber": idNumber,
      };
}

class TransactionFee {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? transfer;
  final int? withdrawal;
  final int? vat;
  final int? transferCap;
  final int? withdrawalCap;
  final bool? isSet;
  final int? businessId;

  TransactionFee({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.transfer,
    required this.withdrawal,
    required this.vat,
    required this.transferCap,
    required this.withdrawalCap,
    required this.isSet,
    required this.businessId,
  });

  factory TransactionFee.fromJson(Map<String, dynamic> json) => TransactionFee(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        transfer: json["Transfer"],
        withdrawal: json["Withdrawal"],
        vat: json["Vat"],
        transferCap: json["TransferCap"],
        withdrawalCap: json["WithdrawalCap"],
        isSet: json["IsSet"],
        businessId: json["BusinessID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "Transfer": transfer,
        "Withdrawal": withdrawal,
        "Vat": vat,
        "TransferCap": transferCap,
        "WithdrawalCap": withdrawalCap,
        "IsSet": isSet,
        "BusinessID": businessId,
      };
}
