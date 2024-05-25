import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/widgets/app_text_field.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_viewmodel.dart';

class LoginWithPhoneTab extends StatelessWidget {
  final SignInViewModel model;
  const LoginWithPhoneTab({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        AppCustomTextField(
          hintText: "Phone Number",
          focusBorderColor: AppColors.white,
          backgroundColor: AppColors.white,
          borderColor: AppColors.darkWhite,
          containerPadding: const EdgeInsets.all(0),
          textEditingController: model.phoneController,
        ),
        const SizedBox(height: 20),
        AppCustomTextField(
          containerPadding: const EdgeInsets.all(0),
          focusBorderColor: AppColors.white,
          hintText: "Password",
          backgroundColor: AppColors.white,
          borderColor: AppColors.darkWhite,
          textEditingController: model.passwordController,
        ),
      ],
    );
  }
}
