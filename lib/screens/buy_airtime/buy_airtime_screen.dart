import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import '../../views/custom/custom_amount_input_field.dart';
import '../../views/custom/custom_bottom_bar_navigation.dart';
import '../../views/custom/show_pin_dialog.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
  String selectedAmount = "";
  TextEditingController amountController = TextEditingController();
  String? selectedNetwork;
  int _currentIndex = 2;
  int? selectedAmountIndex;

  late List<DropdownMenuItem<String>> networkItems;

  @override
  void initState() {
    super.initState();

    networkItems = [
      DropdownMenuItem<String>(
        value: "MTN",
        child: _buildNetworkItem('MTN', 'assets/jpg/mtn_logo.jpg'),
      ),
      DropdownMenuItem<String>(
        value: "GLO",
        child: _buildNetworkItem('GLO', 'assets/jpg/glo_logo.jpg'),
      ),
      DropdownMenuItem<String>(
        value: "9 Mobile",
        child: _buildNetworkItem('9 Mobile', 'assets/jpg/9_mobile_logo.jpg'),
      ),
      DropdownMenuItem<String>(
        value: "Airtel",
        child: _buildNetworkItem('Airtel', 'assets/jpg/airtel_logo.jpg'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text(
            'Buy Airtime',
            style: TextStyle(
              fontSize: AppFontSize.size20,
              color: AppColors.lightGreen,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 200),
              child: Text(
                'Choose an amount',
                style: TextStyle(
                  fontSize: AppFontSize.size16,
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            _buildAmountCards(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildAmountInfo(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildAmountTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildNetworkDropdown(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildPhoneNumberTextField(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0,),
              child: _buildNextButton(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Column _buildAmountCards() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAmountCard("₦200", CustomStyles.buyAirtimeTextStyleInfo, 0),
            _buildAmountCard("₦500", CustomStyles.buyAirtimeTextStyleInfo, 1),
            _buildAmountCard("₦1000", CustomStyles.buyAirtimeTextStyleInfo, 2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAmountCard("₦2000", CustomStyles.buyAirtimeTextStyleInfo, 3),
            _buildAmountCard("₦3000", CustomStyles.buyAirtimeTextStyleInfo, 4),
            _buildAmountCard("₦5000", CustomStyles.buyAirtimeTextStyleInfo, 5),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Amount',
            style: TextStyle(
              fontSize: AppFontSize.size16,
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
            ),
          ),
          Text(
            'Balance: NGN7,361.87',
            style: TextStyle(
              fontSize: AppFontSize.size16,
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0,),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: amountController,
          onChanged: (text) {
            String formattedAmount = AmountFormatter.formatAmount(text);
            if (amountController.text != formattedAmount) {
              amountController.value = amountController.value.copyWith(
                text: formattedAmount,
                selection: TextSelection.collapsed(offset: formattedAmount.length),
              );
            }
          },
          decoration: InputDecoration(
            hintText: "Enter amount here",
            hintStyle: const TextStyle(
                color: AppColors.lightGrey,
                fontSize: AppFontSize.size14,
                fontWeight: AppFontWeight.light
            ),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }


  Widget _buildNetworkDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0,),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Choose Network",
            hintStyle: const TextStyle(
                color: AppColors.lightGrey,
                fontSize: AppFontSize.size14,
                fontWeight: AppFontWeight.light
            ),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          value: selectedNetwork,
          onChanged: (newValue) {
            setState(() {
              selectedNetwork = newValue;
            });
          },
          items: networkItems,
        ),
      ),
    );
  }

  Widget _buildPhoneNumberTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0,),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter Phone number",
            hintStyle: const TextStyle(
                color: AppColors.lightGrey,
                fontSize: AppFontSize.size14,
                fontWeight: AppFontWeight.light
            ),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  Padding _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: ElevatedButton(
        onPressed: () {
          String enteredAmount = amountController.text;

          enteredAmount = enteredAmount.replaceAll("₦", "").replaceAll(",", "");

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PinDialog(
                amount: double.parse(enteredAmount),
                accountName: "",
              ),
            ),
          );
        },
        child: const Text(
            "Next",
            style: TextStyle(
                color: AppColors.pureWhite
            )
        ),
      ),
    );
  }

  Widget _buildAmountCard(String title, TextStyle style, int cardIndex) {
    bool isSelected = selectedAmountIndex == cardIndex;

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            String formattedAmount = AmountFormatter.formatAmount(title);
            amountController.text = formattedAmount;
            selectedAmountIndex = cardIndex;
          });
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: isSelected ? AppColors.lightGreen : AppColors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 70,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15.0),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? AppColors.pureWhite : style.color,
                      fontSize: style.fontSize,
                      fontWeight: style.fontWeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildNetworkItem(String networkName, String logoAsset) {
    return DropdownMenuItem<String>(
      value: networkName,
      child: Row(
        children: [
          Image.asset(logoAsset, width: 40,),
          const SizedBox(width: 8),
          Text(networkName),
        ],
      ),
    );
  }
}

class CustomStyles {
  static const TextStyle buyAirtimeTextStyleInfo = TextStyle(
    fontSize: AppFontSize.size16,
    color: AppColors.lightBlack,
    fontWeight: AppFontWeight.regular,
  );
}
