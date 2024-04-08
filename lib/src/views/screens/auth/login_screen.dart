import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/logo.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/request_pos.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/welcome_text.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/reset_passowrd/reset_email_password/reset_email_password.dart';
import 'package:pay_me_mobile/src/views/widgets/app_textfield.dart';
import 'package:pay_me_mobile/core/cores.dart';

import 'package:stacked/stacked.dart';

import 'components/lock_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView(
                children: [
                  const SizedBox(height: 50),
                  const BuildLogo(),
                  const SizedBox(height: 30),
                  const BuildWelcomeText(),
                  const SizedBox(height: 25),
                  const BuildLockImage(),
                  const SizedBox(height: 10),
                  AppTextField(
                    title: 'Username',
                    hintText: 'Enter Username',
                    controller: model.userNameController,
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    title: 'Password',
                    isPassword: true,
                    controller: model.passwordController,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        navigationService.push(const ResetEmailPassword());
                      },
                      child: Text(
                        "Forgot password?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.alegreyaSans(
                          textStyle: const TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: AppFontSize.size18,
                            fontWeight: AppFontWeight.light,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      model.message,
                      style: const TextStyle(
                        fontWeight: AppFontWeight.light,
                        color: AppColors.errorRed,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  AppCustomButton(
                    onPressed: () {
                      model.onLogin();
                    },
                    title: "Sign in",
                    loading: model.isLoading,
                    color: AppColors.lightGreen,
                    radius: 12,
                  ),
                  const SizedBox(height: 50),
                  const BuildRequestForPOS()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
