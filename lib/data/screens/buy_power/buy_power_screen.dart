import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app_config/manager/font_manager.dart';
import '../../../app_config/manager/theme_manager.dart';
import '../../../views/custom/custom_amount_input_field.dart';
import '../../../views/custom/custom_bottom_bar_navigation.dart';
import '../../../views/custom/show_pin_dialog.dart';

class BuyPowerScreen extends StatefulWidget {
  const BuyPowerScreen({super.key});

  @override
  State<BuyPowerScreen> createState() => _BuyPowerScreenState();
}

class _BuyPowerScreenState extends State<BuyPowerScreen> {
  String? selectedElectricityProvider;
  String? selectedPackage;
  TextEditingController electricityProviderController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  int _currentIndex = 3;

  List<DropdownMenuItem<String>> electricityProviderItems = [
    const DropdownMenuItem<String>(
      value: "Provider 1",
      child: Text("Provider 1"),
    ),
    const DropdownMenuItem<String>(
      value: "Provider 2",
      child: Text("Provider 2"),
    ),
    const DropdownMenuItem<String>(
      value: "Provider 3",
      child: Text("Provider 3"),
    ),
    const DropdownMenuItem<String>(
      value: "Provider 4",
      child: Text("Provider 4"),
    ),
  ];

  List<DropdownMenuItem<String>> packageItems = [
    const DropdownMenuItem<String>(
      value: "Package 1",
      child: Text("Package 1"),
    ),
    const DropdownMenuItem<String>(
      value: "Package 2",
      child: Text("Package 2"),
    ),
    const DropdownMenuItem<String>(
      value: "Package 3",
      child: Text("Package 3"),
    ),
    const DropdownMenuItem<String>(
      value: "Package 4",
      child: Text("Package 4"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text(
            'Buy Power',
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
            const SizedBox(height: 20),
            _buildServiceProviders(),
            const SizedBox(height: 10),
            _buildPackage(),
            const SizedBox(height: 10),
            _buildMeterName(),
            _buildNextButton(),
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

  Widget _buildServiceProviders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Service provider",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ),
          _buildElectricityProviderDropdown(),
        ],
      ),
    );
  }

  Widget _buildPackage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Package",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ),
          _buildPackageDropdown(),
        ],
      ),
    );
  }

  Widget _buildMeterName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Meter Number",
                style: TextStyle(
                  color: AppColors.lightBlack,
                  fontWeight: AppFontWeight.bold,
                  fontSize: AppFontSize.size16,
                ),
              ),
            ),
          ),
          _buildElectricityProviderTextField(),
          const SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Amount',
                  style: TextStyle(
                    fontSize: AppFontSize.size16,
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  'Balance: NGN7,361.87',
                  style: TextStyle(
                    fontSize: AppFontSize.size16,
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          _buildAmountTextField(),
        ],
      ),
    );
  }

  Widget _buildElectricityProviderDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
            hintText: "Choose Electricity Provider",
            hintStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppFontSize.size14,
              fontWeight: AppFontWeight.light,
            ),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          value: selectedElectricityProvider,
          onChanged: (newValue) {
            setState(() {
              selectedElectricityProvider = newValue;
            });
          },
          items: electricityProviderItems,
        ),
      ),
    );
  }

  Widget _buildElectricityProviderTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
          controller: electricityProviderController,
          decoration: InputDecoration(
            hintText: "Enter Meter Number",
            hintStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppFontSize.size14,
              fontWeight: AppFontWeight.light,
            ),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPackageDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
            hintText: "Choose Package",
            hintStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppFontSize.size14,
              fontWeight: AppFontWeight.light,
            ),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          value: selectedPackage,
          onChanged: (newValue) {
            setState(() {
              selectedPackage = newValue;
            });
          },
          items: packageItems,
        ),
      ),
    );
  }

  Widget _buildAmountTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
              fontWeight: AppFontWeight.light,
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
      padding: const EdgeInsets.only(left: 120.0, right: 120.0, top: 50),
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
        child: const Text("Next", style: TextStyle(color: AppColors.pureWhite)),
      ),
    );
  }
}
