import 'package:hive/hive.dart';
import 'package:pay_me_mobile/core/states/app_state.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';

import '../../model/model.dart';
import '../../model/response/transaction_response/bank_response.dart';
import 'base/hive_boxes.dart';
import 'base/storage_keys.dart';

class AppLocalStorage {
  final _localStorageService = LocalStorageService(Hive.box(HiveBoxes.appBox));

  void saveAppState(String value) {
    _localStorageService.save(StorageKeys.appState, value);
  }

  String getAppState() {
    return _localStorageService.getString(StorageKeys.appState) ??
        AppState.unauthenticated;
  }

  void saveUser(User? user) {
    _localStorageService.saveMap(StorageKeys.appUser, user?.toJson());
  }

  void saveNotificationToken(String? value) {
    _localStorageService.save(StorageKeys.notificationToken, value);
  }

  //Save Banks
  void saveBanks(List<BankResponse> banks) {
    _localStorageService.saveMapList(
        StorageKeys.banks, banks.map((e) => e.toJson()).toList());
  }

  String? getNotificationToken() {
    return _localStorageService.getString(StorageKeys.notificationToken);
  }

  //Get Banks
  List<BankResponse>? getBanks() {
    final res = _localStorageService.getMapList(StorageKeys.banks);
    if (res == null) return null;
    return res.map((e) => BankResponse.fromJson(e)).toList();
  }

  // Save Beneficiaries
  void saveBeneficiaries(List<BeneficiaryDetailResponse> beneficiaries) {
    _localStorageService.saveBeneficiaries(
        StorageKeys.beneficiaries, beneficiaries);
  }

  // Get Beneficiaries
  List<BeneficiaryDetailResponse>? getBeneficiaries() {
    return _localStorageService.getBeneficiaries(StorageKeys.beneficiaries);
  }

  User? getUser() {
    final res = _localStorageService.getMap(StorageKeys.appUser);
    if (res == null) return null;
    return User.fromJson(res);
  }
}
