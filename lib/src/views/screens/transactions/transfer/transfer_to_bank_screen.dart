
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

List<DummyBank> dummyBanks = [
  DummyBank("Kuda Bank", "assets/jpg/kudabank_logo.jpg", "Ifeoluwa Rabiu",
      "1234567890", DateTime(2023, 2, 12), "Approved"),
  DummyBank("GTBank", "assets/jpg/gtb_logo.jpg", "Okoroafor Kelechi",
      "2345678901", DateTime(2023, 2, 12), "Approved"),
  DummyBank("Opay Bank", "assets/jpg/opay_logo.jpg", "Okoroafor Nonso",
      "3456789012", DateTime.now(), "Pending"),
  DummyBank("Zenith Bank", "assets/jpg/zenith_logo.jpg", "Okoroafor Maryjane",
      "4567890123", DateTime(2023, 1, 12), "Approved"),
  DummyBank("UBA", "assets/jpg/uba_logo.jpg", "Okoroafor Ozioma", "5678901234",
      DateTime(2023, 6, 12), "Declined"),
  DummyBank("Palmpay", "assets/jpg/palmpay_logo.jpg", "Okoroafor Chinwendu",
      "6789012345", DateTime(2023, 12, 16), "Approved"),
  DummyBank("First Bank", "assets/jpg/firstbank_logo.jpg", "Okoroafor Victoria",
      "7890123456", DateTime(2022, 2, 12), "Pending"),
  DummyBank("Ecobank", "assets/jpg/ecobank_logo.jpg", "Okoroafor Nathaniel",
      "8901234567", DateTime.now(), "Declined"),
  DummyBank("Wema Bank", "assets/jpg/wemabank_logo.jpg", "Rabiu Anu",
      "9012345678", DateTime(2021, 2, 12), "Approved"),
  DummyBank("Stanbic Bank", "assets/jpg/stanbic_logo.jpg", "Rabiu Iyanu",
      "0123456789", DateTime.now(), "Pending"),
  DummyBank("Opay Bank", "assets/jpg/opay_logo.jpg", "Rabiu Bayelsa",
      "0123456789", DateTime.now(), "Approved"),
  DummyBank("GTBank", "assets/jpg/gtb_logo.jpg", "Rabiu Lagos", "0123456789",
      DateTime.now(), "Declined"),
];

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
