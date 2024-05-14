import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/sign_up_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                const PaymeAppBar(
                  isBack: true,
                  title: "Sign Up",
                ),
                Padding(
                  padding: EdgeInsets.only(right: 120.w, top: 30.h),
                  child: AppText(
                    "Business Information",
                    color: AppColors.deepGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    alignment: TextAlign.start,
                  ),
                ),
                AppCustomTextField(
                  hintText: "Business name",
                  focusBorderColor: AppColors.white,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.businessName,
                ),
                AppCustomTextField(
                  focusBorderColor: AppColors.white,
                  hintText: "Business address",
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.businessAddress,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppDropDown(
                        hint: "Business registration status",
                        list: model.registrationOptions,
                        selected: model.registrationStatusIndex,
                        onChangeValue: (value) {
                          model.onRegistrationStatusChanged(value);
                        },
                        borderRadius: 8,
                        borderWidth: 1,
                        height: 45.h,
                        borderColor: AppColors.darkWhite,
                        background: AppColors.white,
                        textColor: AppColors.grey,
                        // textSize: 15.sp,
                        dropDownTextColor: AppColors.grey,
                        dropDownTextSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: model.isOptionSelected,
                  child: Column(
                    children: [
                      AppCustomTextField(
                        hintText: "Incorporate date",
                        // enabled: false,
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              model.setIncorporateDate(pickedDate);
                            }
                          },
                          child: Icon(Icons.calendar_month, color: AppColors.demonicGreen, size: 16.sp),
                        ),
                        focusBorderColor: AppColors.white,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.incorporateDateController,
                      ),
                      AppCustomTextField(
                        focusBorderColor: AppColors.white,
                        hintText: "RC number",
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.rcNumber,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                AppButton(
                  onPressed: () {},
                  color: AppColors.deepGreen,
                  title: "Continue",
                  radius: 100.r,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

