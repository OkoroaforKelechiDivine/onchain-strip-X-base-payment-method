import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';

import '../../controllers/auth/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());
  bool _obscurePassword = true;

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
                Image.asset(
                  "assets/jpg/payMeLogo.jpg",
                  height: 80,
                ),
                const SizedBox(height: 30),
                Text(
                  "WELCOME BACK",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alegreyaSc(
                    textStyle: const TextStyle(
                      color: AppColors.lightGreen,
                      fontSize: AppFontSize.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Image.asset(
                  "assets/jpg/lock.jpg",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Username", style: TextStyle(color: AppColors.lightBlack, fontSize: AppFontSize.size16, fontWeight: AppFontWeight.light)),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter username',
                        errorText: controller.userNameError.value.isEmpty ? null : controller.userNameError.value,
                        filled: true,
                        fillColor: AppColors.pureWhite,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.pureWhite,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      onChanged: controller.clearUserNameError,
                      keyboardType: TextInputType.text,
                      controller: controller.userNameController,
                    ),

                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password", style: TextStyle(color: AppColors.lightBlack, fontSize: AppFontSize.size16, fontWeight: AppFontWeight.light)),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        errorText: controller.passwordError.value.isEmpty ? null : controller.passwordError.value,
                        filled: true,
                        fillColor: AppColors.pureWhite,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.pureWhite,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          child: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          // User has started typing, switch to password visibility off
                          setState(() {
                            _obscurePassword = true;
                          });
                        } else {
                          // User has not typed anything, switch to password visibility on
                          setState(() {
                            _obscurePassword = false;
                          });
                        }
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obscurePassword,
                      controller: controller.passwordController,
                    ),
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
                              fontSize: 14,
                              fontWeight: AppFontWeight.light,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(350, 60),
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            // fontFamily: ,
                            fontSize: AppFontSize.size16,
                            color: AppColors.deepWhite,
                            fontWeight: AppFontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Center(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
