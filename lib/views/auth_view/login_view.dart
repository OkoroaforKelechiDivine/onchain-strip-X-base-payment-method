import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:provider/provider.dart';

import '../../token/token_provider.dart';
import 'connectivity.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bool _obscurePassword = true;
  Dio dio = Dio();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String message = "";

  void login(String username, String password) async {
    final connectivityResult = await ConnectivityUtil.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        message = "Network problem. Please check your internet connection.";
      });
      return;
    }
    try {
      Response response = await dio.post(
        "https://dzbilqfc4qszv.cloudfront.net/auth/login",
        data: {
          "username": username,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final String token = responseData['token'];
        print("Token: $token");
        context.read<TokenProvider>().setToken(token);

        Map<String, dynamic> payload = Jwt.parseJwt(token);
        if (payload['is_first_login']) {
          Navigator.pushReplacementNamed(context, "/set_pass_code");
        } else {
          Navigator.pushReplacementNamed(context, "/enter_pass_code");
        }
        return;
      }
    } catch (e) {
      setState(() {
        message = "Login Failed, please try again.";
      });
    }
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

  Widget _buildTextField(String hintText, TextEditingController controller, bool isPassword, bool isVisible, void Function() toggleVisibility) {
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
                fontWeight: AppFontWeight.light
            ),
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter $hintText',
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
                color: AppColors.lightBlack,
              ),
            ) : null,
          ),
          textCapitalization: TextCapitalization.none,
          textInputAction: TextInputAction.next,
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
          login(
              userNameController.text.toString(),
              passwordController.text.toString()
          );
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
              _buildTextField(
                "Username",
                userNameController,
                false,
                false,
                    (){}
              ),
              const SizedBox(height: 20),
              _buildTextField(
                "Password",
                passwordController,
                false,
                false,
                    (){}
              ),
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
              const SizedBox(height: 10),
              _buildSignInButton(context),
              const SizedBox(height: 60),
              _buildRequestForPOS(),
            ],
          ),
        ),
      ),
    );
  }
}