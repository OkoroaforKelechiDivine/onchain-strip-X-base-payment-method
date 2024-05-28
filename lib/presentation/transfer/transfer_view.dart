import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/transfer/select_bank_view.dart';
import 'package:pay_me_mobile/presentation/transfer/tabs/beneficiary_transfer.dart';
import 'package:pay_me_mobile/presentation/transfer/tabs/new_transfer.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TransferView extends StatelessWidget {
  const TransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => TransferViewModel(),
      builder: (context, model, child) {
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
                      backgroundColor: AppColors.scaffoldBg,
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25.h),
                          const PaymeAppBar(
                            isBack: true,
                            title: "Transfer",
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, top: 20.h),
                            child: AppText(
                              "Send money to",
                              color: AppColors.deepGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: AppText(
                              "Send money to new recipient/beneficiary",
                              color: AppColors.welcomeGrey,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => model.setIndex(0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: model.currentIndex == 0
                                          ? AppColors.deepGreen
                                          : AppColors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: model.currentIndex == 0
                                            ? AppColors.deepGreen
                                            : AppColors.transparentDeep,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 8.h),
                                    child: AppText(
                                      "New",
                                      color: model.currentIndex == 0
                                          ? Colors.white
                                          : AppColors.grey,
                                      fontWeight: model.currentIndex == 0
                                          ? AppFontWeight.bold
                                          : AppFontWeight.light,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () => model.setIndex(1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: model.currentIndex == 1
                                          ? AppColors.deepGreen
                                          : AppColors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: model.currentIndex == 1
                                            ? AppColors.deepGreen
                                            : AppColors.transparentDeep,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 8.h),
                                    child: AppText(
                                      "Beneficiaries",
                                      color: model.currentIndex == 1
                                          ? Colors.white
                                          : AppColors.grey,
                                      fontWeight: model.currentIndex == 1
                                          ? AppFontWeight.bold
                                          : AppFontWeight.light,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                if (model.currentIndex == 1) {
                                  return const SelectBeneficiary();
                                }
                                return NewTransfer(model: model);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
