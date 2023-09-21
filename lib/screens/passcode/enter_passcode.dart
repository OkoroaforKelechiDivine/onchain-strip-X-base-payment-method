import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/views/auth_view/process/processing_bar.dart';

import '../../../app_config/manager/font_manager.dart';
import '../../../app_config/manager/theme_manager.dart';
import '../../views/auth_view/helper/auth_helper.dart';

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
            _verifyPassCode(enteredDigits.join());
          }
        });
      }
    }
  }

  Future<void> _verifyPassCode(String passcode) async {
    await AuthHelper.verifyPassCode(context, passcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: isProcessing ? ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0) : ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isProcessing)
                        const ProcessingBar(),
                      _buildLogo(),
                      _buildWelcomeText(),
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

  Widget _buildLogo() {
    return Image.asset('assets/png/payme.png', width: 150.0, height: 100.0);
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: [
          Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: AppFontSize.size22,
              color: AppColors.lightBlack,
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

class Keypad extends StatelessWidget {
  final Function(String) onButtonPressed;
  final List<String> enteredDigits;

  const Keypad({super.key, required this.onButtonPressed, required this.enteredDigits});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        children: [
          _buildPasscodeText(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < 6; index++) _buildCircle(index),
            ],
          ),
          _buildKeypadButtons(),
        ],
      ),
    );
  }

  Widget _buildPasscodeText() {
    return const Text(
      "Enter Passcode",
      style: TextStyle(
        fontSize: AppFontSize.size18,
        color: AppColors.lightGrey,
        fontWeight: AppFontWeight.light,
      ),
    );
  }

  Widget _buildCircle(int index) {
    return Container(
      width: 15,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: enteredDigits.length > index ? AppColors.lightBlack : Colors.transparent,
        border: Border.all(
          color: AppColors.lightBlack,
        ),
      ),
    );
  }

  Widget _buildKeypadButtons() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      shrinkWrap: true,
      itemCount: 12, // 12 keypad buttons
      itemBuilder: (BuildContext context, int index) {
        final buttonText = [
          '1', '2', '3',
          '4', '5', '6',
          '7', '8', '9',
          'Sign out', '0', 'Delete',
        ][index];
        return MaterialButton(
          onPressed: () {
            if (buttonText == 'Sign out') {
            } else {
              onButtonPressed(buttonText);
            }
          },
          child: (buttonText == 'Sign out' || buttonText == 'Delete') ? OverflowBox(
            maxWidth: 100.0,
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: AppFontSize.size20,
                fontWeight: buttonText == 'Sign out' ? AppFontWeight.bold : AppFontWeight.bold,
                fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                color: buttonText == 'Sign out' ? AppColors.lightGreen : AppColors.lightBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ) : Text(
            buttonText,
            style: TextStyle(
              fontSize: AppFontSize.size30,
              fontWeight: AppFontWeight.bold,
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
            ),
          ),
        );
      },
    );
  }
}