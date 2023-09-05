import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/show_all_beneficiaries.dart';

import '../../views/custom_button/custom_bottom_bar_navigation.dart';

class TransferToBankScreen extends StatefulWidget {
  const TransferToBankScreen({Key? key}) : super(key: key);

  @override
  _TransferToBankScreenState createState() => _TransferToBankScreenState();
}

class DummyBank {
  final String name;
  final String logo;
  final String accountName;
  final String accountNumber;

  DummyBank(this.name, this.logo, this.accountName, this.accountNumber);
}

List<DummyBank> dummyBanks = [
  DummyBank("Kuda Bank", "assets/jpg/kudabank_logo.jpg", "Ifeoluwa Rabiu", "1234567890"),
  DummyBank("GTBank", "assets/jpg/gtb_logo.jpg", "Okoroafor Kelechi", "2345678901"),
  DummyBank("Opay Bank", "assets/jpg/opay_logo.jpg", "Okoroafor Nonso", "3456789012"),
  DummyBank("Zenith Bank", "assets/jpg/zenith_logo.jpg", "Okoroafor Maryjane", "4567890123"),
  DummyBank("UBA", "assets/jpg/uba_logo.jpg", "Okoroafor Ozioma", "5678901234"),
  DummyBank("Palmpay", "assets/jpg/palmpay_logo.jpg", "Okoroafor Chinwendu", "6789012345"),
  DummyBank("First Bank", "assets/jpg/firstbank_logo.jpg", "Okoroafor Victoria", "7890123456"),
  DummyBank("Ecobank", "assets/jpg/ecobank_logo.jpg", "Okoroafor Nathaniel", "8901234567"),
  DummyBank("Wema Bank", "assets/jpg/wemabank_logo.jpg", "Rabiu Anu", "9012345678"),
  DummyBank("Stanbic Bank", "assets/jpg/stanbic_logo.jpg", "Rabiu Iyanu", "0123456789"),
  DummyBank("Opay Bank", "assets/jpg/gtb_logo.jpg", "Rabiu Bayelsa", "0123456789"),
  DummyBank("GTBank", "assets/jpg/gtb_logo.jpg", "Rabiu Lagos", "0123456789"),
];

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  bool showBankList = false;
  bool _bankSelected = false;
  bool _isAccountNumberErrorVisible = true;
  bool _isAccountNumberLengthInvalid = false;
  String _userName = '';
  String _selectedBankLogo = '';
  bool _showProcessingCircle = false;

  final TextEditingController _selectedBankController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _showBankSelectionDialog(context);
    });
  }

  void _showBankSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildBankSelectionDialog(context);
      },
    ).then((selectedBank) {
      if (selectedBank != null) {
        setState(() {
          _bankSelected = true;
        });
      }
    });
  }

  Widget _buildBankSelectionDialog(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Bank'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBankSearchTextField(),
          Expanded(
            child: _buildBankList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBankSearchTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Search all banks',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightBlue),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 14.0),
        ),
        onChanged: (text) {},
      ),
    );
  }

  Widget _buildBankList() {
    return ListView.builder(
      itemCount: dummyBanks.length,
      itemBuilder: (BuildContext context, int index) {
        DummyBank bank = dummyBanks[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: ListTile(
            leading: Image.asset(
              bank.logo,
            ),
            title: Text(
              bank.name,
              style: const TextStyle(
                fontWeight: AppFontWeight.bold,
              ),
            ),
            onTap: () {
              _selectedBankController.text = bank.name;
              _selectedBankLogo = bank.logo;
              _userName = "";
              Navigator.of(context).pop(bank);
            },
          ),
        );
      },
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Text(
        "Transfer to Bank",
        style: TextStyle(color: AppColors.lightGreen),
      ),
    );
  }

  Widget _buildRecipientCard(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0), // Add horizontal padding
        child: Card(
          color: AppColors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Recipient Account',
                    style: TextStyle(
                      color: AppColors.lightBlack,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size18,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      _selectedBankLogo,
                      width: 30.0,
                      height: 30.0,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _showBankSelectionDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedBankController.text,
                              style: const TextStyle(
                                color: AppColors.lightBlack,
                                fontWeight: AppFontWeight.bold,
                                fontSize: AppFontSize.size18,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: AppFontSize.size30,
                              color: AppColors.darkWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                _buildAccountNumberTextField(),
                _buildAccountNumberErrorMessages(),
                _buildProcessingCircle(),
                _buildUserNameText(),
                const SizedBox(height: 2),
                _buildNextTextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBankNetworkMonitorCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0), // Add horizontal padding
      child: Card(
        color: AppColors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          onTap: () {},
          title: const Text(
            'Real-time Bank Network Monitor',
            style: TextStyle(
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size14,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.darkWhite, size: AppFontSize.size20),
        ),
      ),
    );
  }

  Widget _buildBeneficiariesCard(BuildContext context) {
    List<DummyBank> beneficiaries = dummyBanks.sublist(0, 4);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: AppColors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Beneficiaries',
                      style: TextStyle(
                        color: AppColors.lightGreen,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.size12,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowAllBeneficiariesScreen(banks: dummyBanks),
                        ),
                      );
                    },
                    child: const Row(
                      children: [
                        Text(
                          'View All',
                          style: TextStyle(
                            color: AppColors.darkWhite,
                            fontWeight: AppFontWeight.bold,
                            fontSize: AppFontSize.size12,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.darkWhite,
                          size: AppFontSize.size12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List<Widget>.generate(beneficiaries.length * 2 - 1, (index) {
                if (index.isOdd) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Divider(
                      height: 0.5,
                      color: AppColors.darkWhite,
                      thickness: 2,
                    ),
                  );
                } else {
                  // Add ListTile for the bank item
                  final int beneficiaryIndex = index ~/ 2;
                  DummyBank beneficiary = beneficiaries[beneficiaryIndex];
                  return ListTile(
                    leading: SizedBox(
                      width: 30.0,
                      height: 30.0,
                      child: Image.asset(
                        beneficiary.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      beneficiary.accountName,
                      style: const TextStyle(
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.size14,
                      ),
                    ),
                    subtitle: Text(
                      beneficiary.name,
                      style: const TextStyle(
                        color: AppColors.lightGreen,
                        fontSize: AppFontSize.size12,
                      ),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildAccountNumberTextField() {
    bool isAccountNumberEmpty = _accountNumberController.text.isEmpty;
    bool isAccountNumberInvalid = _accountNumberController.text.length < 10;

    String labelText = isAccountNumberEmpty ? 'Enter 10 digit Number' : '';

    UnderlineInputBorder customErrorBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: (isAccountNumberEmpty || isAccountNumberInvalid) ? AppColors
            .errorRed : AppColors.darkWhite.withOpacity(0.5),
      ),
    );

    UnderlineInputBorder customFocusedErrorBorder = const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.errorRed,
      ),
    );

    return TextFormField(
      controller: _accountNumberController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.darkWhite,
          fontWeight: AppFontWeight.bold,
          fontSize: AppFontSize.size16,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: (_isAccountNumberErrorVisible ||
                _isAccountNumberLengthInvalid) ? AppColors.errorRed : AppColors
                .darkWhite.withOpacity(0.5),
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkWhite),
        ),
        errorBorder: customErrorBorder,
        focusedErrorBorder: customFocusedErrorBorder,
        contentPadding: const EdgeInsets.only(
          top: 4.0,
          bottom: 4.0,
        ),
        fillColor: AppColors.lightBlue,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            _isAccountNumberErrorVisible = true;
            _isAccountNumberLengthInvalid = false;
            _userName = '';
          } else if (value.length != 10) {
            _isAccountNumberErrorVisible = false;
            _isAccountNumberLengthInvalid = true;
            _userName = '';
          } else {
            _showProcessingCircle = true;
            _isAccountNumberErrorVisible = false;
            _isAccountNumberLengthInvalid = false;
            Future.delayed(const Duration(seconds: 3), () {
              DummyBank matchingBank;
              try {
                matchingBank = dummyBanks.firstWhere(
                        (bank) =>
                    bank.accountNumber == value &&
                        bank.name == _selectedBankController.text
                );
                _userName = matchingBank.accountName;
              } catch (e) {
                _isAccountNumberErrorVisible = true;
                _userName = 'Account not found';
              } finally {
                _showProcessingCircle = false;
              }
              setState(() {});
            });
          }
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Account number should not be empty';
        } else if (value.length < 10) {
          return 'Account length is invalid';
        }
        return null;
      },
    );
  }

  Widget _buildAccountNumberErrorMessages() {
    const TextStyle errorTextStyle = TextStyle(
      color: AppColors.errorRed,
      fontWeight: AppFontWeight.medium,
      fontSize: AppFontSize.size14,
    );

    return Column(
      children: [
        Visibility(
          visible: _isAccountNumberErrorVisible &&
              _accountNumberController.text.isEmpty,
          child: const Text(
            'Account number is empty',
            style: errorTextStyle,
          ),
        ),
        Visibility(
          visible: _isAccountNumberLengthInvalid,
          child: const Text(
            'Account length is invalid',
            style: errorTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildProcessingCircle() {
    return Visibility(
      visible: _showProcessingCircle,
      child: Column(
        children: [
          const Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            _userName,
            style: const TextStyle(
              color: AppColors.lightGreen,
              fontWeight: AppFontWeight.bold,
              fontSize: AppFontSize.size16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserNameText() {
    return Center(
      child: Text(
        _userName,
        style: const TextStyle(
          color: AppColors.lightGreen,
          fontWeight: AppFontWeight.bold,
          fontSize: AppFontSize.size16,
        ),
      ),
    );
  }

  Widget _buildNextTextButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Next',
          style: TextStyle(
            fontWeight: AppFontWeight.bold,
            color: AppColors.lightBlack,
            fontSize: AppFontSize.size16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildRecipientCard(context),
            _buildBankNetworkMonitorCard(context),
            _buildBeneficiariesCard(context),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
          } else if (index == 1) {
          } else if (index == 2) {
          } else if (index == 3) {
          }
        },
      ),
    );
  }
}