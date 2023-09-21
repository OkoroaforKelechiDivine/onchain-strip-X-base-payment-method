import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/data/constants/enum/view_state.dart';
import 'package:provider/provider.dart';

import '../../../widgets/app_button.dart';
import '../../view_models/auth/login_model.dart';

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

  Widget _buildLogo() {
    return Image.asset(
      "assets/png/payme.png",
      height: 50,
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      "WELCOME BACK",
      textAlign: TextAlign.center,
      style: GoogleFonts.alegreyaSc(
        textStyle: const TextStyle(
          color: AppColors.lightGreen,
          fontSize: AppFontSize.size18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLockImage() {
    return Image.asset(
      "assets/jpg/lock.jpg",
      height: 50,
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller,
      bool isPassword, bool isVisible, void Function() toggleVisibility) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            hintText,
            style: const TextStyle(
              color: AppColors.lightBlack,
              fontSize: AppFontSize.size16,
              fontWeight: AppFontWeight.light,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: AppColors.deepWhite,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGrey.withOpacity(0.1),
                blurRadius: 4,
              ),
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter $hintText',
              filled: true,
              hintStyle: const TextStyle(
                  color: AppColors.lightGrey, fontSize: AppFontSize.size12
              ),
              fillColor: AppColors.deepWhite,
              border: InputBorder.none,
              suffixIcon: isPassword ? GestureDetector(
                onTap: toggleVisibility,
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.lightGrey,
                ),
              )
                  : null,
            ),
            textCapitalization: TextCapitalization.none,
            textInputAction: TextInputAction.next,
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : TextInputType.text,
            obscureText: isPassword ? !isVisible : false,
            controller: controller,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot password?",
          textAlign: TextAlign.center,
          style: GoogleFonts.alegreyaSans(
            textStyle: const TextStyle(
              color: AppColors.lightBlack,
              fontSize: 14,
              fontWeight: AppFontWeight.light,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequestForPOS() {
    return Center(
      child: Text(
        "Request for POS?",
        style: GoogleFonts.alegreyaSans(
          textStyle: const TextStyle(
            color: AppColors.lightGrey,
            fontSize: AppFontSize.size18,
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context) {
    final model = Provider.of<LoginViewModel>(context);
    if (model.message != null && model.state == ViewState.Error) {
      return Text(
        model.message!,
        style: const TextStyle(
          fontWeight: AppFontWeight.light,
          color: AppColors.errorRed,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
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
                  _buildLogo(),
                  const SizedBox(height: 30),
                  _buildWelcomeText(),
                  const SizedBox(height: 25),
                  _buildLockImage(),
                  const SizedBox(height: 10),
                  _buildTextField("Username", userNameController, false, false, (){}),
                  const SizedBox(height: 20),
                  _buildTextField("Password", passwordController, true, _obscurePassword, toggleVisibility),
                  _buildForgotPasswordButton(),
                  Center(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontWeight: AppFontWeight.light,
                        color: AppColors.errorRed,
                      ),
                    ),
                  ),
                  _buildErrorMessage(context),
                  const SizedBox(height: 10),
                  appButton(context, onPressed: ()async{
                    await model.login(
                        username: userNameController.text,
                        password: passwordController.text
                    );
                    if(model.state == ViewState.Retrieved){
                      _gotoNextScreen();
                    }
                    }, loginState: model),
                  const SizedBox(height: 60),
                  _buildRequestForPOS(),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  _gotoNextScreen(){
    Navigator.pushReplacementNamed(context, "/enter_pass_code");
  }
}