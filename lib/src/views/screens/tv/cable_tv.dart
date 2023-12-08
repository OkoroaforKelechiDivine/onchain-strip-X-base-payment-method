import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/custom/custom_amount_input_field.dart';
import 'package:pay_me_mobile/src/views/screens/tv/components/package.dart';
import 'package:pay_me_mobile/src/views/screens/tv/components/service_providers.dart';
import 'package:pay_me_mobile/src/views/screens/tv/tv_cable_viewModel.dart';
import 'package:stacked/stacked.dart';

import '../../../../app_config/manager/font_manager.dart';
import '../../../../core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';

class CableTvScreen extends StatefulWidget {
  const CableTvScreen({super.key});

  @override
  State<CableTvScreen> createState() => _CableTvScreenState();
}

class _CableTvScreenState extends State<CableTvScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) {
        viewModel.init();
      },
      viewModelBuilder: () => TvCableViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white10,
            title: Text(
              'Cable TV',
              style: sans(
                fontSize: AppFontSize.size20,
                color: AppColors.lightGreen,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  BuildTVServiceProviders(
                    model: viewModel,
                  ),
                  const SizedBox(height: 24),

                  BuildTvPackage(
                    model: viewModel,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Decoder Number",
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                    fontSize: AppFontSize.size16,
                  ),

                  const SizedBox(height: 10),
                  AppCustomTextField(
                    textEditingController: viewModel.decoderNumberController,
                    hintText: 'Enter Decoder Number',
                    textInputType: TextInputType.number,
                    maxLength: 10,
                    padding: const EdgeInsets.all(18),
                  ),
                  //BuildTvProviderTextField(),
                  const SizedBox(height: 16),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      color: AppColors.lightBlack,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 10),
                  AppCustomTextField(
                    textEditingController: viewModel.phoneNumberController,
                    hintText: 'Enter Phone Number',
                    textInputType: TextInputType.number,
                    maxLength: 10,
                    padding: const EdgeInsets.all(18),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: AppFontSize.size16,
                          color: AppColors.lightBlack,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                      Text(
                        "Balance: ₦${viewModel.isLoadingWalletBalance ? "N/A" : formatBalance(double.parse(viewModel.walletBalance))}",
                        style: const TextStyle(
                          fontSize: AppFontSize.size16,
                          color: AppColors.lightBlack,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AppCustomTextField(
                    textEditingController: viewModel.amountController,
                    hintText: 'Enter amount here',
                    textInputType: TextInputType.number,
                    padding: const EdgeInsets.all(18),
                    onChanged: (text) {
                      String formattedAmount =
                          AmountFormatter.formatAmount(text);
                      if (viewModel.amountController.text != formattedAmount) {
                        viewModel.amountController.value =
                            viewModel.amountController.value.copyWith(
                          text: formattedAmount,
                          selection: TextSelection.collapsed(
                              offset: formattedAmount.length),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  AppCustomButton(
                    title: 'Next',
                    onPressed: () {
                      // viewModel.navigateToNextScreen();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
