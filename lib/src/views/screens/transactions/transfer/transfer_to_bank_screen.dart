import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/banks_list.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/processing_circle.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/recipient_card.dart';

import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_viewmmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../custom/process/processing_bar.dart';
import 'components/dummy_bank.dart';
import 'components/recent_card.dart';

class TransferToBankScreen extends StatefulWidget {
  const TransferToBankScreen({Key? key}) : super(key: key);

  @override
  _TransferToBankScreenState createState() => _TransferToBankScreenState();
}

class _TransferToBankScreenState extends State<TransferToBankScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => TransferViewModel(),
      builder: (context, model, _) {
        return model.showBankList
            ? WillPopScope(
                onWillPop: () async {
                  if (model.showBankList) {
                    model.onHideBank();
                    return false;
                  } else {
                    return true;
                  }
                },
                child: BankList(
                  model: model,
                  isLoading: model.isLoadingBankList,
                  onBack: () {
                    model.onHideBank();
                  },
                  onSelectBank: (bank) {
                    model.onSelectBank(bank);
                  },
                  bankList: model.bankList,
                ),
              )
            : Builder(
                builder: (context) {
                  return WillPopScope(
                    onWillPop: () async {
                      if (model.showBankList) {
                        model.onHideBank();
                        return false;
                      } else {
                        return true;
                      }
                    },
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.white10,
                        elevation: 0,
                        title: Text(
                          'Transfer to Bank',
                          style: sans(color: AppColors.lightGreen),
                        ),
                      ),
                      body: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const BuildProcessingCircle(),
                                BuildRecipientCard(
                                  model: model,
                                  amountController:
                                      model.accountNumberController,
                                  selectedBank: model.selectedBank,
                                  onSelectBank: () {
                                    model.onShowBank();
                                  },
                                  onGetBeneficiaryDetails: () {
                                    model.getBeneficiaryDetails();
                                  },
                                  isLoadingbeneficiaryDetail:
                                      model.isLoadingbeneficiaryDetail,
                                  beneficiaryDetailResponse:
                                      model.beneficiaryDetailResponse,
                                ),
                                // BuildBeneficiary(context: context),
                                BuildRecentCard(model: model),
                              ],
                            ),
                          ),
                          if (model.showLinearProcessing)
                            Container(
                              color: AppColors.pureWhite.withOpacity(0.5),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: Column(
                                  children: [
                                    const ProcessingBar(),
                                    Text(
                                      model.userName,
                                      style: const TextStyle(
                                        color: AppColors.lightGreen,
                                        fontWeight: AppFontWeight.bold,
                                        fontSize: AppFontSize.size12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      // bottomNavigationBar: CustomBottomNavigationBar(
                      //   currentIndex: _currentIndex,
                      //   onTap: (int index) {
                      //     setState(() {
                      //       _currentIndex = index;
                      //     });
                      //   },
                      // ),
                    ),
                  );
                },
              );
      },
    );
  }
}
