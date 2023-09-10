import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
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
  int _currentIndex = 0;

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
                  fontSize: AppFontSize.size20,
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
            _buildAmountCard("₦200", CustomStyles.buyAirtimeTextStyleInfo),
            _buildAmountCard("₦500", CustomStyles.buyAirtimeTextStyleInfo),
            _buildAmountCard("₦1000", CustomStyles.buyAirtimeTextStyleInfo),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAmountCard("₦2000", CustomStyles.buyAirtimeTextStyleInfo),
            _buildAmountCard("₦3000", CustomStyles.buyAirtimeTextStyleInfo),
            _buildAmountCard("₦5000", CustomStyles.buyAirtimeTextStyleInfo),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountInfo() {
    return const Padding(
      padding: EdgeInsets.only(top:5.0, bottom: 10),
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
      padding: const EdgeInsets.only(bottom: 5.0),
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
          decoration: InputDecoration(
            hintText: "Enter amount here",
            hintStyle: const TextStyle(color: AppColors.lightBlack, fontWeight: AppFontWeight.bold),
            filled: true,
            fillColor: AppColors.lightBlue,
            focusColor: AppColors.lightBlue,
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
      padding: const EdgeInsets.only(bottom: 5.0),
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
              color: AppColors.lightBlack,
              fontWeight: AppFontWeight.bold,
            ),
            filled: true,
            fillColor: AppColors.lightBlue,
            focusColor: AppColors.lightBlue,
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
    return Container(
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
          hintStyle: const TextStyle(color: AppColors.lightBlack, fontWeight: AppFontWeight.bold),
          filled: true,
          fillColor: AppColors.lightBlue,
          focusColor: AppColors.lightBlue,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Padding _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
          String enteredAmount = amountController.text;
          enteredAmount = enteredAmount.replaceAll("₦", "");

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PinDialog(
                amount: double.parse(enteredAmount),
                accountName: "",
              ),
            ),
          );
        },
        child: const Text("Next", style: TextStyle(color: AppColors.pureWhite)),
      ),
    );
  }

  Widget _buildAmountCard(String title, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            amountController.text = title;
          });
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: AppColors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 90,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Text(
                    title,
                    style: style,
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
    fontSize: AppFontSize.size24,
    color: AppColors.lightBlack,
    fontWeight: AppFontWeight.bold,
  );
}
