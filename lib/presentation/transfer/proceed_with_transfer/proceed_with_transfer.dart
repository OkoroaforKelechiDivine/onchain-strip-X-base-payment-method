import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/beneficiary_detail_response.dart';
import 'package:pay_me_mobile/presentation/transfer/proceed_with_transfer/proceed_with_transfer_vm.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/receive_message.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/send_message.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/transfer_money_widget.dart';
import 'package:stacked/stacked.dart';

class ProceedWithTransfer extends StatelessWidget {
  final BeneficiaryDetailResponse beneficiaryDetail;
  final BankResponse selectedBank;

  const ProceedWithTransfer({
    Key? key,
    required this.beneficiaryDetail,
    required this.selectedBank,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProceedWithTransferVM(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          appBar: PaymeAppBar(
            isBack: true,
            title: beneficiaryDetail.name,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  children: <Widget>[
                    ReceivedMessageBuilder().buildReceivedMessage(),
                    SentMessageBuilder().buildSentMessage(),
                  ],
                ),
              ),
              Visibility(
                visible: !model.toggleSendMoney,
                replacement: TransferMoneyField(
                  model: model,
                  onSendMondey: () {
                    model.transferMoney(
                        selectedbank: selectedBank,
                        beneficiary: beneficiaryDetail);
                  },
                ),
                child: Container(
                  color: AppColors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: AppButton(
                    title: "Send Money",
                    radius: 12.r,
                    onPressed: () {
                      model.setSendMoney();
                    },
                  ),
                ),
              ),
              //const DraggableDialog(),
            ],
          ),
        );
      },
    );
  }
}
