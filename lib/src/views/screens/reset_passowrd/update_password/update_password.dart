import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/reset_passowrd/update_password/update_password_viewmodel.dart';
import 'package:stacked/stacked.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UpdatePasswordViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const AppText(
                    'Reset Password',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8.0),
                  const AppText(
                    'Enter your username, token and new Password below to reset your password',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 24.0),
                  const AppText("Enter Username"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.usernameController,
                    hintText: 'Enter Username',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Enter Token"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.tokenController,
                    hintText: 'Enter Token',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 16.0),
                  const AppText("Enter New Password"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: model.passwordController,
                    hintText: 'Enter New Password',
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 45.0),
                  AppCustomButton(
                    onPressed: () {
                      model.resetPassword();
                    },
                    color: AppColors.lightGreen,
                    loading: model.isLoading,
                    child: const AppText(
                      'Reset Password',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
