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
    return ViewModelBuilder<TvCableViewModel>.reactive(
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
                    onChanged: (val) {
                      if (val.length == 10) {
                        viewModel.onResolveDecoderNumber();
                      }
                    },
                  ),
                  Visibility(
                    visible: viewModel.isLoadingSmartCardDetails,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColors.lightGreen.withOpacity(0.1),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          viewModel.verifySmartCardResponse == null
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColors.lightGreen,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(
                                  Icons.check_circle_rounded,
                                  color: AppColors.lightGreen,
                                ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              viewModel.verifySmartCardResponse != null
                                  ? viewModel
                                      .verifySmartCardResponse!.customerName
                                  : "Checking decoder number..",
                              style: const TextStyle(
                                color: AppColors.lightGreen,
                                fontWeight: AppFontWeight.bold,
                                fontSize: AppFontSize.size14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    maxLength: 11,
                    padding: const EdgeInsets.all(18),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Subscription Type",
                    style: TextStyle(
                      color: AppColors.lightBlack,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const AppText("Renew"),
                          leading: Radio(
                            activeColor: AppColors.lightGreen,
                            value: 'renew',
                            groupValue: viewModel.type,
                            onChanged: (String? value) {
                              viewModel.setRequestType(value!);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const AppText("Change"),
                          leading: Radio(
                            activeColor: AppColors.lightGreen,
                            value: 'change',
                            groupValue: viewModel.type,
                            onChanged: (String? value) {
                              viewModel.setRequestType(value!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Amount: ${viewModel.selectedPackageResponse == null ? "N/A" : "₦${formatBalance(double.parse(viewModel.selectedPackageResponse!.variationAmount))}"}',
                            style: TextStyle(
                              fontSize: AppFontSize.size16,
                              color: AppColors.lightBlack,
                              fontWeight: AppFontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
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
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppCustomButton(
                    title: 'Next',
                    loading: viewModel.isLoadingPayment,
                    onPressed: () {
                      viewModel.buyCable();
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
