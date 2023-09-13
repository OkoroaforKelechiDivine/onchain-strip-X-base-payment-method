import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_config/manager/font_manager.dart';
import '../../app_config/manager/theme_manager.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  List<String> enteredDigits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildLogo(),
            _buildWelcomeText(),
            Keypad(
              enteredDigits: enteredDigits,
              onButtonPressed: _onButtonPressed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset('assets/png/payme.png', width: 150.0, height: 100.0);
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Text(
        "Welcome Back",
        style: TextStyle(
          fontSize: AppFontSize.size22,
          color: AppColors.lightBlack,
          fontFamily: GoogleFonts.alegreyaSans().fontFamily,
        ),
      ),
    );
  }

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
            _startProcessingAndNavigate();
          }
        });
      }
    }
  }

  void _startProcessingAndNavigate() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }
}

class Keypad extends StatelessWidget {
  final Function(String) onButtonPressed;
  final List<String> enteredDigits;

  Keypad({required this.onButtonPressed, required this.enteredDigits});

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
                color: buttonText == 'Sign out' ? Colors.green : AppColors.lightBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ) : Text(
            buttonText,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: AppFontWeight.bold,
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
            ),
          ),
        );
      },
    );
  }
}