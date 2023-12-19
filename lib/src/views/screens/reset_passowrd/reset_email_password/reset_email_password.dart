import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/reset_passowrd/reset_email_password/reset_email_password_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/reset_passowrd/update_password/update_password.dart';
import 'package:stacked/stacked.dart';

class ResetEmailPassword extends StatelessWidget {
  const ResetEmailPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ResetEmailPassowrdViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            //title: const AppText("Resent Password"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 28.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16.0),
                      const Text(
                        'Reset Password',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Enter your username below to reset your password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      CupertinoTextField(
                        controller: model.usernameController,
                        placeholder: 'Username',
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      AppCustomButton(
                        onPressed: () {
                          model.resetPassword();
                        },
                        color: AppColors.lightGreen,
                        loading: model.isLoading,
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
