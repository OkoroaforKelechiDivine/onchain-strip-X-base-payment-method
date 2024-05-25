import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer_viewmodel.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/select_bank_view.dart';
import 'package:stacked/stacked.dart';
import '../../core/widgets/app_toggle_button.dart';

class TransferView extends StatelessWidget {
  const TransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransferViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: SingleChildScrollView(
            child: Column(
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
                  child: AppToggleButtons(
                    selectedOption: model.selectedOption,
                    onOptionSelected: model.updateSelectedOption,
                    firstText: 'New',
                    secondText: 'Beneficiaries',
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () async {
                    final selectedBank = await navigationService.push(const SelectBankView());
                    if (selectedBank != null) {
                      model.updateSelectedBank(selectedBank['name']!, selectedBank['logo']!);
                    }
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.darkWhite, width: 1),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (model.selectedBankLogo != null) ...[
                                  Row(
                                    children: [
                                      Image.asset(
                                        model.selectedBankLogo!,
                                      ),
                                      SizedBox(width: 10.w),
                                      AppText(
                                        model.selectedBank != null && model.selectedBank!.isNotEmpty ? model.selectedBank! : 'Select Bank',
                                        color: AppColors.grey,
                                      ),
                                    ],
                                  ),
                                ] else ...[
                                  const AppText(
                                    'Select Bank',
                                    color: AppColors.grey,
                                  ),
                                ],
                                const Icon(Icons.arrow_drop_down, color: AppColors.grey),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppCustomTextField(
                  focusBorderColor: AppColors.white,
                  hintText: "Enter account number",
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.accountNumber,
                  textInputType: TextInputType.number,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const AppText("Paste", color: AppColors.demonicGreen, fontWeight: AppFontWeight.bold,),
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
                SizedBox(height: 10.h),
                if (model.accountName != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: AppText(
                      "${model.accountName}",
                      color: AppColors.lightYellow,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                SizedBox(height: 100.h),
                Opacity(
                  opacity: model.accountName != null ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: AppButton(
                      title: "Next",
                      radius: 100.r,
                      onPressed: () {
                        model.navigateToNextScreen(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}