import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/utilities/file_util.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/account_number.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/account_number_error.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/next_button.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/username_text.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_viewmmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildRecipientCard extends StatelessWidget {
  final Function() onSelectBank;
  final BankResponse? selectedBank;
  final TextEditingController amountController;
  final Function() onGetBeneficiaryDetails;
  const BuildRecipientCard(
      {super.key,
      required this.onSelectBank,
      this.selectedBank,
      required this.amountController,
      required this.onGetBeneficiaryDetails});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransferViewModel>.reactive(
      viewModelBuilder: () => TransferViewModel(),
      builder: (context, model, child) {
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
                              selectedBank != null &&
                                      selectedBank!.logo.isNotEmpty
                                  ? Image.memory(
                                      processImage(selectedBank!.logo),
                                      width: 30,
                                      height: 30)
                                  : Container(),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                    const BuildAccountNumberErrorMessage(),
                    const BuildUsernameText(),
                    const SizedBox(height: 2),
                    const BuildNextTextButton()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
