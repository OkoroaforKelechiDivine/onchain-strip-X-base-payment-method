

import 'package:pay_me_mobile/data/utilities/secure_storage/secure_storage_init.dart';
import 'package:pay_me_mobile/data/utilities/secure_storage/secure_storage_string_constants.dart';

class SecureStorageUtils{

  ///retrieve phone number
  // static Future<String?> retrievePhoneNumber() async{
  //   return SecureStorageInit.storage.read(key: SecuredStorageStringConstants.phoneNumber);
  // }

  ///save phone number
  // static savePhoneNumber({required String phoneNumber}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.phoneNumber, value: phoneNumber);
  //   SecureStorageInit.phoneNumber = phoneNumber;
  // }

  ///retrieve raw phone number
  // static Future<String?> retrieveRawPhoneNumber() async{
  //   return SecureStorageInit.storage.read(key: SecuredStorageStringConstants.rawPhoneNumber);
  // }

  ///save raw phone number
  // static saveRawPhoneNumber({required String rawPhoneNumber}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.rawPhoneNumber, value: rawPhoneNumber);
  //   SecureStorageInit.rawPhoneNumber = rawPhoneNumber;
  // }

  ///retrieve country code
  // static Future<String?> retrieveCountryCode() async{
  //   return SecureStorageInit.storage.read(key: SecuredStorageStringConstants.countryCode);
  // }

  ///save raw phone number
  // static saveCountryCode({required String countryCode}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.countryCode, value: countryCode);
  //   SecureStorageInit.countryCode = countryCode;
  // }

  ///retrieve passcode
  static Future<String?> retrievePasscode() async{
    return SecureStorageInit.storage.read(key: SecuredStorageStringConstants.passCode);
  }

  ///delete passcode
  static deletePasscode() async{
    SecureStorageInit.storage.delete(key:SecuredStorageStringConstants.passCode);
    SecureStorageInit.passCode = null;
  }

  ///save passcode
  static savePasscode({required String passcode}) async{
    SecureStorageInit.storage.write(key: SecuredStorageStringConstants.passCode, value: passcode);
    SecureStorageInit.passCode = passcode;
  }

  ///retrieve password
  // static Future<String?> retrievePassword() async{
  //   return SecureStorageInit.storage.read(key: SecuredStorageStringConstants.passWord);
  // }

  ///save passcode
  // static savePassword({required String password}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.passWord, value: password);
  //   SecureStorageInit.passWord = password;
  // }

  ///retrieve token
  static Future<String?> retrieveToken() async{
    return SecureStorageInit.storage.read(key: SecuredStorageStringConstants.token);
  }

  ///save passcode
  static saveToken({required String token}) async{
    SecureStorageInit.storage.write(key: SecuredStorageStringConstants.token, value: token);
  }

  ///save passcode trial count to secure storage
  // static savePassCodeTrial(int numberOfAttempts) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.passCodeTrials, value: numberOfAttempts.toString(), );
  // }

  ///retrieve passcode trial
  // static Future<int?> retrievePasscodeTrials() async{
  //   final String? _attemptCount = await SecureStorageInit.storage.read(key: SecuredStorageStringConstants.passCodeTrials);
  //   if(_attemptCount != null)
  //     return int.tryParse(_attemptCount);
  //
  //   return 0;
  // }

  ///save user's biometric preference
  // static saveBiometricPreference({required bool preference}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.useBiometrics, value: preference ? 'true':'false', );
  //   SecureStorageInit.useBiometrics = preference;
  // }

  ///retrieve user's biometric preference
  // static Future<bool> retrieveBiometricPreference() async{
  //   final String? _biometricPreference = await SecureStorageInit.storage.read(key: SecuredStorageStringConstants.useBiometrics);
  //   if(_biometricPreference != null)
  //     return _biometricPreference == 'true' ? true : false;
  //
  //   return false;
  // }

  ///save user's account balance(S) visibility preference
  // static saveHomeAcctBalSummaryPref({required String preferences}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.balanceVisibility, value: preferences,);
  // }

  ///retrieve account balance prefs
  // static Future<String?> retrieveHomeBalSummaryPref() async{
  //   return SecureStorageInit.storage.read(key: SecuredStorageStringConstants.balanceVisibility);
  // }

  ///delete account balance prefs
  // static deleteHomeAccountBalanceVisibilityPrefs() async{
  //   SecureStorageInit.storage.delete(key:SecuredStorageStringConstants.balanceVisibility);
  // }

  ///save user first name
  static saveFirstName({required String firstName}) async{
    SecureStorageInit.storage.write(key: SecuredStorageStringConstants.firstName, value: firstName);
    SecureStorageInit.firstName = firstName;
  }

  ///save user display picture
  // static saveDisplayPicture({required String avatar}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.displayPicture, value: avatar);
  //   SecureStorageInit.displayPicture = avatar;
  // }

  ///save user's accounts balance visibility pref
  // static saveAccountsBalanceVisibilityPref({required bool preference}) async{
  //   SecureStorageInit.storage.write(key: SecuredStorageStringConstants.accountsBalanceVisibility, value: preference ? 'true':'false', );
  // }

  ///retrieve user's accounts balance visibility pref
  // static Future<bool> retrieveAccountsBalanceVisibilityPref() async{
  //   final String? _pref = await SecureStorageInit.storage.read(key: SecuredStorageStringConstants.accountsBalanceVisibility);
  //   if(_pref != null)
  //     return _pref == 'true' ? true : false;
  //
  //   return true;
  // }

  ///delete all records
  static deleteAll() async{
    SecureStorageInit.storage.deleteAll();
  }


}