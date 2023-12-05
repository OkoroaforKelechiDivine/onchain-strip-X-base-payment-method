import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/widgets/screen_button.dart';
import 'package:pay_me_mobile/data/datasources/local/base/local_storage_service.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/logo.dart';
import 'package:pay_me_mobile/src/views/screens/auth/login_screen.dart';
import 'package:pay_me_mobile/src/views/screens/passcode/passcode_viewmodel.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

class PassCodeScreen extends StatelessWidget {
  final Widget page;
  const PassCodeScreen({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: const TextStyle(
        fontSize: 40,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return ViewModelBuilder<PasscodeViewModel>.reactive(
        viewModelBuilder: () => PasscodeViewModel(),
        builder: (context, model, _) {
          return Scaffold(
              body: Form(
            key: model.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Center(child: BuildLogo()),
                  const SizedBox(height: 16),
                  AppText(
                    appGlobals.user?.isFirstLogin ?? false
                        ? "Welcome ${appGlobals.user?.firstName}, Set your 6-Digit PIN"
                        : "Welcome back ${appGlobals.user?.firstName}, Enter your 6-Digit PIN",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const AppText("Not your account?"),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () async {
                          await LocalStorageService.clear();
                          navigationService
                              .pushAndRemoveUntil(const LoginScreen());
                        },
                        child: const AppText("Log out"),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: Pinput(
                      controller: model.pinController,
                      focusNode: model.focusNode,
                      obscureText: true,
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 8),
                      // validator: (value) {
                      //   //return value == '2222' ? null : 'Pin is incorrect';
                      // },
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) async {
                        debugPrint('onChanged: $value');
                        if (value.length == 6) {
                          final result = await model.onPassCode(
                            value,
                          );
                          if (result) {
                            navigationService.pushReplacement(page);
                          }
                        }
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            width: 22,
                            height: 1,
                            color: focusedBorderColor,
                          ),
                        ],
                      ),
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          color: fillColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: focusedBorderColor),
                        ),
                      ),
                      errorPinTheme: defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          //color: Colors.red,
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          //height: MediaQuery.of(context).size.height * 0.5,
                          child: Table(
                            children: [
                              TableRow(
                                children: [
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('1');
                                    },
                                    digit: '1',
                                  ),
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('2');
                                    },
                                    digit: '2',
                                  ),
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('3');
                                    },
                                    digit: '3',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('4');
                                    },
                                    digit: '4',
                                  ),
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('5');
                                    },
                                    digit: '5',
                                  ),
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('6');
                                    },
                                    digit: '6',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('7');
                                    },
                                    digit: '7',
                                  ),
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('8');
                                    },
                                    digit: '8',
                                  ),
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('9');
                                    },
                                    digit: '9',
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const EmptyScreenButton(),
                                  ScreenButton(
                                    onPressed: () {
                                      model.onButtonClick('0');
                                    },
                                    digit: '0',
                                  ),
                                  BackSpaceButton(
                                    onPressed: () {
                                      model.onBackspace();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        });
  }
}
