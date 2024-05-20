import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/personal_information/personal_information_viewmodel.dart';
import 'package:pay_me_mobile/presentation/auth/pin/create_pin.dart';
import 'package:stacked/stacked.dart';

class TransferView extends StatelessWidget {
  const TransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PersonalInformationViewModel(),
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
                  child: Column(
                    children: [
                      AppText(
                        "Send money to",
                        color: AppColors.deepGreen,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                      AppText(
                        "Send money to new recipient/beneficiary",
                        color: AppColors.welcomeGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppDropDown(
                        hint: "Select Bank",
                        list: model.stateOptions,
                        selected: model.stateIndex,
                        onChangeValue: (value) {
                          model.onStateChanged(value);
                        },
                        borderRadius: 8,
                        borderWidth: 1,
                        height: 45.h,
                        borderColor: AppColors.darkWhite,
                        background: AppColors.white,
                        textColor: AppColors.grey,
                        dropDownTextColor: AppColors.grey,
                        dropDownTextSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                AppCustomTextField(
                  focusBorderColor: AppColors.white,
                  hintText: "Enter account number",
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.phoneNumber,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 50.h),
                Center(
                  child: AppButton(
                    onPressed: () {
                      navigationService.push(const CreatePinView());
                    },
                    color: AppColors.deepGreen,
                    title: "Continue",
                    radius: 100.r,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}