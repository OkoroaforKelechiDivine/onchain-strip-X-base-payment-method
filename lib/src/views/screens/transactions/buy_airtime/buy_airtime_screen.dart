import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/widgets/loader.dart';
import 'package:pay_me_mobile/src/custom/custom_amount_input_field.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount_cards.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/amount_info.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/components/network_dropdown.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/utilities/app_fonts.dart';

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
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
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
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose an amount',
                        style: TextStyle(
                          fontSize: AppFontSize.size16,
                          color: AppColors.lightBlack,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BuildAmountCards(model: model),
                      const SizedBox(height: 24),
                      BuildAmountInfo(
                        viewModel: model,
                      ),
                      const SizedBox(height: 24),
                      AppCustomTextField(
                        textEditingController: model.amountController,
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
                        hintText: "Enter amount here",
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      BuildNetworkDropDown(
                        model: model,
                      ),
                      const SizedBox(height: 24),
                      AppCustomTextField(
                        textEditingController: model.phoneNumberController,
                        hintText: "Enter Phone number",
                        textInputType: TextInputType.number,
                        maxLength: 11,
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: AppCustomButton(
                          width: 200,
                          onPressed: () {
                            model.buyAirtime();
                          },
                          title: "Buy Airtime",
                          loading: model.buyingAirtime,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: model.buyingAirtime,
                child: const Positioned(
                  child: AppLoader(),
                ),
              ),
            ],
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
