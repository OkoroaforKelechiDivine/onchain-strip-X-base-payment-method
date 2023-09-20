
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pay_me_mobile/data/utilities/secure_storage/secure_storage_string_constants.dart';

class SecureStorageInit {
  static late FlutterSecureStorage storage;

  static late String? passCode;
  static late String? firstName;
  static late String? countryCode;

  static initSecureStorage() async {
    AndroidOptions androidOption() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

    IOSOptions iosOptions() =>
        const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

    storage =
        FlutterSecureStorage(aOptions: androidOption(), iOptions: iosOptions());

    ///fetch user auth data
    initAuthData();
  }

  ///fetch user auth data
  static initAuthData() async {
    passCode = await storage.read(key: SecuredStorageStringConstants.passCode);
    firstName = await storage.read(key: SecuredStorageStringConstants.firstName);
  }
}
