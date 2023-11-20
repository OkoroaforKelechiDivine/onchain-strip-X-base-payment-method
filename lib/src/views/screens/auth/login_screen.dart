import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/constants/enum/view_state.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/logo.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/request_pos.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/welcome_text.dart';
import 'package:pay_me_mobile/src/views/screens/bottom_nav.dart';
import 'package:pay_me_mobile/src/views/widgets/app_button.dart';
import 'package:pay_me_mobile/src/views/widgets/app_textfield.dart';
import 'package:pay_me_mobile/core/cores.dart';

import 'package:provider/provider.dart';


import '../../../../data/view_models/auth/login_model.dart';
import 'components/lock_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String message = "";

  void toggleVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, model, child)  {
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
                  AppTextField(title: 'Username', hintText: 'Enter Username',controller: userNameController,),
                  const SizedBox(height: 20),
                  AppTextField(title: 'Password',isPassword: true, controller: passwordController,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
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
                      message,
                      style: const TextStyle(
                        fontWeight: AppFontWeight.light,
                        color: AppColors.errorRed,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  AppButton.filledButton(context,
                  color: AppColors.lightGreen,
                      child: model.state == ViewState.Busy
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text('Sign in', style: cairo(),),
                      onTap: ()async{
                        // await model.login(
                        //     username: userNameController.text,
                        //     password: passwordController.text
                        // );
                        if(model.state == ViewState.Idle){
                          _gotoNextScreen();
                        }
                      }),

                  const SizedBox(height: 50),
                  const BuildRequestForPOS()
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  _gotoNextScreen(){
    navigationService.pushReplacement(const BottomNav());
  }
}