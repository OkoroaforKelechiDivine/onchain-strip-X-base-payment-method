import 'package:flutter/material.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_viewmodel.dart';

import '../../../../core/cores.dart';

class LoginWithUsernameTab extends StatelessWidget {
  final SignInViewModel model;
  const LoginWithUsernameTab({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        AppCustomTextField(
          hintText: "Username",
          focusBorderColor: AppColors.white,
          backgroundColor: AppColors.white,
          borderColor: AppColors.darkWhite,
          containerPadding: const EdgeInsets.all(0),
          textEditingController: model.usernameController,
        ),
        const SizedBox(height: 20),
        AppCustomTextField(
          containerPadding: const EdgeInsets.all(0),
          focusBorderColor: AppColors.white,
          hintText: "Password",
          backgroundColor: AppColors.white,
          obscureText: model.obscureText,
          maxLines: 1,
          borderColor: AppColors.darkWhite,
          textEditingController: model.passwordController,
          suffixIcon: IconButton(
            icon: Icon(
              model.obscureText ? Icons.visibility_off : Icons.visibility,
              color: AppColors.grey,
            ),
            onPressed: () {
              model.toggleObscureText();
            },
          ),
        ),
      ],
    );
  }
}
