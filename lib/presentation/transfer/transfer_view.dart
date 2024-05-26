import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/transfer/select_bank_view.dart';
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
                            child: Builder(builder: (context) {
                              if (model.currentIndex == 1) {
                                return Container(
                                  child: Column(),
                                );
                              }
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      model.onShowBank();
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 19.w,
                                                vertical: 12.h),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: AppColors.darkWhite,
                                                  width: 1),
                                              color: AppColors.white,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Visibility(
                                                  visible: model.selectedBank ==
                                                      null,
                                                  replacement: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        AppAssets.bankIcon,
                                                        height: 36,
                                                        width: 36,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      AppText(
                                                        model.selectedBank
                                                                ?.name ??
                                                            "",
                                                        color: AppColors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ],
                                                  ),
                                                  child: const AppText(
                                                    'Select Bank',
                                                    color: AppColors
                                                        .transferSelectBank,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: AppColors.dropDownBg,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                      Icons.arrow_drop_down,
                                                      color: AppColors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  AppCustomTextField(
                                    focusBorderColor: AppColors.white,
                                    hintText: "Enter account number",
                                    backgroundColor: AppColors.white,
                                    borderColor: AppColors.darkWhite,
                                    textEditingController: model.accountNumber,
                                    onChanged: (value) {
                                      if (value.length == 10) {
                                        model.getBeneficiaryDetails();
                                      }
                                    },
                                    textInputType: TextInputType.number,
                                    containerPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 20),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: const AppText(
                                              "Paste",
                                              color: AppColors.demonicGreen,
                                              fontWeight: AppFontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Image.asset(
                                              AppAssets.copy,
                                              width: 20.w,
                                              height: 20.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  if (model.beneficiaryDetailResponse != null)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: AppText(
                                        model.beneficiaryDetailResponse!.name,
                                        color: AppColors.lightYellow,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  const Spacer(),
                                  Visibility(
                                    visible:
                                        model.beneficiaryDetailResponse != null,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: AppButton(
                                        title: "Next",
                                        radius: 100.r,
                                        onPressed: () {
                                          // model.navigateToNextScreen(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                ],
                              );
                            }),
                          )
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
