import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/change_password/change_password_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ChangePassowrdViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(23, 171, 144, 1),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: model.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const AppText(
                    'Enter your current password',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 10),
                  //AppTextField
                  AppCustomTextField(
                    obscureText: model.obscureCurrentPassword,
                    textEditingController: model.currentPasswordController,
                    hintText: "Enter your current password",
                    maxLines: 1,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        model.toggleCurrentPasswordVisibility();
                      },
                      child: Icon(
                        model.obscureCurrentPassword == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AppText(
                    'Enter your new password',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 10),
                  AppCustomTextField(
                    obscureText: model.obscureNewPassword,
                    textEditingController: model.newPasswordController,
                    hintText: "Enter your new password",
                    maxLines: 1,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        model.toggleNewPasswordVisibility();
                      },
                      child: Icon(
                        model.obscureNewPassword == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AppText(
                    'Confirm your new password',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 20),
                  AppCustomTextField(
                    obscureText: model.obscureConfirmPassword,
                    textEditingController: model.confirmPasswordController,
                    maxLines: 1,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        model.toggleConfirmPasswordVisibility();
                      },
                      child: Icon(
                        model.obscureConfirmPassword == false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 16.sp,
                      ),
                    ),
                    hintText: "Confirm your new password",
                    validator: (value) {
                      if (value != model.newPasswordController.text) {
                        snackbarService.error(
                            message: "Password does not match");
                        return;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AppCustomButton(
                    title: 'Change Password',
                    onPressed: () {
                      model.onChangePassword();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
