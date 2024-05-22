import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/enter_amount.dart';
import 'package:stacked/stacked.dart';

import '../../core/di/locator.dart';

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
  String? accountName;
  TransferOption _selectedOption = TransferOption.NEW;
  TransferOption get selectedOption => _selectedOption;

  List<Map<String, String>> bankOptions = [
    {'name': 'UBA', 'logo': AppAssets.bankLogo, 'accountName': 'Nonso', 'accountNumber': '1234567890'},
    {'name': 'Opay', 'logo': AppAssets.bankLogo, 'accountName': 'Glory', 'accountNumber': '0987654321'},
    {'name': 'Palmpay', 'logo': AppAssets.bankLogo, 'accountName': 'Obinna', 'accountNumber': '1122334455'},
    {'name': 'Grey', 'logo': AppAssets.bankLogo, 'accountName': 'Kelechi', 'accountNumber': '2233445566'},
    {'name': 'Kuda', 'logo': AppAssets.bankLogo, 'accountName': 'Payme Business', 'accountNumber': '3344556677'},
  ];

  List<Map<String, String>> filteredBanks = [];

  TransferViewModel() {
    filteredBanks = List.from(bankOptions);
    accountNumber.addListener(_onAccountNumberChanged);
  }

  void _onAccountNumberChanged() {
    final accountNum = accountNumber.text;
    if (selectedBank != null && accountNum.isNotEmpty) {
      final bank = bankOptions.firstWhere((b) => b['name'] == selectedBank, orElse: () => {});
      if (bank.isNotEmpty && bank['accountNumber'] == accountNum) {
        accountName = bank['accountName'];
      } else {
        accountName = null;
      }
    } else {
      accountName = null;
    }
    notifyListeners();
  }

  void navigateToNextScreen(BuildContext context) {
    if (accountName != null) {
      navigationService.push(
        EnterAmount(accountName: accountName!),
      );
    }
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
    _onAccountNumberChanged(); // This will update account name when a bank is selected
    notifyListeners();
  }
}
