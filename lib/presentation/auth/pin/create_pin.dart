import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

import '../../../core/widgets/indicator.dart';
import '../finger_print/finger_print_view.dart';
import 'create_pin_viewmodel.dart';

class CreatePinView extends StatelessWidget {
  const CreatePinView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreatePinViewModel(),
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
                  title: "Create Login Pin",
                ),
                SizedBox(height: 15.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleIndicator(number: "01", text: "Business Information", circleColor: AppColors.demonicGreen, textColor: AppColors.demonicGreen, boldText: true),
                    Underline(color: AppColors.demonicGreen),
                    CircleIndicator(number: "02", text: "Personal Information", circleColor: AppColors.demonicGreen, textColor: AppColors.demonicGreen, boldText: true),
                    Underline(color: AppColors.demonicGreen),
                    CircleIndicator(number: "03", text: "Create Login Pin"),
                    Underline(),
                    CircleIndicator(number: "04", text: "Set Biometric"),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: AppText(
                    "Create Login Pin",
                    color: AppColors.deepGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                ),
                AppCustomTextField(
                  focusBorderColor: AppColors.white,
                  hintText: "Create Login Pin",
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.createPin,
                  obscureText: true,
                  maxLines: 1,
                ),
                AppCustomTextField(
                  focusBorderColor: AppColors.white,
                  hintText: "Confirm Login Pin",
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.confirmPin,
                  obscureText: true,
                  maxLines: 1,
                ),
                SizedBox(height: 300.h),
                Center(
                  child: AppButton(
                    onPressed: () {
                      navigationService.push(const FingerPrintView());
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