import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/personal_information/personal_information_viewmodel.dart';
import 'package:pay_me_mobile/presentation/auth/pin/create_pin.dart';
import 'package:stacked/stacked.dart';

import '../../../core/widgets/indicator.dart';
import 'gender_selection.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PersonalInformationViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: ScrollbarTheme(
            data: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(AppColors.deepGreen),
            ),
            child: Scrollbar(
              radius: const Radius.circular(6),
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      const PaymeAppBar(
                        isBack: true,
                        title: "Sign Up",
                      ),
                      SizedBox(height: 15.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleIndicator(number: "01", text: "Business Information", circleColor: AppColors.demonicGreen, textColor: AppColors.demonicGreen, boldText: true),
                          Underline(color: AppColors.demonicGreen),
                          CircleIndicator(number: "02", text: "Personal Information"),
                          Underline(),
                          CircleIndicator(number: "03", text: "Create Login Pin"),
                          Underline(),
                          CircleIndicator(number: "04", text: "Set Biometric"),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 20.h),
                        child: AppText(
                          "Personal Information",
                          color: AppColors.deepGreen,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                        ),
                      ),
                      AppCustomTextField(
                        hintText: "Last name",
                        focusBorderColor: AppColors.white,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.lastName,
                      ),
                      AppCustomTextField(
                        focusBorderColor: AppColors.white,
                        hintText: "First name",
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.firstName,
                      ),
                      AppCustomTextField(
                        focusBorderColor: AppColors.white,
                        hintText: "Email address",
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.emailAddress,
                      ),
                      AppCustomTextField(
                        focusBorderColor: AppColors.white,
                        hintText: "BVN",
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.bvn,
                        textInputType: TextInputType.number,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppDropDown(
                              hint: "State",
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
                      GenderSelectionWidget(
                        selectedIndex: model.genderIndex,
                        onChanged: (value) {
                          model.onGenderChanged(value);
                        },
                      ),
                      AppCustomTextField(
                        focusBorderColor: AppColors.white,
                        hintText: "Phone number",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(top: 15, left: 10),
                          child: AppText("+234", color: AppColors.transparentDeep,),
                        ),
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.phoneNumber,
                        textInputType: TextInputType.number,
                      ),
                      AppCustomTextField(
                        focusBorderColor: AppColors.white,
                        hintText: "Password",
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.password,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
