import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/core/utilities/file_util.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/account_number.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/account_number_error.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/next_button.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/username_text.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/send_money.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_viewmmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildRecipientCard extends StatelessWidget {
  final TransferViewModel model;
  final Function() onSelectBank;
  final BankResponse? selectedBank;
  final TextEditingController amountController;
  final Function() onGetBeneficiaryDetails;
  final BeneficiaryDetailResponse? beneficiaryDetailResponse;
  final bool isLoadingbeneficiaryDetail;
  const BuildRecipientCard(
      {super.key,
      required this.onSelectBank,
      this.selectedBank,
      required this.amountController,
      required this.onGetBeneficiaryDetails,
      this.beneficiaryDetailResponse,
      required this.isLoadingbeneficiaryDetail,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          color: AppColors.pureWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Recipient Account',
                    style: TextStyle(
                      color: AppColors.lightBlack,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    onSelectBank();
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.lightGrey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          selectedBank != null && selectedBank!.logo.isNotEmpty
                              ? Image.memory(processImage(selectedBank!.logo),
                                  width: 30, height: 30)
                              : Container(),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedBank?.name ?? "Select Bank",
                                  style: const TextStyle(
                                    color: AppColors.lightBlack,
                                    fontWeight: AppFontWeight.bold,
                                    fontSize: AppFontSize.size14,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: AppFontSize.size18,
                                  color: AppColors.lightBlack,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BuildAccountNumberTextField(
                  onCheckAccount: () {
                    onGetBeneficiaryDetails();
                  },
                  textController: amountController,
                ),
                //const BuildAccountNumberErrorMessage(),
                const SizedBox(height: 20),
                Visibility(
                  visible: isLoadingbeneficiaryDetail,
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
                        beneficiaryDetailResponse == null
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
                            beneficiaryDetailResponse != null
                                ? beneficiaryDetailResponse!.name
                                : "Checking account number..",
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
                const SizedBox(height: 20),
                //const BuildUsernameText(),
                const SizedBox(height: 2),
                // const BuildNextTextButton(),
                Center(
                  child: AppCustomButton(
                    width: 200,
                    color: AppColors.lightGreen,
                    onPressed: () {
                      //model.onShowBank();
                      if (model.selectedBank != null &&
                          beneficiaryDetailResponse != null) {
                        navigationService.push(SendMoneyScreen(
                            selectedBank: model.selectedBank!,
                            beneficiaryDetailResponse:
                                beneficiaryDetailResponse!));
                      }
                    },
                    child: const AppText(
                      'Next',
                      color: AppColors.pureWhite,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size14,
                    ),
                  ),
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
