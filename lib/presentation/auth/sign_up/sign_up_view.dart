import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                const PaymeAppBar(
                  isBack: true,
                  title: "Sign Up",
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 30.h),
                  child: AppText(
                    "Business Information",
                    color: AppColors.deepGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
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
                      Stack(
                        children: [
                          AppCustomTextField(
                            hintText: "Incorporate date",
                            disableTyping: true,
                            focusBorderColor: AppColors.white,
                            backgroundColor: AppColors.white,
                            borderColor: AppColors.darkWhite,
                            textEditingController: model.incorporateDateController,
                          ),
                          Positioned(
                            right: 20,
                            top: 20,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () async {
                                final DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null) {
                                  final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                  model.setIncorporateDate(formattedDate);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(Icons.calendar_month, color: AppColors.demonicGreen, size: 16.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppCustomTextField(
                        focusBorderColor: AppColors.white,
                        hintText: "RC number",
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.rcNumber,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150.h),
                Center(
                  child: AppButton(
                    onPressed: () {},
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
