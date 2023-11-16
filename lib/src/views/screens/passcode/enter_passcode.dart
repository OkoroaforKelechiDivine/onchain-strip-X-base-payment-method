import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/view_models/auth/enter_passcode_model.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/logo.dart';
import 'package:pay_me_mobile/src/views/screens/auth/components/welcome_text.dart';

import 'keypad.dart';

class EnterPassCodeScreen extends StatefulWidget {
  const EnterPassCodeScreen({Key? key}) : super(key: key);

  @override
  State<EnterPassCodeScreen> createState() => _EnterPassCodeScreenState();
}

class _EnterPassCodeScreenState extends State<EnterPassCodeScreen> {
  List<String> enteredDigits = [];
  bool isProcessing = false;
  bool isError = false;

  void _onButtonPressed(String buttonText) {
    if (buttonText == 'Delete') {
      if (enteredDigits.isNotEmpty) {
        setState(() {
          enteredDigits.removeLast();
        });
      }
    } else {
      if (enteredDigits.length < 6) {
        setState(() {
          enteredDigits.add(buttonText);
          if (enteredDigits.length == 6) {
            final passcode = enteredDigits.join();
            EnterPasscodeModel().enterPasscode(context, passcode: passcode);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: isProcessing ? ImageFilter.blur(sigmaX: 20, sigmaY: 20) : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const BuildLogo(),
                      const BuildWelcomeText(),
                      if (isError)
                        const Text(
                          'Incorrect passcode. Please try again.',
                          style: TextStyle(
                            color: AppColors.errorRed,
                            fontSize: 16.0,
                          ),
                        ),
                      Keypad(
                        enteredDigits: enteredDigits,
                        onButtonPressed: _onButtonPressed,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}