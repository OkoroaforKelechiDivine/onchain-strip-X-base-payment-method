import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_viewmodel.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/tabs/login_w_phone.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/tabs/login_w_username.dart';
import 'package:pay_me_mobile/presentation/bottom_nav.dart';
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
          body: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: SingleChildScrollView(
              child: DefaultTabController(
                length: 2,
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
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 22),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 19, vertical: 9),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFC),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: TabBar(
                              isScrollable: false,
                              physics: const NeverScrollableScrollPhysics(),
                              onTap: model.setIndex,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.deepGreen,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: const [
                                Tab(text: 'Phone Noumber'),
                                Tab(text: 'Username'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: TabBarView(
                              children: [
                                LoginWithPhoneTab(model: model),
                                LoginWithUsernameTab(model: model),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Spacer(),
                    AppButton(
                      loading: model.isLoading,
                      onPressed: () async {
                        await model.login();
                        //navigationService.pushReplacement(const BottomNav());
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
