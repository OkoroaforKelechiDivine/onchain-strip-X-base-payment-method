import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount_cards.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount-text-field.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount_info.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/network_dropdown.dart';
import 'package:pay_me_mobile/src/views/widgets/app_button.dart';
import 'package:pay_me_mobile/core/cores.dart';

import '../../../../../core/utilities/app_fonts.dart';
import 'components/network_item.dart';
import 'components/phone_number.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
  String selectedAmount = "";
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? selectedNetwork;
  int? selectedAmountIndex;

  late List<DropdownMenuItem<String>> networkItems;

  final List<Map<String, String>> networks = [
    {
      'name': "MTN",
      'logoAsset': 'assets/jpg/mtn_logo.jpg',
      'billerId': "mtnng",
      'divisionId': "C",
      'productId': "425",
    },
    {
      'name': "GLO",
      'logoAsset': 'assets/jpg/glo_logo.jpg',
      'billerId': "glong",
      'divisionId': "C",
      'productId': "424",
    },
    {
      'name': "9Mobile",
      'logoAsset': 'assets/jpg/9_mobile_logo.jpg',
      'billerId': "eting",
      'divisionId': "C",
      'productId': "422",
    },
    {
      'name': "Airtel",
      'logoAsset': 'assets/jpg/airtel_logo.jpg',
      'billerId': "airng",
      'divisionId': "C",
      'productId': "423",
    },
  ];

  @override
  void initState() {
    super.initState();
    networkItems = networks.map((network) {
      return DropdownMenuItem<String>(
        value: network['name'],
        child: NetworkItem(
          networkName: network['name']!,
          logoAsset: network['logoAsset']!,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Buy Airtime',
          style: sans(color: AppColors.lightGreen),
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
            const SizedBox(
              height: 5,
            ),
            const BuildAmountCards(),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BuildAmountInfo(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: BuildAmountTextField(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: BuildNetworkDropDown(),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: BuildPhoneNumberTextField(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
                right: 100,
              ),
              child: AppButton.filledButton(context,
                  onTap: () {},
                  color: AppColors.lightGreen,
                  child: Text(
                    'Next',
                    style: cairo(),
                  )
              ),
            ),
          ],
        ),
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
