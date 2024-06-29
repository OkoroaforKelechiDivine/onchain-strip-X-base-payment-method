import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/pages/business_info.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/pages/create_pin_page.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/pages/personal_info.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/sign_up_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../core/widgets/indicator.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              const PaymeAppBar(
                isBack: true,
                title: "Sign Up",
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      model.navigateToPage(0);
                    },
                    child: CircleIndicator(
                      number: "01",
                      text: "Business Information",
                      circleColor: model.currentPage == 0
                          ? AppColors.demonicGreen
                          : null,
                      textColor: model.currentPage == 0
                          ? AppColors.demonicGreen
                          : null,
                      boldText: model.currentPage == 0,
                    ),
                  ),
                  Underline(
                    color: model.currentPage == 0
                        ? AppColors.demonicGreen
                        : null,
                  ),
                  GestureDetector(
                    onTap: () {
                      model.navigateToPage(1);
                    },
                    child: CircleIndicator(
                      number: "02",
                      text: "Personal Information",
                      circleColor: model.currentPage == 1
                          ? AppColors.demonicGreen
                          : null,
                      textColor: model.currentPage == 1
                          ? AppColors.demonicGreen
                          : null,
                      boldText: model.currentPage == 1,
                    ),
                  ),
                  Underline(
                    color: model.currentPage == 1
                        ? AppColors.demonicGreen
                        : null,
                  ),
                  GestureDetector(
                    onTap: () {
                      model.navigateToPage(2);
                    },
                    child: CircleIndicator(
                      number: "03",
                      text: "Create Login Pin",
                      circleColor: model.currentPage == 2
                          ? AppColors.demonicGreen
                          : null,
                      textColor: model.currentPage == 2
                          ? AppColors.demonicGreen
                          : null,
                      boldText: model.currentPage == 2,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: model.pageController,
                  physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling
                  children: [
                    BusinessInfo(model: model),
                    PersonalInfo(model: model),
                    CreatePinPage(model: model),
                  ],
                ),
              ),
              Center(
                child: AppButton(
                  loading: model.isLoading,
                  onPressed: () {
                    model.validateForm();
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
        );
      },
    );
  }
}
