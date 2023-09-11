import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';

import '../../controllers/auth/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();
  bool _obscurePassword = true;

  Widget _buildLogo() {
    return Image.asset(
      "assets/png/payme.png",
      height: 80,
    );
  }

  Widget _buildWelcomeText() {
    return Text(
      "WELCOME BACK",
      textAlign: TextAlign.center,
      style: GoogleFonts.alegreyaSc(
        textStyle: const TextStyle(
          color: AppColors.lightGreen,
          fontSize: AppFontSize.size20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLockImage() {
    return Image.asset(
      "assets/jpg/lock.jpg",
      height: 70,
      width: 100,
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller, ValueChanged<String>? onChanged, bool isPassword, bool isVisible, void Function() toggleVisibility, String? errorText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            hintText,
            style: const TextStyle(color: AppColors.lightBlack, fontSize: AppFontSize.size16, fontWeight: AppFontWeight.light),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter $hintText',
            errorText: errorText,
            filled: true,
            fillColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.pureWhite,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: isPassword ? GestureDetector(
              onTap: toggleVisibility,
              child: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
            )
                : null,
          ),
          textCapitalization: TextCapitalization.none,
          textInputAction: TextInputAction.next,
          onChanged: onChanged,
          keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.text,
          obscureText: isPassword && !_obscurePassword,
          controller: controller,
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

  Widget _buildSignInButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
        child: const Text(
          'Sign in',
          style: TextStyle(
            fontSize: AppFontSize.size16,
            color: AppColors.deepWhite,
            fontWeight: AppFontWeight.bold,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView(
              children: [
                _buildLogo(),
                const SizedBox(height: 30),
                _buildWelcomeText(),
                const SizedBox(height: 25),
                _buildLockImage(),
                const SizedBox(height: 10),
                _buildTextField(
                  "Username",
                  controller.userNameController,
                  controller.clearUserNameError,
                  false, false, () {},
                  controller.userNameError.isEmpty ? null : controller.userNameError,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  "Password",
                  controller.passwordController,
                      (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _obscurePassword = true;
                      });
                    } else {
                      setState(() {
                        _obscurePassword = false;
                      });
                    }
                  }, true,
                  _obscurePassword, () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  controller.passwordError.isEmpty ? null : controller.passwordError,
                ),
                _buildForgotPasswordButton(),
                const SizedBox(height: 20),
                _buildSignInButton(context),
                const SizedBox(height: 60),
                _buildRequestForPOS(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
