import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../sign_up/sign_up_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          //appBar: const PaymeAppBar(isBack: true),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const PaymeAppBar(
                      isBack: true,
                      title: "Sign In",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AppText(
                        "Welcome back",
                        color: AppColors.deepGreen,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AppText(
                        "Hey you’re back, fill in your details to get back in",
                        color: AppColors.welcomeGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19, vertical: 9),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFC),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                model.setIndex(0);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 11),
                                decoration: BoxDecoration(
                                  color: model.currentIndex == 0
                                      ? AppColors.deepGreen
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: AppText(
                                    "Phone Number",
                                    color: model.currentIndex == 0
                                        ? AppColors.white
                                        : AppColors.deepGreen,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                model.setIndex(1);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: model.currentIndex == 1
                                      ? AppColors.deepGreen
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: AppText(
                                    "Username",
                                    color: model.currentIndex == 1
                                        ? AppColors.white
                                        : AppColors.deepGreen,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Builder(
                        builder: (context) {
                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              Visibility(
                                visible: model.currentIndex == 1,
                                replacement: AppCustomTextField(
                                  focusBorderColor: AppColors.white,
                                  containerPadding: EdgeInsets.all(0),
                                  hintText: "Phone number",
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.only(top: 15, left: 10),
                                    child: AppText(
                                      "+234 |  ",
                                      color: AppColors.transparentDeep,
                                    ),
                                  ),
                                  backgroundColor: AppColors.white,
                                  borderColor: AppColors.darkWhite,
                                  textEditingController: model.phoneController,
                                  textInputType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Phone number is required";
                                    }
                                    return null;
                                  },
                                ),
                                child: AppCustomTextField(
                                  hintText: "Username",
                                  focusBorderColor: AppColors.white,
                                  backgroundColor: AppColors.white,
                                  borderColor: AppColors.darkWhite,
                                  containerPadding: const EdgeInsets.all(0),
                                  textEditingController:
                                      model.usernameController,
                                ),
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
                                    model.obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: AppColors.grey,
                                  ),
                                  onPressed: () {
                                    model.toggleObscureText();
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppText(
                            "Forget Password?",
                            color: AppColors.profileLightGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            onPress: () {},
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    AppButton(
                      loading: model.isLoading,
                      onPressed: () async {
                        await model.login();
                      },
                      color: AppColors.deepGreen,
                      title: "Login",
                      radius: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          "First time here? ",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        AppText(
                          "Create an Account",
                          onPress: () {
                            navigationService
                                .pushReplacement(const SignUpView());
                          },
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.lightGreen,
                          isTextButton: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
