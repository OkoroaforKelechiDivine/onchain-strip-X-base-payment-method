import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:stacked/stacked.dart';

enum TransferOption {
  NEW,
  BENEFICIARY,
}
class TransferViewModel extends BaseViewModel {
  bool isBankOptionSelected = false;
  final int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  TextEditingController accountNumber = TextEditingController();
  TextEditingController searchController = TextEditingController();

  int? bankIndex;
  String? selectedBank;
  String? selectedBankLogo;
  TransferOption _selectedOption = TransferOption.NEW;
  TransferOption get selectedOption => _selectedOption;

  List<Map<String, String>> bankOptions = [
    {'name': 'UBA', 'logo': AppAssets.bankLogo},
    {'name': 'Opay', 'logo': AppAssets.bankLogo},
    {'name': 'Palmpay', 'logo': AppAssets.bankLogo},
    {'name': 'Grey', 'logo': AppAssets.bankLogo},
    {'name': 'Kuda', 'logo': AppAssets.bankLogo},
  ];

  List<Map<String, String>> filteredBanks = [];

  TransferViewModel() {
    filteredBanks = List.from(bankOptions);
  }

  void onBankChanged(int? index) {
    bankIndex = index;
    isBankOptionSelected = index != null;
    notifyListeners();
  }

  void updateSelectedOption(TransferOption option) {
    _selectedOption = option;
    notifyListeners();
  }

  void filterBanks(String query) {
    if (query.isEmpty) {
      filteredBanks = List.from(bankOptions);
    } else {
      filteredBanks = bankOptions
          .where((bank) => bank['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    filterBanks('');
  }

  void updateSelectedBank(String bank, String logo) {
    selectedBank = bank;
    selectedBankLogo = logo;
    bankIndex = bankOptions.indexWhere((b) => b['name'] == bank);
    isBankOptionSelected = true;
    notifyListeners();
  }
}