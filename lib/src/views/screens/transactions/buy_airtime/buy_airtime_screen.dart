import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/src/custom/custom_amount_input_field.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount_cards.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount-text-field.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount_info.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/network_dropdown.dart';
import 'package:pay_me_mobile/src/views/widgets/app_button.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/utilities/app_fonts.dart';
import 'components/network_item.dart';
import 'components/phone_number.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BuyAirtimeViewModel(),
      builder: (context, model, _) {
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
                BuildAmountCards(model: model),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: BuildAmountInfo(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
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
                        controller: model.amountController,
                        onChanged: (text) {
                          String formattedAmount =
                              AmountFormatter.formatAmount(text);
                          if (model.amountController.text != formattedAmount) {
                            model.amountController.value =
                                model.amountController.value.copyWith(
                              text: formattedAmount,
                              selection: TextSelection.collapsed(
                                  offset: formattedAmount.length),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter amount here",
                          hintStyle: const TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: AppFontSize.size14,
                              fontWeight: AppFontWeight.light),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: BuildNetworkDropDown(
                    model: model,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
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
                        controller: model.phoneNumberController,
                        decoration: InputDecoration(
                          hintText: "Enter Phone number",
                          hintStyle: const TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: AppFontSize.size14,
                              fontWeight: AppFontWeight.light),
                          filled: true,
                          fillColor: AppColors.pureWhite,
                          focusColor: AppColors.pureWhite,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 11,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AppCustomButton(
                  width: 200,
                  onPressed: () {
                    model.onBuyAirtime();
                  },
                  title: "Buy Airtime",
                  loading: model.buyingAirtime,
                  //color: AppColors.lightGreen,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 100,
                //     right: 100,
                //   ),
                //   child: AppButton.filledButton(context,
                //       onTap: () {},
                //       color: AppColors.lightGreen,
                //       child: Text(
                //         'Next',
                //         style: cairo(),
                //       )),
                // ),
              ],
            ),
          ),
        );
      },
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
